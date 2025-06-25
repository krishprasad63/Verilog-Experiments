`timescale 10ps/1ps

module sequence_detector_tb;
    reg clk, reset, x;
    wire [2:0] Q;
    wire y;

    sequence_detector uut (
        .x(x),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end


    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, sequence_detector_tb);

        $monitor("Time: %0t | clk: %b | reset: %b | x: %b | Q: %b | y: %b", 
                  $time, clk, reset, x, Q, y);

        reset = 1; x = 0;
        #15 reset = 0;

        
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 0;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 1;
        #20 x = 1;
        #20 x = 1;
        #20 x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 x = 1;
        #20 x = 0;

        #100;
        $finish;
    end
endmodule
