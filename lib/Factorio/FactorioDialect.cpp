#include "Factorio/FactorioDialect.h"
#include "Factorio/FactorioOps.h"

using namespace mlir;
using namespace mlir::factorio;

void FactorioDialect::initialize() {
    addOperations<
#define GET_OP_LIST
#include "Factorio/FactorioOps.cpp.inc"
    >();
}
