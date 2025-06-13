module eight_bit_comparator_tb;
    reg [7:0] A;
    reg [7:0] B;

    wire AGB, AEB, ALB;

    eight_bit_comparator uut(
        .A(A),
        .B(B),
        .AGB(AGB),
        .AEB(AEB),
        .ALB(ALB)
    );

    initial begin
        $dumpfile("vcd_comparator.vcd");
        $dumpvars(0, uut);

        $monitor("Time :%0t | A : %b | B : %b | A>B : %b | A=B : %b | A<B : %b ",$time, A, B, AGB, AEB, ALB);

        A= 8'b00000000; B= 8'b00000000;
        #10 A= 8'b00000001; B= 8'b00000000;
        #10 A= 8'b00110000; B= 8'b01100000;
        #10 A= 8'b11000000; B= 8'b11100000;
        #10 A= 8'b00000000; B= 8'b00001100;
        #10 A= 8'b00000000; B= 8'b00000000;
        #10 A= 8'b11000000; B= 8'b11000000;
        #10 A= 8'b11111111; B= 8'b11111111;
        #10 A= 8'b10011000; B= 8'b10000110;
        #10 A= 8'b00000000; B= 8'b00000000;
        #10 A= 8'b11001100; B= 8'b11001111;
        #10 A= 8'b10000100; B= 8'b10000110;
        #10 A= 8'b01000100; B= 8'b01000010;
        #10 A= 8'b00111100; B= 8'b00111100;
        #10 $finish;
    end
endmodule