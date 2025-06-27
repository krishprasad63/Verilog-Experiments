`timescale 1ns/1ps

module shift_register_PISO_tb;

    reg [3:0] data;
    reg clk;
    reg shift;
    reg rst;
    wire q_out;

    shift_register_PISO uut (
        .data(data),
        .clk(clk),
        .shift(shift),
        .rst(rst),
        .q_out(q_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0, shift_register_PISO_tb);
        $monitor("Time=%0t | rst=%b | shift=%b | data=%b | q_out=%b", $time, rst, shift, data, q_out);

        clk = 0;
        rst = 1;
        shift = 0;
        data = 4'b0000;

        #10 rst = 0;
        #10 data = 4'b0101; shift = 0;
        #10 shift = 1;
        #40;
        #10 shift = 0; data = 4'b1010;
        #10 shift = 1;
        #40;

        $finish;
    end

endmodule
