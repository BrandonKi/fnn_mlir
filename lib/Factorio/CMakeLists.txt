add_mlir_dialect_library(MLIRFactorio
    FactorioDialect.cpp
    FactorioOps.cpp

    ADDITIONAL_HEADER_DIRS
    ${PROJECT_SOURCE_DIR}/include/Factorio

    DEPENDS
    MLIRFactorioOpsIncGen

    LINK_LIBS PUBLIC
    MLIRIR
    MLIRInferTypeOpInterface
)
