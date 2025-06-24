`timescale 10ps/1ps

module four_bit_binary_counter_tb;
    reg clk, rst, t;
    wire qa, qb, qc, qd;

    four_bit_binary_counter uut(
        .clk(clk),
        .reset(rst),
        .t(t),
        .Qa(qa),
        .Qb(qb),
        .Qc(qc),
        .Qd(qd)
    );

    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,four_bit_binary_counter_tb);

        $monitor("Time : %0t | Clk : %b | Reset : %b | T : %b | Qd Qc Qb Qa : %b %b %b %b",$time, clk, rst, t, qd, qc, qb, qa);
        rst =1 ; t = 0;
        #10 rst = 0;
        t = 1;
        #200;
        #10 $finish;
    end
endmodule