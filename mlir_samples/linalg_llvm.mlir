module {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @__constant_5x20xf32(dense_resource<torch_tensor_5_20_torch.float32> : tensor<5x20xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<5 x array<20 x f32>>
  llvm.mlir.global private constant @__constant_20x10xf32(dense_resource<torch_tensor_20_10_torch.float32> : tensor<20x10xf32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<20 x array<10 x f32>>
  llvm.func @main(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.constant(5 : index) : i64
    %9 = llvm.mlir.constant(20 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(10 : index) : i64
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %14 = llvm.mlir.constant(20 : index) : i64
    %15 = llvm.mlir.constant(10 : index) : i64
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(200 : index) : i64
    %18 = llvm.mlir.zero : !llvm.ptr
    %19 = llvm.getelementptr %18[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.ptrtoint %19 : !llvm.ptr to i64
    %21 = llvm.mlir.addressof @__constant_20x10xf32 : !llvm.ptr
    %22 = llvm.getelementptr %21[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<20 x array<10 x f32>>
    %23 = llvm.mlir.constant(3735928559 : index) : i64
    %24 = llvm.inttoptr %23 : i64 to !llvm.ptr
    %25 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %26 = llvm.insertvalue %24, %25[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %22, %26[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.mlir.constant(0 : index) : i64
    %29 = llvm.insertvalue %28, %27[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %14, %29[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %15, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %15, %31[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %16, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.mlir.constant(5 : index) : i64
    %35 = llvm.mlir.constant(20 : index) : i64
    %36 = llvm.mlir.constant(1 : index) : i64
    %37 = llvm.mlir.constant(100 : index) : i64
    %38 = llvm.mlir.zero : !llvm.ptr
    %39 = llvm.getelementptr %38[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %40 = llvm.ptrtoint %39 : !llvm.ptr to i64
    %41 = llvm.mlir.addressof @__constant_5x20xf32 : !llvm.ptr
    %42 = llvm.getelementptr %41[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<5 x array<20 x f32>>
    %43 = llvm.mlir.constant(3735928559 : index) : i64
    %44 = llvm.inttoptr %43 : i64 to !llvm.ptr
    %45 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %42, %46[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %34, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %35, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %35, %51[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %36, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mlir.constant(10 : index) : i64
    %55 = llvm.mlir.constant(20 : index) : i64
    %56 = llvm.mlir.constant(1 : index) : i64
    %57 = llvm.mlir.constant(200 : index) : i64
    %58 = llvm.mlir.zero : !llvm.ptr
    %59 = llvm.getelementptr %58[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %60 = llvm.ptrtoint %59 : !llvm.ptr to i64
    %61 = llvm.mlir.constant(64 : index) : i64
    %62 = llvm.add %60, %61 : i64
    %63 = llvm.call @malloc(%62) : (i64) -> !llvm.ptr
    %64 = llvm.ptrtoint %63 : !llvm.ptr to i64
    %65 = llvm.mlir.constant(1 : index) : i64
    %66 = llvm.sub %61, %65 : i64
    %67 = llvm.add %64, %66 : i64
    %68 = llvm.urem %67, %61 : i64
    %69 = llvm.sub %67, %68 : i64
    %70 = llvm.inttoptr %69 : i64 to !llvm.ptr
    %71 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %72 = llvm.insertvalue %63, %71[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %73 = llvm.insertvalue %70, %72[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = llvm.mlir.constant(0 : index) : i64
    %75 = llvm.insertvalue %74, %73[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.insertvalue %54, %75[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.insertvalue %55, %76[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %78 = llvm.insertvalue %55, %77[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %79 = llvm.insertvalue %56, %78[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%12 : i64)
  ^bb1(%80: i64):  // 2 preds: ^bb0, ^bb5
    %81 = llvm.icmp "slt" %80, %11 : i64
    llvm.cond_br %81, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%12 : i64)
  ^bb3(%82: i64):  // 2 preds: ^bb2, ^bb4
    %83 = llvm.icmp "slt" %82, %9 : i64
    llvm.cond_br %83, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %84 = llvm.extractvalue %33[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.mlir.constant(10 : index) : i64
    %86 = llvm.mul %82, %85 : i64
    %87 = llvm.add %86, %80 : i64
    %88 = llvm.getelementptr %84[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.extractvalue %79[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.mlir.constant(20 : index) : i64
    %92 = llvm.mul %80, %91 : i64
    %93 = llvm.add %92, %82 : i64
    %94 = llvm.getelementptr %90[%93] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %89, %94 : f32, !llvm.ptr
    %95 = llvm.add %82, %10 : i64
    llvm.br ^bb3(%95 : i64)
  ^bb5:  // pred: ^bb3
    %96 = llvm.add %80, %10 : i64
    llvm.br ^bb1(%96 : i64)
  ^bb6:  // pred: ^bb1
    %97 = llvm.mlir.constant(1 : index) : i64
    %98 = llvm.mlir.constant(20 : index) : i64
    %99 = llvm.mlir.constant(1 : index) : i64
    %100 = llvm.mlir.constant(20 : index) : i64
    %101 = llvm.mlir.zero : !llvm.ptr
    %102 = llvm.getelementptr %101[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %103 = llvm.ptrtoint %102 : !llvm.ptr to i64
    %104 = llvm.mlir.constant(64 : index) : i64
    %105 = llvm.add %103, %104 : i64
    %106 = llvm.call @malloc(%105) : (i64) -> !llvm.ptr
    %107 = llvm.ptrtoint %106 : !llvm.ptr to i64
    %108 = llvm.mlir.constant(1 : index) : i64
    %109 = llvm.sub %104, %108 : i64
    %110 = llvm.add %107, %109 : i64
    %111 = llvm.urem %110, %104 : i64
    %112 = llvm.sub %110, %111 : i64
    %113 = llvm.inttoptr %112 : i64 to !llvm.ptr
    %114 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %115 = llvm.insertvalue %106, %114[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %116 = llvm.insertvalue %113, %115[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %117 = llvm.mlir.constant(0 : index) : i64
    %118 = llvm.insertvalue %117, %116[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %119 = llvm.insertvalue %97, %118[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.insertvalue %98, %119[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.insertvalue %98, %120[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = llvm.insertvalue %99, %121[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %123 = llvm.mlir.constant(1 : index) : i64
    %124 = llvm.mlir.constant(20 : index) : i64
    %125 = llvm.mlir.constant(1 : index) : i64
    %126 = llvm.mlir.constant(20 : index) : i64
    %127 = llvm.mlir.zero : !llvm.ptr
    %128 = llvm.getelementptr %127[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %129 = llvm.ptrtoint %128 : !llvm.ptr to i64
    %130 = llvm.mlir.constant(64 : index) : i64
    %131 = llvm.add %129, %130 : i64
    %132 = llvm.call @malloc(%131) : (i64) -> !llvm.ptr
    %133 = llvm.ptrtoint %132 : !llvm.ptr to i64
    %134 = llvm.mlir.constant(1 : index) : i64
    %135 = llvm.sub %130, %134 : i64
    %136 = llvm.add %133, %135 : i64
    %137 = llvm.urem %136, %130 : i64
    %138 = llvm.sub %136, %137 : i64
    %139 = llvm.inttoptr %138 : i64 to !llvm.ptr
    %140 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %141 = llvm.insertvalue %132, %140[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %142 = llvm.insertvalue %139, %141[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %143 = llvm.mlir.constant(0 : index) : i64
    %144 = llvm.insertvalue %143, %142[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %145 = llvm.insertvalue %123, %144[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.insertvalue %124, %145[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %147 = llvm.insertvalue %124, %146[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %148 = llvm.insertvalue %125, %147[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%12 : i64)
  ^bb7(%149: i64):  // 2 preds: ^bb6, ^bb11
    %150 = llvm.icmp "slt" %149, %10 : i64
    llvm.cond_br %150, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%12 : i64)
  ^bb9(%151: i64):  // 2 preds: ^bb8, ^bb10
    %152 = llvm.icmp "slt" %151, %9 : i64
    llvm.cond_br %152, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %153 = llvm.extractvalue %148[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %154 = llvm.mlir.constant(20 : index) : i64
    %155 = llvm.mul %149, %154 : i64
    %156 = llvm.add %155, %151 : i64
    %157 = llvm.getelementptr %153[%156] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %13, %157 : f32, !llvm.ptr
    %158 = llvm.add %151, %10 : i64
    llvm.br ^bb9(%158 : i64)
  ^bb11:  // pred: ^bb9
    %159 = llvm.add %149, %10 : i64
    llvm.br ^bb7(%159 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%12 : i64)
  ^bb13(%160: i64):  // 2 preds: ^bb12, ^bb20
    %161 = llvm.icmp "slt" %160, %10 : i64
    llvm.cond_br %161, ^bb14, ^bb21
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%12 : i64)
  ^bb15(%162: i64):  // 2 preds: ^bb14, ^bb19
    %163 = llvm.icmp "slt" %162, %9 : i64
    llvm.cond_br %163, ^bb16, ^bb20
  ^bb16:  // pred: ^bb15
    llvm.br ^bb17(%12 : i64)
  ^bb17(%164: i64):  // 2 preds: ^bb16, ^bb18
    %165 = llvm.icmp "slt" %164, %11 : i64
    llvm.cond_br %165, ^bb18, ^bb19
  ^bb18:  // pred: ^bb17
    %166 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %167 = llvm.extractvalue %7[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %168 = llvm.getelementptr %166[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %169 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %170 = llvm.mul %160, %169 : i64
    %171 = llvm.extractvalue %7[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %172 = llvm.mul %164, %171 : i64
    %173 = llvm.add %170, %172 : i64
    %174 = llvm.getelementptr %168[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = llvm.extractvalue %79[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %177 = llvm.mlir.constant(20 : index) : i64
    %178 = llvm.mul %164, %177 : i64
    %179 = llvm.add %178, %162 : i64
    %180 = llvm.getelementptr %176[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %181 = llvm.load %180 : !llvm.ptr -> f32
    %182 = llvm.extractvalue %148[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %183 = llvm.mlir.constant(20 : index) : i64
    %184 = llvm.mul %160, %183 : i64
    %185 = llvm.add %184, %162 : i64
    %186 = llvm.getelementptr %182[%185] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %187 = llvm.load %186 : !llvm.ptr -> f32
    %188 = llvm.fmul %175, %181 : f32
    %189 = llvm.fadd %187, %188 : f32
    %190 = llvm.extractvalue %148[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %191 = llvm.mlir.constant(20 : index) : i64
    %192 = llvm.mul %160, %191 : i64
    %193 = llvm.add %192, %162 : i64
    %194 = llvm.getelementptr %190[%193] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %189, %194 : f32, !llvm.ptr
    %195 = llvm.add %164, %10 : i64
    llvm.br ^bb17(%195 : i64)
  ^bb19:  // pred: ^bb17
    %196 = llvm.add %162, %10 : i64
    llvm.br ^bb15(%196 : i64)
  ^bb20:  // pred: ^bb15
    %197 = llvm.add %160, %10 : i64
    llvm.br ^bb13(%197 : i64)
  ^bb21:  // pred: ^bb13
    llvm.br ^bb22(%12 : i64)
  ^bb22(%198: i64):  // 2 preds: ^bb21, ^bb26
    %199 = llvm.icmp "slt" %198, %10 : i64
    llvm.cond_br %199, ^bb23, ^bb27
  ^bb23:  // pred: ^bb22
    llvm.br ^bb24(%12 : i64)
  ^bb24(%200: i64):  // 2 preds: ^bb23, ^bb25
    %201 = llvm.icmp "slt" %200, %9 : i64
    llvm.cond_br %201, ^bb25, ^bb26
  ^bb25:  // pred: ^bb24
    %202 = llvm.extractvalue %148[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %203 = llvm.mlir.constant(20 : index) : i64
    %204 = llvm.mul %12, %203 : i64
    %205 = llvm.add %204, %200 : i64
    %206 = llvm.getelementptr %202[%205] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %207 = llvm.load %206 : !llvm.ptr -> f32
    %208 = llvm.fcmp "ugt" %207, %13 : f32
    %209 = llvm.select %208, %207, %13 : i1, f32
    %210 = llvm.extractvalue %122[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %211 = llvm.mlir.constant(20 : index) : i64
    %212 = llvm.mul %198, %211 : i64
    %213 = llvm.add %212, %200 : i64
    %214 = llvm.getelementptr %210[%213] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %209, %214 : f32, !llvm.ptr
    %215 = llvm.add %200, %10 : i64
    llvm.br ^bb24(%215 : i64)
  ^bb26:  // pred: ^bb24
    %216 = llvm.add %198, %10 : i64
    llvm.br ^bb22(%216 : i64)
  ^bb27:  // pred: ^bb22
    %217 = llvm.mlir.constant(20 : index) : i64
    %218 = llvm.mlir.constant(5 : index) : i64
    %219 = llvm.mlir.constant(1 : index) : i64
    %220 = llvm.mlir.constant(100 : index) : i64
    %221 = llvm.mlir.zero : !llvm.ptr
    %222 = llvm.getelementptr %221[%220] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %223 = llvm.ptrtoint %222 : !llvm.ptr to i64
    %224 = llvm.mlir.constant(64 : index) : i64
    %225 = llvm.add %223, %224 : i64
    %226 = llvm.call @malloc(%225) : (i64) -> !llvm.ptr
    %227 = llvm.ptrtoint %226 : !llvm.ptr to i64
    %228 = llvm.mlir.constant(1 : index) : i64
    %229 = llvm.sub %224, %228 : i64
    %230 = llvm.add %227, %229 : i64
    %231 = llvm.urem %230, %224 : i64
    %232 = llvm.sub %230, %231 : i64
    %233 = llvm.inttoptr %232 : i64 to !llvm.ptr
    %234 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %235 = llvm.insertvalue %226, %234[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %236 = llvm.insertvalue %233, %235[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %237 = llvm.mlir.constant(0 : index) : i64
    %238 = llvm.insertvalue %237, %236[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %239 = llvm.insertvalue %217, %238[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %240 = llvm.insertvalue %218, %239[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %241 = llvm.insertvalue %218, %240[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %242 = llvm.insertvalue %219, %241[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb28(%12 : i64)
  ^bb28(%243: i64):  // 2 preds: ^bb27, ^bb32
    %244 = llvm.icmp "slt" %243, %9 : i64
    llvm.cond_br %244, ^bb29, ^bb33
  ^bb29:  // pred: ^bb28
    llvm.br ^bb30(%12 : i64)
  ^bb30(%245: i64):  // 2 preds: ^bb29, ^bb31
    %246 = llvm.icmp "slt" %245, %8 : i64
    llvm.cond_br %246, ^bb31, ^bb32
  ^bb31:  // pred: ^bb30
    %247 = llvm.extractvalue %53[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %248 = llvm.mlir.constant(20 : index) : i64
    %249 = llvm.mul %245, %248 : i64
    %250 = llvm.add %249, %243 : i64
    %251 = llvm.getelementptr %247[%250] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %252 = llvm.load %251 : !llvm.ptr -> f32
    %253 = llvm.extractvalue %242[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %254 = llvm.mlir.constant(5 : index) : i64
    %255 = llvm.mul %243, %254 : i64
    %256 = llvm.add %255, %245 : i64
    %257 = llvm.getelementptr %253[%256] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %252, %257 : f32, !llvm.ptr
    %258 = llvm.add %245, %10 : i64
    llvm.br ^bb30(%258 : i64)
  ^bb32:  // pred: ^bb30
    %259 = llvm.add %243, %10 : i64
    llvm.br ^bb28(%259 : i64)
  ^bb33:  // pred: ^bb28
    %260 = llvm.mlir.constant(1 : index) : i64
    %261 = llvm.mlir.constant(5 : index) : i64
    %262 = llvm.mlir.constant(1 : index) : i64
    %263 = llvm.mlir.constant(5 : index) : i64
    %264 = llvm.mlir.zero : !llvm.ptr
    %265 = llvm.getelementptr %264[%263] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %266 = llvm.ptrtoint %265 : !llvm.ptr to i64
    %267 = llvm.mlir.constant(64 : index) : i64
    %268 = llvm.add %266, %267 : i64
    %269 = llvm.call @malloc(%268) : (i64) -> !llvm.ptr
    %270 = llvm.ptrtoint %269 : !llvm.ptr to i64
    %271 = llvm.mlir.constant(1 : index) : i64
    %272 = llvm.sub %267, %271 : i64
    %273 = llvm.add %270, %272 : i64
    %274 = llvm.urem %273, %267 : i64
    %275 = llvm.sub %273, %274 : i64
    %276 = llvm.inttoptr %275 : i64 to !llvm.ptr
    %277 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %278 = llvm.insertvalue %269, %277[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %279 = llvm.insertvalue %276, %278[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %280 = llvm.mlir.constant(0 : index) : i64
    %281 = llvm.insertvalue %280, %279[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %282 = llvm.insertvalue %260, %281[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %283 = llvm.insertvalue %261, %282[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %284 = llvm.insertvalue %261, %283[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %285 = llvm.insertvalue %262, %284[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb34(%12 : i64)
  ^bb34(%286: i64):  // 2 preds: ^bb33, ^bb38
    %287 = llvm.icmp "slt" %286, %10 : i64
    llvm.cond_br %287, ^bb35, ^bb39
  ^bb35:  // pred: ^bb34
    llvm.br ^bb36(%12 : i64)
  ^bb36(%288: i64):  // 2 preds: ^bb35, ^bb37
    %289 = llvm.icmp "slt" %288, %8 : i64
    llvm.cond_br %289, ^bb37, ^bb38
  ^bb37:  // pred: ^bb36
    %290 = llvm.extractvalue %285[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %291 = llvm.mlir.constant(5 : index) : i64
    %292 = llvm.mul %286, %291 : i64
    %293 = llvm.add %292, %288 : i64
    %294 = llvm.getelementptr %290[%293] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %13, %294 : f32, !llvm.ptr
    %295 = llvm.add %288, %10 : i64
    llvm.br ^bb36(%295 : i64)
  ^bb38:  // pred: ^bb36
    %296 = llvm.add %286, %10 : i64
    llvm.br ^bb34(%296 : i64)
  ^bb39:  // pred: ^bb34
    llvm.br ^bb40(%12 : i64)
  ^bb40(%297: i64):  // 2 preds: ^bb39, ^bb47
    %298 = llvm.icmp "slt" %297, %10 : i64
    llvm.cond_br %298, ^bb41, ^bb48
  ^bb41:  // pred: ^bb40
    llvm.br ^bb42(%12 : i64)
  ^bb42(%299: i64):  // 2 preds: ^bb41, ^bb46
    %300 = llvm.icmp "slt" %299, %8 : i64
    llvm.cond_br %300, ^bb43, ^bb47
  ^bb43:  // pred: ^bb42
    llvm.br ^bb44(%12 : i64)
  ^bb44(%301: i64):  // 2 preds: ^bb43, ^bb45
    %302 = llvm.icmp "slt" %301, %9 : i64
    llvm.cond_br %302, ^bb45, ^bb46
  ^bb45:  // pred: ^bb44
    %303 = llvm.extractvalue %122[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %304 = llvm.mlir.constant(20 : index) : i64
    %305 = llvm.mul %297, %304 : i64
    %306 = llvm.add %305, %301 : i64
    %307 = llvm.getelementptr %303[%306] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %308 = llvm.load %307 : !llvm.ptr -> f32
    %309 = llvm.extractvalue %242[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %310 = llvm.mlir.constant(5 : index) : i64
    %311 = llvm.mul %301, %310 : i64
    %312 = llvm.add %311, %299 : i64
    %313 = llvm.getelementptr %309[%312] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %314 = llvm.load %313 : !llvm.ptr -> f32
    %315 = llvm.extractvalue %285[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %316 = llvm.mlir.constant(5 : index) : i64
    %317 = llvm.mul %297, %316 : i64
    %318 = llvm.add %317, %299 : i64
    %319 = llvm.getelementptr %315[%318] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %320 = llvm.load %319 : !llvm.ptr -> f32
    %321 = llvm.fmul %308, %314 : f32
    %322 = llvm.fadd %320, %321 : f32
    %323 = llvm.extractvalue %285[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %324 = llvm.mlir.constant(5 : index) : i64
    %325 = llvm.mul %297, %324 : i64
    %326 = llvm.add %325, %299 : i64
    %327 = llvm.getelementptr %323[%326] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %322, %327 : f32, !llvm.ptr
    %328 = llvm.add %301, %10 : i64
    llvm.br ^bb44(%328 : i64)
  ^bb46:  // pred: ^bb44
    %329 = llvm.add %299, %10 : i64
    llvm.br ^bb42(%329 : i64)
  ^bb47:  // pred: ^bb42
    %330 = llvm.add %297, %10 : i64
    llvm.br ^bb40(%330 : i64)
  ^bb48:  // pred: ^bb40
    %331 = llvm.extractvalue %79[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @free(%331) : (!llvm.ptr) -> ()
    %332 = llvm.extractvalue %122[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @free(%332) : (!llvm.ptr) -> ()
    %333 = llvm.extractvalue %148[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @free(%333) : (!llvm.ptr) -> ()
    %334 = llvm.extractvalue %242[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @free(%334) : (!llvm.ptr) -> ()
    llvm.return %285 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

{-#
  dialect_resources: {
    builtin: {
      torch_tensor_5_20_torch.float32: "0x040000004B1B5DBD5F5C533ECB9785BD3C148FBDFD3BE1BDB8293C3E7A9BAF3D8A27263EB405EE3DF6A495BD30ED51BEC6A8693D8E42073EB2E7F3BDEE2E283C71190D3B16AAE1BDB533493E7DDED53D0158443EBFDECA3C324DF9BDCF2F0C3EF5AFC33D2A43AFBD4B32DB3D975B62BD2392483EB1B44CBEDF89043D387BBEBCBAA1F53D30793BBEAD164B3DC0C3E43D7DDB7E3DC53D3A3E374346BE05CB373EC3F6DC3D2C1D613CB4C6AFBD039240BE91EF42BEB33A1ABB803C20BD9FE3313D15D6D93D4DB708BD2A49E63D33A991BD42328BBCB65B393EE24907BED38BDDBDDEEBEFBCB89757BE13FF503EFC9029BE20AE00BEF809D1BCDB371E3D6457033E4677D33DAC53D73DE039923DF7952D3EBE721E3E8237353DF35D0CBC41319B3D9DCACCBD9217BBBC309940BE4EB0B2BD1BD3D13CE9CC673D636E43BE4E32963C2F5E2ABEC8BA913C4BC338BDF54FE03CFF0007BEB7E21C3E8FB4C5BCCACC24BD59B20ABE591AB23D95141FBDB51C313E1C2C9ABC4E9B62BEEC06313D5A772D3E1EA1AD3CFE21FEBDF3BAA93DC584123E81428EBD",
      torch_tensor_20_10_torch.float32: "0x04000000700774BE578E82BEAC809DBEF1BA16BEEC2A933DE4BF3C3EC19D37BD19B425BDEBC466BEFF0BE13DA50183BEDA00963ECE21343E0AD18DBE8DBB693E7D3C9C3CA3309D3DE65492BE858C223E0A9F3CBE8CF89EBE8C26DF3DDD030C3E3DC0F03DC06D903E07670D3D7800A03D07AD0E3EA23C573C33F96DBD65BE863EE0BB443ECBD869BE958F9DBD2359DBBD807E633EF19444BE4E8382BE75A9FE3DFAEA5BBDEE21803DC2FF46BE53EA973C1827513EE81E8BBE2D7B45BEEAF2B0BC08969EBDCCF396BE58D29F3E143F88BE260691BD78A7CCBD2345F23D8C1D24BD98ACBDBDB37CECBCF2A4933E5191F3BD7EF6D0BDCC42963DEAA05ABDEA0C123D332BC03DB56D0A3D1615693E6870963E6919E03B856A893E106F66BDF97F5E3E55D92D3EE36D37BD48EF64BCB8965F3E057E5ABE2F3291BD4FB3DCBD3B45273E58A8603BC056CF3C655C643B1F7094BD8E05093EF13F5DBE52F2B3BD247CAB3D63823B3D68E73FBCB41A933ED009193E62516F3E168D27BED78B443E824B27BEDB3303BD4574643EAE9D04BED70AF3BD740049BE8AA86BBEF029EEBD9896C63C70E4353EB31E92BD50D074BE0218C03DC8916BBD9FE066BE43D70F3EDF0414BE813E59BDAA6592BEEEB4F33DC39E10BE72E387BDE88C053EB06C0DBEAD3DD03DA172F43BA98EBB3D01E86D3D6EBFA0BD1A3664BE1C93993EACF62DBE946D8DBE763F733E48B662BEF441263EA6198B3ED8AC87BE28324ABED43DA13EAE3A5E3ED578833C7958D6BBA5A170BE29A84ABE563976BE48EC34BE7680D03DAEC193BE8DD0493EE7453A3EA7C2C0BD2A2076BEC2DF073ECEF94ABE60F6773E1CCF7BBE6C7B933D59D40EBEFEEE063EF68E97BE640DB9BDDE7411BEB235C4BD4E575A3EA5B3D9BDA7A38CBE3E90F23DD31AC83DD99945BD6F0083BE593965BE0AAA9B3E2C2901BE8721BFBD04A7733D41C8823E50F590BEA35C55BD908BA23DFD65223C3FED543DDB0948BE3F92C6BBE3888C3E4939793DEF89073D52B478BE618862BE20295FBE950BBBBDC8F02B3E69F896BBDD767B3E307384BDE0B4583ED27AD23D0645593EDAF29F3ED100BFBD6E0F9FBE58422D3E3460363ED3944B3D8BCED93C301E69BC"
    }
  }
#-}

