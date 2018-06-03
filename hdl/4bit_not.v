/*
By Artur Lach
Simple bitwise NOT module that operates on 4bits operand
Uses Verilog | operator to perform bitwise NOT
*/

module not_4bit (in1, result);
input [3:0] in1;
output reg [3:0] result;
// use verilog not operator - works on vectors
always@(*) begin
  result = ~in1;
end
endmodule 