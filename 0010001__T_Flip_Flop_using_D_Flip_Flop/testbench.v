module t_flip_flop_using_d_tb;

  reg clk, rst, t;
  wire q;

  // Instantiate the T flip-flop module
  t_flip_flop_using_d uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q)
  );

  // Clock generation (period = 10 units)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Dump waveform
    $dumpfile("t_flip_flop.vcd");
    $dumpvars(0, uut);

    // Monitor outputs
    $monitor("Time=%0t | clk=%b | rst=%b | t=%b | q=%b", $time, clk, rst, t, q);

    rst = 0; t = 0;
    #10 rst = 1; t = 0;
    #10 rst = 0;
    #10 t = 1;
    #40 t = 0;
    #20 t = 1;
    #40;

    $finish;
  end

endmodule
