
module {
    func.func @foo(%a:i32, %b:i32) -> i32 {
        %0 = arith.constant 1 : i32
        %res = arith.addi %a, %b : i32
        return %res : i32
    }
}
