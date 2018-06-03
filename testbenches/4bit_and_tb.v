/*
By Artur Lach
Test bench to test 4bit AND module
*/

module and_4bit_tb();
// Make inputs signed based on lab requirements
reg signed [3:0] in1, in2;
wire signed [3:0] result;

and_4bit DUT(.in1(in1), .in2(in2), .result(result));

initial begin
  in1 = 4'b0000;
  in2 = 4'b1111;
  $display("t=%d, a=%4b, b=%4b",$time,in1,in2);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  in1 = 4'b1001;
  in2 = 4'b1011;
  $display("t=%d, a=%4b, b=%4b",$time,in1,in2);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  in1 = 4'b1111;
  in2 = 4'b1111;
  $display("t=%d, a=%4b, b=%4b",$time,in1,in2);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  $stop;

end
endmodule