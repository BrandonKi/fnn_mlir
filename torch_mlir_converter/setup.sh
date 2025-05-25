SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/env.sh
pip install torch-mlir -f https://github.com/llvm/torch-mlir-release/releases/expanded_assets/dev-wheels
# pip install --pre torch torchvision --index-url https://download.pytorch.org/whl/nightly/cpu
# pip install --pre torch-mlir -f https://llvm.github.io/torch-mlir/package-index/

python -c "import torch_mlir; print(torch_mlir.__file__)"

