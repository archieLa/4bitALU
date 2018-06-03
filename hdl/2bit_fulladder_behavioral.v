/*
By Artur Lach
Simple 2 bit behavioral adder
*/


module fulladr_2bit_behavioral(in1, in2, carry_in, carry_out, sum);
input [1:0] in1, in2;
input carry_in;
output reg [1:0] sum;
output reg carry_out;
reg [2:0] inter_calc_result;

// Simply store result in bigger register and pick appropriate bits
// for sum and carry out
always@(*) begin
  inter_calc_result = in1 + in2 + carry_in;
  sum = inter_calc_result[1:0];
  carry_out = inter_calc_result[2];
end

endmodule