/* 
By Artur Lach
4 bit adder-subtractor with carry in and carry out
behavioral verilo
*/

module adder_subtr_4bit (in1, in2, ci, sub_select, co, out);

input [3:0] in1, in2;
input ci;           
input sub_select;
output reg [3:0] out;
output reg co;
reg [4:0] tmp;
parameter SUB = 1'b1, ADD = 1'b0;

always @(*) begin
  if (sub_select == SUB)
   begin
   tmp = in1 - in2 - ci;
   out = tmp[3:0];
   co = tmp[4];
   end
  else 
    begin
    tmp = in1 + in2 + ci;
    out = tmp[3:0];
    co = tmp[4];
    end
end
endmodule
