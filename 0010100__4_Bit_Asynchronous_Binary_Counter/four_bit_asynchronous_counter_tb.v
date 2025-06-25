`timescale 10ps/1ps

module four_bit_asynchronous_counter_tb;
    reg clk, rst, t;
    wire [3:0] Q;
    wire [3:0] Q_bar;

    four_bit_asynchronous_counter uut(
        .clk(clk),
        .reset(rst),
        .t(t),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial 
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,four_bit_asynchronous_counter_tb);

        $monitor("Time : %0t | Clk : %b | Reset : %b | T : %b | Q : %b",$time, clk, rst, t, Q_bar);
        rst =1 ;t=0; 
        #10 rst = 0; t = 1;
        
        #300;
        #10 $finish;
    end
endmodule