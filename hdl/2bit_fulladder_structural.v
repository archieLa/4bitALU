/*
By Artur Lach
Simple 2 bit structural adder, build from 2 1bit adders
*/

module fulladr_2bit_structural(in1, in2, carry_in, carry_out, sum);

input [1:0] in1, in2;
input carry_in;
output [1:0] sum;
output carry_out;
// intermediate wire to store results of operation on bits 0
wire inter_carry_out;

// create instance of two 1bit adders
 fulladr_1bit bit0(.in1(in1[0]), .in2(in2[0]), .carry_in(carry_in), .carry_out(inter_carry_out), .out(sum[0]));
 fulladr_1bit bit1(.in1(in1[1]), .in2(in2[1]), .carry_in(inter_carry_out), .carry_out(carry_out), .out(sum[1]));

 endmodule