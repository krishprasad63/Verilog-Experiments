`timescale 10ns/1ns

module graycode_to_binary_converter_tb;

    reg [3:0] gray;
    wire [3:0] bin;

    graycode_to_binary_converter uut(
        .binary(bin),
        .graycode(gray)
    );

    initial begin
        $dumpfile("vcd_gg.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | Graycode : %b| Binary : %b ",$time, gray, bin);

        gray = 4'b0000;
        #10 gray = 4'b0001;
        #10 gray = 4'b0010;
        #10 gray = 4'b0011;
        #10 gray = 4'b0100;
        #10 gray = 4'b0101;
        #10 gray = 4'b0111;
        #10 gray = 4'b1000;
        #10 gray = 4'b1001;
        #10 gray = 4'b1010;
        #10 gray = 4'b1011;
        #10 gray = 4'b1100;
        #10 gray = 4'b1110;
        #10 gray = 4'b1111;
        #10 $finish;
    end
endmodule