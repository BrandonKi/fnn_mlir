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

struct RenameMainToModelPattern : public mlir::OpRewritePattern<mlir::func::FuncOp> {
  using OpRewritePattern::OpRewritePattern;

  mlir::LogicalResult matchAndRewrite(mlir::func::FuncOp op,
                                      mlir::PatternRewriter &rewriter) const override {
    if (op.getName() != "main")
      return mlir::failure();
    op.setName("model");
    return mlir::success();
  }
};

struct RenameMainToModelPass
    : public mlir::PassWrapper<RenameMainToModelPass,
                               mlir::OperationPass<mlir::ModuleOp>> {
    MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(RenameMainToModelPass)

    void getDependentDialects(mlir::DialectRegistry &registry) const override {
        registry.insert<mlir::func::FuncDialect>();
    }

void runOnOperation() override {
    mlir::MLIRContext &context = getContext();
        mlir::RewritePatternSet patterns(&context);
        mlir::ConversionTarget target(context);

        patterns.add<RenameMainToModelPattern>(&context);

        if (mlir::failed(mlir::applyPartialConversion(getOperation(), target,
                                                      std::move(patterns)))) {
            signalPassFailure();
        }
    }

    llvm::StringRef getArgument() const final { return "rename-main-to-model"; }
    llvm::StringRef getDescription() const final { return "rename the main function to 'model' to remove UB"; }
};

int main(int argc, char **argv) {
    mlir::registerAllPasses();
    mlir::PassRegistration<ConvertArithToFactorioPass>();
    mlir::PassRegistration<RenameMainToModelPass>();

    mlir::DialectRegistry registry;
    registry.insert<mlir::factorio::FactorioDialect>();
    registerAllDialects(registry);

    return mlir::asMainReturnCode(
        mlir::MlirOptMain(argc, argv, "Factorio MLIR driver\n", registry));
}
