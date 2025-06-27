`timescale 1ns/1ps

module ring_counter_tb;

    reg clk;
    reg preset;
    reg clear;
    reg ori;
    wire [3:0] q_out;

    ring_counter uut (
        .clk(clk),
        .preset(preset),
        .clear(clear),
        .ori(ori),
        .q_out(q_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0, ring_counter_tb);
        $monitor("Time=%0t clk=%b preset=%b clear=%b ori=%b q_out=%b", 
                 $time, clk, preset, clear, ori, q_out);

        clear = 1; preset = 0; ori = 1;
        #40;

        clear = 0; preset = 1; ori = 1;
        #5;

        preset = 0;
        #100;

        $finish;
    end

endmodule
