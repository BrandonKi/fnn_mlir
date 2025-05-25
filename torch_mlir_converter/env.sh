SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

python3 -m venv $SCRIPT_DIR/mlir_venv
source $SCRIPT_DIR/mlir_venv/bin/activate
