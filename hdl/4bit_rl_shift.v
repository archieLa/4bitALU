/*
By Artur Lach
Shift module that can perform left, right and right arithmetic shift
Bits in A are shifted by value in B
Which shift operation is completed is provided in 2bit shift select
shift_select = 00 - left shift
shift_select = 01 - right shift
shift_select = 10 - right aritmetic shift
Right arithmetic shift performs sign extension
*/

module rl_shift_4bit (in1, in2, shift_select, result);
// Make the input and output signed so that >>> works in aritmetic way
input signed[3:0] in1, in2;
input [1:0] shift_select;
output reg signed[3:0] result;
//Operation constants
parameter l_shift = 2'b00, r_shift = 2'b01, r_arithm_shift = 2'b10;

always@(*) begin
case (shift_select)
	l_shift: result = in1 << in2;
	r_shift: result = in1 >> in2;
	r_arithm_shift: result = in1 >>> in2;  //right shift with sign extension
	default: result = in1;
endcase
end
endmodule