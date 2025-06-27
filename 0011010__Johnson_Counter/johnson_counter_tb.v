`timescale 1ns/1ps

module johnson_counter_tb;

    reg clk;
    reg clear;
    reg ori;
    wire [3:0] q_out;

    johnson_counter uut (
        .clk(clk),
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
        $dumpvars(0, johnson_counter_tb);
        $monitor("Time=%0t clk=%b clear=%b ori=%b q_out=%b", 
                 $time, clk, clear, ori, q_out);

        clear = 1;ori = 1;
        #40;

        clear = 0; ori = 1;
        #5;

        #100;

        $finish;
    end

endmodule
