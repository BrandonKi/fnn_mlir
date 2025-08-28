
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# TODO, remove hardcoded path
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

# if [ ! -d ${SCRIPT_DIR}/build ]; then
#     mkdir build
# fi
# cd build
# cmake -G Ninja .. \
#   -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
#   -DLLVM_DIR=$LLVM_REPO/build/lib/cmake/llvm \
#   -DMLIR_DIR=$LLVM_REPO/build/lib/cmake/mlir \
# cd ..

# error if git-clang-format is not found
if ! command -v git-clang-format &> /dev/null; then
    echo "Error: git-clang-format could not be found. Please install clang-format and add it to your PATH."
    exit 1
fi

# set up pre-commit hook for git-clang-format
if [ ! -f .git/hooks/pre-commit ]; then
    echo "Setting up git pre-commit hooks..."
    mkdir -p .git/hooks
    cp pre-commit .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
fi
