`timescale 10ns/1ns

module subtractor_tb;
    reg [3:0] A;
    reg [3:0] B;

    wire [4:0] res;

    four_bit_subtractor uut(
        .A(A),
        .B(B),
        .result(res)
    );

    initial begin
        $dumpfile("subtractor.vcd");
        $dumpvars(0,uut);

        A = 4'b0000;
        B = 4'b0000;

        $monitor("Time :%t | A :%b | B :%b | Result :%b  ",$time, A, B, res);

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