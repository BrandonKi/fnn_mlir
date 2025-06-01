get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

set(LIBS
    ${dialect_libs}
    ${conversion_libs}
    MLIROptLib
    MLIRFactorio
    MLIRFuncDialect
    MLIRBufferizationDialect
    MLIRBufferizationTransforms
)
add_llvm_executable(fnn_mlir main.cpp)

llvm_update_compile_flags(fnn_mlir)
# target_compile_options(fnn_mlir PRIVATE "-gen-reproducer")
target_link_libraries(fnn_mlir PRIVATE ${LIBS})
