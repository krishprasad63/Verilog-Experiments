module eight_bit_comparator(
    input [7:0] A,
    input [7:0] B,
    output AGB,
    output AEB,
    output ALB
);
    wire agb_high, aeb_high, alb_high;
    wire agb_low, aeb_low, alb_low;
    
    //MSB
    four_bit_comparator M1(
        .A(A[7:4]),
        .B(B[7:4]),
        .AGB(agb_high),
        .ALB(alb_high),
        .AEB(aeb_high)
    );

    //LSB
    four_bit_comparator M2(
        .A(A[3:0]),
        .B(B[3:0]),
        .AGB(agb_low),
        .ALB(alb_low),
        .AEB(aeb_low)
    );

    assign AGB = agb_high | (aeb_high & agb_low);
    assign AEB = aeb_high & aeb_low;
    assign ALB = alb_high | (aeb_high & alb_low);
endmodule