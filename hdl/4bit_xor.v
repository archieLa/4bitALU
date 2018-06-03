/*
By Artur Lach
Simple bitwise XOR module that operates on 4bits operands.
Uses Verilog ^ operator to perform bitwise OR
*/

module xor_4bit (in1, in2, result);
input [3:0] in1, in2;
output reg [3:0] result;
// use verilog XOR operator - works on vectors
always@(*) begin
  result = in1 ^ in2;
end
endmodule 