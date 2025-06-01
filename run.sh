SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building FNN MLIR..."
cmake --build "${SCRIPT_DIR}/build" -j8
echo -e "Build complete.\n"

INPUT="small.mlir"
INTERMEDIATE_1="1_${INPUT}"
OUTPUT="small_output.ll"

echo "Running Passes..."
${SCRIPT_DIR}/build/bin/fnn_mlir --mlir-print-ir-after-all \
--rename-main-to-model \
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
${SCRIPT_DIR}/mlir_samples/${INPUT} \
-o ${SCRIPT_DIR}/mlir_samples/${INTERMEDIATE_1} \
> ${SCRIPT_DIR}/log.txt 2>&1
echo "Passes complete. Output written to ${SCRIPT_DIR}/mlir_samples/${INTERMEDIATE_1}"
echo -e "Log written to ${SCRIPT_DIR}/log.txt\n"

# This pass doesn't work for some reason
# --convert-to-llvm \

echo "Translating to LLVM IR..."
$LLVM_REPO/build/bin/mlir-translate --mlir-to-llvmir ${SCRIPT_DIR}/mlir_samples/${INTERMEDIATE_1} -o ${SCRIPT_DIR}/mlir_samples/${OUTPUT}
echo "Translation complete. Output written to ${SCRIPT_DIR}/mlir_samples/${OUTPUT}\n"

echo "Running LLVM IR with lli..."
$LLVM_REPO/build/bin/lli ${SCRIPT_DIR}/mlir_samples/${OUTPUT}
echo -e "Execution complete.\n"
