`timescale 10ns/1ns

module eight_to_one_mux_tb;

    reg [7:0] inp;
    reg [2:0] select;

    wire out;

    eight_to_one_mux uut(
        .in(inp),
        .sel(select),
        .out(out)
    );

    initial 
    begin
        $dumpfile("8_to_1_VCD.vcd");
        $dumpvars(0,uut);

        $monitor("Time : %0t | 8-Bit Input : %b | 3-Bit Select : %b | Output : %b",$time, inp, select, out);
        inp = 8'b00000000;
        select = 3'b000;

        #5 inp = 8'b01010011; select = 3'b001;
        #5 inp = 8'b01010011; select = 3'b010;
        #5 inp = 8'b01011011; select = 3'b011;
        #5 inp = 8'b11010011; select = 3'b110;
        #5 inp = 8'b01010011; select = 3'b111;
        #5 inp = 8'b01010011; select = 3'b100;
        #5 inp = 8'b11010011; select = 3'b101;
        #5 inp = 8'b01110011; select = 3'b110;
        #5 inp = 8'b01000011; select = 3'b111;
        #5 inp = 8'b10010011; select = 3'b001;
        #5 inp = 8'b11000010; select = 3'b011;
        #5 $finish;
    end

endmodule