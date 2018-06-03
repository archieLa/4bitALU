/*
By Artur Lach
Test bench to test both behavioral and structural adders
*/

module behavioral_structural_addr_tb();

reg [1:0] a, b;
reg cin;
wire [1:0] sum_behavioral;
wire [1:0] sum_structural;
wire cout_behavioral;
wire cout_structural;

// Create instance of each adder
fulladr_2bit_structural DUT1(.in1(a), .in2(b), .carry_in(cin), .carry_out(cout_structural), .sum(sum_structural));
fulladr_2bit_behavioral DUT2(.in1(a), .in2(b), .carry_in(cin), .carry_out(cout_behavioral), .sum(sum_behavioral));


initial begin
  a = 2'b00;
  b = 2'b00;
  cin = 1'b1;
  #100
  a = 2'b01;
  b = 2'b10;
  cin = 1'b1;
  #100
  a = 2'b11;
  b = 2'b10;
  cin = 1'b1;
  #100
  $stop;
end

endmodule