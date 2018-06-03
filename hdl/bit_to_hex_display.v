module bit_to_hex_display(bit_in, display_out);

input bit_in;
output reg [7:0] display_out;

parameter SEG_ON = 0, SEG_OFF = 1;

always@(*) begin 
    if (bit_in == 0) begin
    display_out[0] = SEG_ON;
    display_out[1] = SEG_ON;
    display_out[2] = SEG_ON;
    display_out[3] = SEG_ON;
    display_out[4] = SEG_ON;
    display_out[5] = SEG_ON;
    display_out[6] = SEG_OFF;
    display_out[7] = SEG_OFF;
    end
    else begin
    display_out[0] = SEG_OFF;
    display_out[1] = SEG_ON;
    display_out[2] = SEG_ON;
    display_out[3] = SEG_OFF;
    display_out[4] = SEG_OFF;
    display_out[5] = SEG_OFF;
    display_out[6] = SEG_OFF;
    display_out[7] = SEG_OFF;
	 end
end 
endmodule 