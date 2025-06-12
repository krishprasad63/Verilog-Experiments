module eight_to_one_mux(
    input [7:0] in,
    input [2:0] sel,
    output out
);
    wire [1:0] t;

    four_to_one_mux F1(
        .In(in[3:0]),
        .Se(sel[1:0]),
        .R(t[0])
    );

    four_to_one_mux F2(
        .In(in[7:4]),
        .Se(sel[1:0]),
        .R(t[1])
    );

    two_to_one_mux M0(
        .I(t[1:0]),
        .S(sel[2]),
        .Y(out)
    );
    
endmodule

//iverilog -o file.vvp 2_to_1_MUX.v 4_to_1_MUX.v 8_to_1_MUX.v 8_to_1_tb.v