
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$LLVM_REPO" ]; then
    export LLVM_REPO=$(realpath "${SCRIPT_DIR}/../fnn2/llvm-project")
fi

if [ -z "$MLIR_DIR" ]; then
    export MLIR_DIR=$LLVM_REPO/lib/cmake/mlir
fi

if [ -z "$LLVM_REPO" ]; then
    echo "Error: LLVM_REPO is not set. Please set LLVM_REPO to the path of your LLVM repository."
    exit 1
fi

export BUILD_DIR=$LLVM_REPO/build
export INSTALL_DIR=$LLVM_REPO/install

if [ ! -d ${SCRIPT_DIR}/build ]; then
    mkdir build
fi
cd build
mkdir build && cd build
cmake -G Ninja .. \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
  -DLLVM_DIR=$LLVM_REPO/build/lib/cmake/llvm \
  -DMLIR_DIR=$LLVM_REPO/build/lib/cmake/mlir \

