/*
By Artur Lach
Test bench to test 4bit NOT module
*/

module not_4bit_tb();
// Make inputs signed based on lab requirements
reg signed [3:0] in1;
wire signed [3:0] result;

not_4bit DUT(.in1(in1), .result(result));

initial begin
  in1 = 4'b1111;
  $display("t=%d, a=%4b",$time,in1);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  in1 = 4'b1010;
  $display("t=%d, a=%4b",$time,in1);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  in1 = 4'b0000;
  $display("t=%d, a=%4b",$time,in1);
  #20
  $display("t=%d, out=%4b",$time,result);
  #100
  $stop;

end
endmodule