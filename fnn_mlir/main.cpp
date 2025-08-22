#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/Bufferization/Transforms/FuncBufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Transforms/DialectConversion.h"

#include "Factorio/FactorioDialect.h"
#include "Factorio/FactorioOps.h"
#include "Factorio/FactorioOps.h.inc"
#include "Factorio/FactorioOpsDialect.cpp.inc"

struct AddiToFactorioAddPattern
    : public mlir::OpConversionPattern<mlir::arith::AddIOp> {
    using mlir::OpConversionPattern<mlir::arith::AddIOp>::OpConversionPattern;

    mlir::LogicalResult
    matchAndRewrite(mlir::arith::AddIOp op,
                    mlir::arith::AddIOp::Adaptor adaptor,
                    mlir::ConversionPatternRewriter &rewriter) const override {
        llvm::outs() << "Replacing Op " << op->getName() << "\n";
        auto newOp = rewriter.replaceOpWithNewOp<mlir::factorio::AddOp>(
            op, op.getType(), adaptor.getOperands());
        llvm::outs() << "Replaced Op with " << newOp->getName() << "\n";
        return mlir::success();
    }
};

struct ConvertArithToFactorioPass
    : public mlir::PassWrapper<ConvertArithToFactorioPass,
                               mlir::OperationPass<mlir::ModuleOp>> {
    MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(ConvertArithToFactorioPass)

    void getDependentDialects(mlir::DialectRegistry &registry) const override {
        registry.insert<mlir::arith::ArithDialect>();
        registry.insert<mlir::factorio::FactorioDialect>();
    }

    void runOnOperation() override {
        mlir::MLIRContext &context = getContext();
        mlir::RewritePatternSet patterns(&context);
        mlir::ConversionTarget target(context);

        target.addLegalDialect<mlir::arith::ArithDialect>();
        target.addIllegalOp<mlir::arith::AddIOp>();

        target.addLegalDialect<mlir::factorio::FactorioDialect>();

        patterns.add<AddiToFactorioAddPattern>(&context);

        if (mlir::failed(mlir::applyPartialConversion(getOperation(), target,
                                                      std::move(patterns)))) {
            signalPassFailure();
        }
    }

    llvm::StringRef getArgument() const final { return "add-pattern"; }
    llvm::StringRef getDescription() const final { return "replace add"; }
};

struct WrapMainPass : public mlir::PassWrapper<WrapMainPass, mlir::OperationPass<mlir::ModuleOp>> {
  void runOnOperation() override {
    mlir::ModuleOp module = getOperation();
    mlir::MLIRContext *ctx = module.getContext();
    mlir::OpBuilder builder(ctx);

    // Rename original main -> model
    auto mainFunc = module.lookupSymbol<mlir::func::FuncOp>("main");
    if (!mainFunc) {
      module.emitError("Original @main not found");
      return signalPassFailure();
    }
    mainFunc.setName("model");

    // Create llvm.printf declaration
    auto printfType = builder.getFunctionType({builder.getType<mlir::LLVM::LLVMPointerType>()}, builder.getIntegerType(32));
    if (!module.lookupSymbol("printf")) {
      builder.setInsertionPointToStart(module.getBody());
      builder.create<mlir::func::FuncOp>(module.getLoc(), "printf", printfType).setPrivate();
    }

    // Create @main
    builder.setInsertionPointToStart(module.getBody());
    auto newMainType = builder.getFunctionType({}, builder.getIntegerType(32));
    auto newMain = builder.create<mlir::func::FuncOp>(module.getLoc(), "main", newMainType);
    auto &entry = *newMain.addEntryBlock();
    builder.setInsertionPointToStart(&entry);

    // Constant tensor input: [[1.0, 2.0, 3.0]]
    auto f32 = builder.getF32Type();
    auto inputType = mlir::RankedTensorType::get({1, 3}, f32);
    auto inputAttr = mlir::DenseElementsAttr::get(inputType, {1.0f, 2.0f, 3.0f});
    auto constInput = builder.create<mlir::arith::ConstantOp>(module.getLoc(), inputAttr);

    // Call model
    auto call = builder.create<mlir::func::CallOp>(
        module.getLoc(), mlir::SymbolRefAttr::get(ctx, "model"),
        mlir::TypeRange{inputType}, mlir::ValueRange{constInput});
    mlir::Value result = call.getResult(0);

    // Extract first element (0, 0) from result for printing
    auto zero = builder.create<mlir::arith::ConstantIndexOp>(module.getLoc(), 0);
    mlir::Value extract = builder.create<mlir::tensor::ExtractOp>(module.getLoc(), result, mlir::ValueRange{zero, zero});

    // Create format string: "%f\n"
    auto fmtType = mlir::LLVM::LLVMPointerType::get(ctx);
    const char *fmtStr = "%f\n";
    auto fmtAttr = builder.getStringAttr(fmtStr);
    auto fmtConst = builder.create<mlir::func::ConstantOp>(
        module.getLoc(), fmtType,
        mlir::SymbolRefAttr::get(builder.getContext(), "printf"));
        // builder.getSymbolRefAttr("printf"));

    auto globalStr = builder.create<mlir::LLVM::GlobalOp>(
        module.getLoc(), fmtType, /*isConstant=*/true,
        mlir::LLVM::Linkage::Internal, "fmt", builder.getStringAttr(fmtStr));
    builder.setInsertionPointAfter(globalStr);
    auto addr = builder.create<mlir::LLVM::AddressOfOp>(module.getLoc(), fmtType, mlir::FlatSymbolRefAttr::get(builder.getContext(), globalStr.getSymName()));
    auto casted = builder.create<mlir::LLVM::BitcastOp>(module.getLoc(), fmtType, addr);

    // Call printf
    builder.create<mlir::func::CallOp>(module.getLoc(), "printf",
                                 mlir::TypeRange{builder.getI32Type()},
                                 mlir::ValueRange{casted, extract});

    // Return 0
    auto i32Type = mlir::IntegerType::get(ctx, 32);
    auto retZero = builder.create<mlir::arith::ConstantIntOp>(module.getLoc(), 0, 32);
    builder.create<mlir::func::ReturnOp>(module.getLoc(), retZero.getResult());
  }

  mlir::StringRef getArgument() const final { return "wrap-main"; }
  mlir::StringRef getDescription() const final { return "Replace main with a wrapper that calls model and prints the result"; }
};

int main(int argc, char **argv) {
    mlir::registerAllPasses();
    mlir::PassRegistration<ConvertArithToFactorioPass>();
    mlir::PassRegistration<WrapMainPass>();

    mlir::DialectRegistry registry;
    registry.insert<mlir::factorio::FactorioDialect>();
    registerAllDialects(registry);

    return mlir::asMainReturnCode(
        mlir::MlirOptMain(argc, argv, "Factorio MLIR driver\n", registry));
}
