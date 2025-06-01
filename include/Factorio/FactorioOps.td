#ifndef FACTORIO_OPS
#define FACTORIO_OPS

include "FactorioDialect.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def Factorio_AddOp : Factorio_Op<"add", [Pure]> {
    let summary = "factorio add operation";
    let description = [{
        Adds two integers, just like arith.addi.
    }];

    let arguments = (ins
        I32:$lhs,
        I32:$rhs
    );

    let results = (outs
        I32:$res
    );

    let assemblyFormat = "$lhs `,` $rhs attr-dict `:` type($res)";
}

#endif // FACTORIO_OPS
