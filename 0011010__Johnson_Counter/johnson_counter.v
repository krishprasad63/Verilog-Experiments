module johnson_counter(
    input clk,
    input clear,
    input ori,
    output [3:0] q_out
);
    wire [3:0] D;
    wire [3:0] Q;
    wire [3:0] Q_bar;

    assign D[0] = Q_bar[3];
    assign D[1] = Q[0];
    assign D[2] = Q[1];
    assign D[3] = Q[2];

    assign q_out = Q;
    d_flipflop m1(
        .d(D[0]),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[0]),
        .q_bar(Q_bar[0])
    );

    d_flipflop m2(
        .d(D[1]),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[1]),
        .q_bar(Q_bar[1])
    );

    d_flipflop m3(
        .d(D[2]),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[2]),
        .q_bar(Q_bar[2])
    );

    d_flipflop m4(
        .d(D[3]),
        .clear(clear),
        .ori(ori),
        .clk(clk),
        .q(Q[3]),
        .q_bar(Q_bar[3])
    );

    

endmodule