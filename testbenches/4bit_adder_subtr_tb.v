/*
By Artur Lach
Test bench for 4bit adder, subtractor
*/

module adder_subtr_4bit_tb();

reg signed [3:0] a,b;
reg cin;
reg sub_select;
wire signed [3:0] out;
wire cout;

// instance of device under test
adder_subtr_4bit DUT (.in1(a), .in2(b), .ci(cin), .sub_select(sub_select), .co(cout), .out(out));

initial begin
// Test for carry out with binary
a = 4'b1111;
b = 4'b1110;
cin = 1'b1;
sub_select = 1'b0;
$display("t=%d, a=%d, b=%d, cin=%d, sub_select=%d",$time,a,b,cin,sub_select);
#20
$display("t=%d, result=%d, cout=%d",$time,out,cout);
// Test decimal addition needs to equal 6
#100
a = 4'd2;
b = 4'd3;
cin = 1'b1;
sub_select = 1'b0;
$display("t=%d, a=%d, b=%d, cin=%d, sub_select=%d",$time,a,b,cin,sub_select);
#20
$display("t=%d, result=%d, cout=%d",$time,out,cout);
// Test decimal subtraction positive result needs to equal 1
#100
a = 4'd2;
b = 4'd1;
cin = 1'b0;
sub_select = 1'b1;
$display("t=%d, a=%d, b=%d, cin=%d, sub_select=%d",$time,a,b,cin,sub_select);
#20
$display("t=%d, result=%d, cout=%d",$time,out,cout);
// Test decimal subtraction negative result needs to equal -2
#100
a = 4'd2;
b = 4'd3;
cin = 1'b1;
sub_select = 1'b1;
$display("t=%d, a=%d, b=%d, cin=%d, sub_select=%d",$time,a,b,cin,sub_select);
#20
$display("t=%d, result=%d, cout=%d",$time,out,cout);
#100
$stop;
end

endmodule