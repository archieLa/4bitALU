/*
By Artur Lach
Test bench for right left shift
*/

module rl_shift_4bit_tb();

reg signed [3:0] a,b;
reg [1:0] shift_select;
wire signed[3:0] result;

// instance of device under test
rl_shift_4bit DUT (.in1(a), .in2(b), .shift_select(shift_select), .result(result));

initial begin
// Test left shift
a = 4'b0011;
b = 4'b0001;
shift_select = 4'b00;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
// Test left shit bits completely shifted out
#100
a = 4'b0011;
b = 4'b0100;
shift_select = 4'b00;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
// Test right shit
#100
a = 4'b1000;
b = 4'b0010;
shift_select = 4'b01;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
// Test right shit completely shifted out
#100
a = 4'b1100;
b = 4'b1000;
shift_select = 4'b01;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
// Test arithmetic shit positive value
#100
a = 4'b0100;
b = 4'b0010;
shift_select = 4'b10;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
#100
// Test arithmetic shit negative value
a = 4'b1100;
b = 4'b0011;
shift_select = 4'b10;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
#100
// Test default value
a = 4'b1110;
b = 4'b0011;
shift_select = 4'b11;
$display("t=%d, a=%d, b=%d, shift_select=%d",$time,a,b,shift_select);
#20
$display("t=%d, result=%d",$time,result);
#100
$stop;
end

endmodule