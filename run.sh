SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

${SCRIPT_DIR}/build/bin/fnn_mlir --mlir-print-ir-after-all \
--one-shot-bufferize="bufferize-function-boundaries=1" \
--buffer-deallocation-pipeline \
--convert-bufferization-to-memref \
--convert-linalg-to-affine-loops \
--lower-affine \
--convert-scf-to-cf \
--normalize-memrefs \
--expand-strided-metadata \
--finalize-memref-to-llvm \
--convert-index-to-llvm \
--convert-arith-to-llvm \
--convert-cf-to-llvm \
--convert-func-to-llvm \
--convert-ub-to-llvm \
--reconcile-unrealized-casts \
${SCRIPT_DIR}/mlir_samples/linalg.mlir \
-o ${SCRIPT_DIR}/mlir_samples/linalg_llvm.mlir \
> ${SCRIPT_DIR}/log.txt 2>&1

# This pass doesn't work for some reason
# --convert-to-llvm \

$LLVM_REPO/build/bin/mlir-translate --mlir-to-llvmir ${SCRIPT_DIR}/mlir_samples/linalg_llvm.mlir -o ${SCRIPT_DIR}/mlir_samples/output.ll

$LLVM_REPO/build/bin/lli ${SCRIPT_DIR}/mlir_samples/output.ll
