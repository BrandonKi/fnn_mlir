#ifndef FACTORIO_DIALECT
#define FACTORIO_DIALECT

include "mlir/IR/OpBase.td"

def Factorio_Dialect : Dialect {
    let name = "factorio";
    let summary = "A factorio out-of-tree MLIR dialect.";
    let description = [{
        This dialect is an example of an out-of-tree MLIR dialect designed to
        illustrate the basic setup required to develop MLIR-based tools without
        working inside of the LLVM source tree.
    }];
    let cppNamespace = "::mlir::factorio";
}

class Factorio_Op<string mnemonic, list<Trait> traits = []> :
        Op<Factorio_Dialect, mnemonic, traits>;

#endif // FACTORIO_DIALECT
