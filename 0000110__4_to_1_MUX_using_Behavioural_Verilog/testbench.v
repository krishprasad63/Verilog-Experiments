`timescale 10ns/1ns

module four_to_one_mux_tb;
    reg [3:0] in;
    reg [1:0] sel;
    
    wire out;

    four_to_one_mux uut(
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("vcd_4_to_1_mux.vcd");
        $dumpvars(0,uut);

        $monitor("Time :%0t | 4-Bit Input : %b | 2-Bit Select : %b | Output : %b ",$time,in,sel,out);
        in = 4'b0000;
        sel = 2'b00;

        #10 in = 4'b1010 ; sel = 2'b01;
        #10 in = 4'b1110 ; sel = 2'b00;
        #10 in = 4'b1011 ; sel = 2'b10;
        #10 in = 4'b0010 ; sel = 2'b11;
        #10 in = 4'b0011 ; sel = 2'b01;
        #10 in = 4'b1111 ; sel = 2'b00;
        #10 in = 4'b0111 ; sel = 2'b11;
        #10 in = 4'b1000 ; sel = 2'b10;
        #10 in = 4'b1001 ; sel = 2'b00;

        #10 $finish;
    end

endmodule