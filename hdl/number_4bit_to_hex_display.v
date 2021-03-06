module number_4bit_to_hex_display(in1, in2, out_bit0, out_bit1, out_bit2, out_bit3, out_bit_extra);

input [3:0] in1;
input in2;
output wire [7:0] out_bit0, out_bit1, out_bit2, out_bit3, out_bit_extra;

bit_to_hex_display bit0(.bit_in(in1[0]), .display_out(out_bit0));
bit_to_hex_display bit1(.bit_in(in1[1]), .display_out(out_bit1));
bit_to_hex_display bit2(.bit_in(in1[2]), .display_out(out_bit2));
bit_to_hex_display bit3(.bit_in(in1[3]), .display_out(out_bit3));
bit_to_hex_display carryout(.bit_in(in2), .display_out(out_bit_extra));


endmodule