# Build

```sh
mkdir build && cd build
cmake -G Ninja .. -DMLIR_DIR=$PREFIX/lib/cmake/mlir -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit
cmake --build . --target check-standalone-opt
```

Build documentation from TableGen.

```sh
cmake --build . --target mlir-doc
```

<!-- pass -DLLVM_INSTALL_UTILS=ON when building LLVM -->
