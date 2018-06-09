/* Simple controller for ALU */

module controller(in, out, cout, out_control_display,  advance_signal, reset_signal);

input signed [3:0] in;
input advance_signal;
input reset_signal;

output reg signed [3:0] out;
output reg cout;
output reg [7:0] out_control_display;

reg signed [3:0] inputa;
reg signed [3:0] inputb;
reg carry_in;
reg [3:0] instruction;

wire [3:0] temp_out;
wire temp_cout;

reg helper;

reg [2:0] state;

parameter RESET = 3'b000, LOAD_IN_A = 3'b001, LOAD_IN_B = 3'b010, LOAD_CIN = 3'b011,
LOAD_INSTRUCTION = 3'b100, CALC_OUTPUT = 3'b101;

// Letter pattern to indiciate each step
parameter A = 8'b00001000, B = 8'b00000000, C = 8'b01000110, I = 8'b01001111, O = 8'b01000000, DEFAULT = 8'b11111111;

parameter ZERO_4BIT = 4'b0000, ZERO_1BIT = 1'b0;

parameter ADD = 4'b0100, SUB = 4'b0101;

// States and their outputs - triggered on every state variable update
always@(state) begin
  case (state)
    RESET: begin
    out = ZERO_4BIT;
    cout = ZERO_1BIT;
    out_control_display = DEFAULT;
    end
    LOAD_IN_A: begin
    out = inputa;
    cout = ZERO_1BIT;
    out_control_display = A;  
    end
    LOAD_IN_B: begin
    out = inputb;
    cout = ZERO_1BIT;
    out_control_display = B;
    end
    LOAD_CIN: begin
    out = {3'b000, carry_in};
    cout = ZERO_1BIT;
    out_control_display = C;
    end
    LOAD_INSTRUCTION: begin
    out = instruction;
    cout = ZERO_1BIT;
    out_control_display = I;
    end
    CALC_OUTPUT: begin
    cout = helper;
	 out = temp_out;
    out_control_display = O;
    end
  endcase
end


// State machine
always @(posedge advance_signal or posedge reset_signal) begin
    if (reset_signal) begin
		inputa <= ZERO_4BIT;
		inputb <= ZERO_4BIT;
		carry_in <= ZERO_1BIT;
		instruction <= ZERO_4BIT;
		state <= RESET;
    end
    else begin
        case (state)
            RESET: begin
					inputa <= in;
					state = LOAD_IN_A;
            end
            LOAD_IN_A: begin
               inputb <= in;
					state <= LOAD_IN_B;
            end
            LOAD_IN_B: begin
                carry_in <= in[0];
					 state <= LOAD_CIN;
            end
            LOAD_CIN: begin
                instruction <= in;
					 state <= LOAD_INSTRUCTION;
            end
            LOAD_INSTRUCTION: begin
					 if (instruction == ADD || instruction == SUB) begin
						helper <= temp_cout;
					 end
					 else begin
					 helper = ZERO_1BIT; 
					 end
					 state <= CALC_OUTPUT;
            end
            CALC_OUTPUT: begin
               inputa <= in;
					state <= LOAD_IN_A;  
            end
        endcase
    end
end

ALU_4bit alu(.in1(inputa), .in2(inputb), .cin(carry_in), .opcode(instruction),
 .cout(temp_cout), .out(temp_out));

 endmodule 