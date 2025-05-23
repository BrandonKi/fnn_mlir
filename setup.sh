# export LLVM_DIR=/usr/lib/llvm-18
# export MLIR_DIR=$LLVM_DIR/lib/cmake/mlir

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Replace the following with the actual path to LLVM
export LLVM_REPO=$(realpath ${SCRIPT_DIR}/../fnn2/llvm-project)
# export LLVM_REPO=

if [ -z "$LLVM_REPO" ]; then
  echo "Error: LLVM_REPO is not set. Please set LLVM_REPO to the path of your LLVM repository."
  exit 1
fi

export BUILD_DIR=$LLVM_REPO/build
export INSTALL_DIR=$LLVM_REPO/install


