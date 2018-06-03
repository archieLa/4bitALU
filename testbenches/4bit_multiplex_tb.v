/*
By Artur Lach
Test bench for 4bit adder, subtractor
*/

module multiplex_4bit_tb();

reg signed [3:0] in1, in2, in3, in4, in5, in6, in7;
reg [3:0] control;
wire signed [3:0] out;

// instance of device under test
multiplex_4bit DUT (.control(control), .add_sub_res(in1), .not_res(in2), .or_res(in3),
 .and_res(in4), .xor_res(in5), .l_r_res(in6), .pass_through_res(in7), .out(out));

initial begin
in1 = 4'b0001;
in2 = 4'b0010;
in3 = 4'b0011;
in4 = 4'b0100;
in5 = 4'b0101;
in6 = 4'b0110;
in7 = 4'b0111;
control = 4'b0100;    // output should be in1 - addition
$display("in1=%b, in2=%b, in3=%b, in4=%b, in5=%b, in6=%b, in7=%b",in1,in2,in3,in4,in5,in6,in7);
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b0101;  // output should be in1 - subtraction
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1000;  // output should be in2 - not
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1001;  // output should be in3 - or
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1010;  // output should be in4 - and
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1011;  // output should be in5 - xor
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1100;  // output should be in6 - left shift
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1101;  // output should be in6 - right shift
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1110;  // output should be in6 - right arithmetic shift
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b1111;  // output should be in7 - passthrough
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
control = 4'b0000;  // output should be 0000 default
#20
$display("t=%d, control=%b, out=%b",$time,control,out);
#100
$stop;
end

endmodule