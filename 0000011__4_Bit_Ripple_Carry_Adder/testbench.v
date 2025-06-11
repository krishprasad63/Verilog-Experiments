`timescale 10ns/1ns

module ripple_carry_adder_tb;
    reg [3:0] A;
    reg [3:0] B;
    wire [4:0] Sum;

    ripple_carry_adder uut(
        .A(A),
        .B(B),
        .Sum(Sum)
    );

    initial begin
        $dumpfile("ripple_carry.vcd");
        $dumpvars(0,uut);

        A = 4'b0000; 
        B = 4'b0000;
        $monitor("Time :%t | A : %b | B :%b | Sum : %b",$time,A,B,Sum);
        
        #10 A = 4'b0001; B = 4'b0000;
        #10 A = 4'b0001; B = 4'b1001;
        #10 A = 4'b0010; B = 4'b0001;
        #10 A = 4'b0010; B = 4'b0010;
        #10 A = 4'b0011; B = 4'b0010;
        #10 A = 4'b0011; B = 4'b0011;
        #10 A = 4'b0100; B = 4'b1100;
        #10 A = 4'b1001; B = 4'b1100;
        #10 A = 4'b1111; B = 4'b1000;

        #10 $finish;
    end
    
endmodule