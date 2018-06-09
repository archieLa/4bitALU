/*
By Artur Lach
Test bench to test 4bit_controller
*/

module controller_tb();

wire [3:0] out;
wire cout;
wire [7:0] out_control_display;

reg signed [3:0] in;
reg advance_signal;
reg reset_signal;

controller DUT(.in(in), .out(out), .cout(cout), .out_control_display(out_control_display),
.advance_signal(advance_signal), .reset_signal(reset_signal));


initial begin
in = 4'b1111;
reset_signal = 1'b1;
advance_signal = 1'b0;
#10
reset_signal = 1'b0;
// Load input A
#10
advance_signal = 1'b1;
// Set input b and load
#10
in = 4'b0001;
advance_signal = 1'b0;
#5
advance_signal = 1'b1;
// Set carry in input and load
#10
in = 4'b0001;
advance_signal = 1'b0;
#5
advance_signal = 1'b1;
// Set opcode and load
#10
in = 4'b1100;
advance_signal = 1'b0;
#5
advance_signal = 1'b1;
// Get the results
#10
advance_signal = 1'b0;
#5
advance_signal = 1'b1;
#10
advance_signal = 1'b0;
$stop;

end
endmodule

