`timescale 10ns/1ns

module four_to_two_encoder_tb;

    reg [3:0] in;
    wire y1, y2;

    four_to_two_encoder uut(
        .inp(in),
        .y1(y1),
        .y2(y2)
    );

    initial begin
        $dumpfile("vcd_4_to_1.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | Input : %b | Y1 : %b | Y2 : %b",$time, in, y1, y2);

        in = 4'b0000;

        #10 in = 4'b0001;
        #10 in = 4'b0010;
        #10 in = 4'b0011;
        #10 in = 4'b0100;
        #10 in = 4'b0101;
        #10 in = 4'b0110;
        #10 in = 4'b0111;
        #10 in = 4'b1000;
        #10 in = 4'b1001;
        #10 in = 4'b1010;
        #10 in = 4'b1011;
        #10 in = 4'b1100;
        #10 in = 4'b1101;
        #10 in = 4'b1110;
        #10 in = 4'b1111;

        #10 $finish;
    end
endmodule