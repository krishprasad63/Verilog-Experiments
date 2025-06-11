`timescale 10ns/1ns

module mux_tb;

    reg in0;
    reg in1;
    reg s;

    wire y;

    two_to_one_mux uut(
        .I0(in0),
        .I1(in1),
        .S(s),
        .Y(y)
    );

    initial begin
        $dumpfile("vcd_mux.vcd");
        $dumpvars(0,uut);


        $monitor("Time :%t | I0 : %b | I1 : %b | S : %b | Y : %b",$time,in0,in1,s,y);

        in0 = 1'b0;
        in1 = 1'b0;
        s= 1'b0;
        #10 in0 = 1'b1;
        #10 s = 1'b1;
        #10 in1 = 1'b1;
        #10 in0 = 1'b0; s = 1'b0;
        #10 $finish;  
    end
endmodule