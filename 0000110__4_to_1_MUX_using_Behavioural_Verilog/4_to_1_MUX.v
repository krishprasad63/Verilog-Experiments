//We have to design a 4 to 1 multiplexer using behavioural verilog
//we can directly take the 4 bit input stream in which each bits will be I0, I1, I2, and I3
//As 4 input are there then there would be 2 bit select stream
module four_to_one_mux(
    input [3:0] in,
    input [1:0] sel,
    output out
);
    assign out = in[sel];
endmodule