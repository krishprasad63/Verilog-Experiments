module ring_counter(
    input clk,
    input preset,
    input clear,
    input ori,
    output [3:0] q_out
);
    wire [3:0] D;
    wire [3:0] Q;

    assign D[0] = Q[3];
    assign D[1] = Q[0];
    assign D[2] = Q[1];
    assign D[3] = Q[2];

    assign q_out = Q;
    d_flipflop m1(
        .d(D[0]),
        .preset(preset),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[0])
    );

    d_flipflop m2(
        .d(D[1]),
        .preset(1'b0),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[1])
    );

    d_flipflop m3(
        .d(D[2]),
        .preset(1'b0),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[2])
    );

    d_flipflop m4(
        .d(D[3]),
        .preset(1'b0),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[3])
    );

    

endmodule