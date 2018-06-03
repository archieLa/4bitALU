/*
By Artur Lach
Test bench to test 4bit ALU
*/


module ALU_4bit_tb();

reg signed [3:0] a,b;
reg [3:0] opcode;
reg cin;
wire signed [3:0] out;
wire cout;


// instance of device under test
 ALU_4bit DUT(.in1(a), .in2(b), .cin(cin), .opcode(opcode), .cout(cout), .out(out));

 initial begin
    a = 4'b0010;
    b = 4'b0001;
    cin = 1'b1;
    opcode = 4'b0100; // addition
    $display("in1=%b, in2=%b, cin=%b",a,b,cin);
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b0101; // subtraction
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1000;   // not
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);    
    #100
    opcode = 4'b1001;   // or 
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1010;   // and
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1011;   // xor
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1100;   // shift left logical
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1101;   // shift right logical
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1110;   // shift right arithmetic
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b1111;   // passthrough
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    opcode = 4'b0000;   // not recognizable opcode
    #20
    $display("t=%d, opcode=%b, out=%b, cout=%b",$time,opcode,out,cout);
    #100
    $stop;
 end

 endmodule