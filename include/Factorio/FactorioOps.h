#ifndef FACTORIO_FACTORIOOPS_H
#define FACTORIO_FACTORIOOPS_H

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/Interfaces/InferTypeOpInterface.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#define GET_OP_CLASSES
#include "Factorio/FactorioOps.h.inc"

#endif // FACTORIO_FACTORIOOPS_H
