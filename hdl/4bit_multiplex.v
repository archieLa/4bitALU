/*
By Artur Lach
Multiplexer module - takes 7 inputs and sets output based on the provided control signal
If control signal is incorrect default value is provided
*/


module multiplex_4bit(control, add_sub_res, not_res, or_res, and_res, xor_res, l_r_res, pass_through_res, out);
input [3:0] control;
input [3:0] add_sub_res, not_res, or_res, and_res, xor_res, l_r_res, pass_through_res;
output reg [3:0] out;
// opcode constants
parameter ADD = 4'b0100, SUB = 4'b0101, NOT = 4'b1000, OR = 4'b1001,
AND = 4'b1010, XOR = 4'b1011, SLL = 4'b1100, SRL = 4'b1101, SRA = 4'b1110,
CPY = 4'b1111;

always@(*) begin
  case (control)
    ADD: out = add_sub_res;
    SUB: out = add_sub_res;
    NOT: out = not_res;
    OR: out = or_res;
    AND: out = and_res;
    XOR: out = xor_res;
    SLL: out = l_r_res;
    SRL: out = l_r_res;
    SRA: out = l_r_res;
    CPY: out = pass_through_res;
    default: out = 4'b0000;
endcase
end

endmodule