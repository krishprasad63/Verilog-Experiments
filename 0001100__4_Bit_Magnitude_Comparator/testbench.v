module four_bit_comparator_tb;

    reg [3:0] A;
    reg [3:0] B;

    wire AGB, AEB, ALB;

    four_bit_comparator uut(
        .A(A),
        .B(B),
        .AGB(AGB),
        .AEB(AEB),
        .ALB(ALB)
    );

    initial begin
        $dumpfile("vcd_comparator.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | A : %b | B : %b | AGB : %b | AEB : %b | ALB : %b", $time, A, B, AGB, AEB, ALB);
        A = 4'b0000; B = 4'b0000;
        #10 A = 4'b1100; B = 4'b0110;
        #10 A = 4'b1110; B = 4'b1110;
        #10 A = 4'b0011; B = 4'b0111;
        #10 A = 4'b0010; B = 4'b0011;
        #10 A = 4'b1110; B = 4'b1110;
        #10 A = 4'b1111; B = 4'b1110;
        #10 A = 4'b0110; B = 4'b0010;
        #10 A = 4'b0010; B = 4'b0110;
        #10 $finish;
    end


endmodule