`timescale 1ns / 1ps

module d_flip_flop_tb;

    reg d;
    reg clk;
    wire q;

    d_flip_flop uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0, uut);
        $monitor("Time: %0dns | clk = %b | d = %b | q = %b", $time, clk, d, q);
        d = 0;
        #12;

        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #10;

        #20;
        $finish;
    end

 

endmodule
