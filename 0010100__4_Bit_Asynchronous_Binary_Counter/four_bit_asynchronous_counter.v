module four_bit_asynchronous_counter(
    input t,
    input clk,
    input reset,
    output [3:0] Q,
    output [3:0] Q_bar
);
    
    wire clk_b, clk_c, clk_d;

    t_flipflop m1(
        .t(t),
        .clk(clk),
        .rst(reset),
        .q(Q[0]), 
        .q_bar(Q_bar[0])
    );

    t_flipflop m2(
        .t(t),
        .clk(clk_b),
        .rst(reset),
        .q(Q[1]), 
        .q_bar(Q_bar[1])
    );

    t_flipflop m3(
        .t(t),
        .clk(clk_c),
        .rst(reset),
        .q(Q[2]), 
        .q_bar(Q_bar[2])
    );

    t_flipflop m4(
        .t(t),
        .clk(clk_d),
        .rst(reset),
        .q(Q[3]), 
        .q_bar(Q_bar[3])
    );

    assign clk_b = Q[0];
    assign clk_c = Q[1];
    assign clk_d = Q[2];
    
endmodule