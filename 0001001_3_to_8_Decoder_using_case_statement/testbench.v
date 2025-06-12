`timescale 10ns/1ns

module three_to_eight_decoder_tb;

    reg [2:0] inp;
    wire [7:0] out;

    three_to_eight_decoder uut(
        .inp(inp),
        .out(out)
    );

    initial begin
        $dumpfile("vcd_3_to_8.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | Input : %b | Output : %b",$time, inp, out);
        inp = 3'b000;
        //out = 8'b00000000;

        #10 inp = 3'b001;
        #10 inp = 3'b010;
        #10 inp = 3'b011;
        #10 inp = 3'b100;
        #10 inp = 3'b101;
        #10 inp = 3'b110;
        #10 inp = 3'b111;
        #10 $finish;
    end
endmodule