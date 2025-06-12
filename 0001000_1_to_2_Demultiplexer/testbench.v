`timescale 10ns/1ns

module one_to_two_demux_tb;

    reg inp;
    reg sel;

    wire Y0, Y1;

    one_to_two_demux uut(
        .I(inp),
        .select(sel),
        .Y0(Y0),
        .Y1(Y1)
    );

    initial begin
        $dumpfile("demux_vcd.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | Input : %b | Select : %b | Y0 : %b | Y1 :%b ",$time, inp, sel, Y0, Y1);
        inp = 1'b0;
        sel = 1'b0;

        #10 inp = 1'b0 ; sel = 1'b1;
        #10 inp = 1'b1 ; sel = 1'b1;
        #10 inp = 1'b1 ; sel = 1'b0;
        #10 inp = 1'b0 ; sel = 1'b0;
        #10 $finish;
    end
endmodule