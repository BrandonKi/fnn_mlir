import torch
import torch_mlir
from torch_mlir.fx import export_and_import

# DIALECT = "torch"
# DIALECT = "linalg-on-tensors"
# DIALECT = "tosa"
# DIALECT = "stablehlo"
DIALECT = "raw"

# BIAS = True
BIAS = False
class SimpleModel(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.linear1 = torch.nn.Linear(10, 20, bias=BIAS)
        self.relu = torch.nn.ReLU()
        self.linear2 = torch.nn.Linear(20, 5, bias=BIAS)
        
    def forward(self, x):
        x = self.linear1(x)
        x = self.relu(x)
        x = self.linear2(x)
        return x
def main():
    model = SimpleModel()
    model.eval()
    input_tensor = torch.randn(1, 10)
    mlir_module = export_and_import(
        model,
        input_tensor,
        output_type = DIALECT,
        enable_ir_printing = True,
    )

    # print(mlir_module)

    with open(f"simple_model_{DIALECT}_{BIAS}.mlir", "w") as f:
        f.write(str(mlir_module))

if __name__ == "__main__":
    main()