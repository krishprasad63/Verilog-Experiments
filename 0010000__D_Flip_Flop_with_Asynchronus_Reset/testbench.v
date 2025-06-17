module tb_d_flip_flop_async_reset;

reg clk;
reg rst;
reg d;
wire q;

d_flip_flop_async_reset uut(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(0, tb_d_flip_flop_async_reset);
    $monitor("Time=%0t | clk=%b rst=%b d=%b q=%b", $time, clk, rst, d, q);

    rst = 1; d = 0;
    #12 rst = 0; d = 1;
    #10 d = 0;
    #10 rst = 1;
    #5 rst = 0; d = 1;
    #10 $finish;
end

endmodule
