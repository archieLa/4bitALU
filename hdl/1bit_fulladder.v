/*
By Artur Lach
Simple 1 bit full adder
*/

module fulladr_1bit (in1, in2, carry_in, carry_out, out);

input in1, in2, carry_in;
output carry_out, out;

assign out = in1 ^ in2 ^ carry_in;
assign carry_out = (in1 & in2) | ((in1 ^ in2) & carry_in);

endmodule
