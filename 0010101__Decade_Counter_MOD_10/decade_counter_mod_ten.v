module decade_counter_mod_ten(
    input T,
    input clock,
    input preset,
    input clear,
    output [3:0] Q,
    output [3:0] Q_bar
);
    wire clk_b, clk_c, clk_d;
    wire auto_clear;
    wire clear_eff;

    assign auto_clear = Q[2] & ~Q[3] & Q[0] & ~Q[1];
    assign clear_eff = clear | auto_clear;

    assign clk_b = Q[0];
    t_flipflop m1(
        .t(T),
        .clk(clock),
        .preset(preset),
        .clear(clear_eff),
        .q(Q[0]),
        .q_bar(Q_bar[0])
    );

    assign clk_c = Q[1];
    t_flipflop m2(
        .t(T),
        .clk(clk_b),
        .preset(preset),
        .clear(clear_eff),
        .q(Q[1]),
        .q_bar(Q_bar[1])
    );
    
    assign clk_d = Q[2];
    t_flipflop m3(
        .t(T),
        .clk(clk_c),
        .preset(preset),
        .clear(clear_eff),
        .q(Q[2]),
        .q_bar(Q_bar[2])
    );
    
    t_flipflop m4(
        .t(T),
        .clk(clk_d),
        .preset(preset),
        .clear(clear_eff),
        .q(Q[3]),
        .q_bar(Q_bar[3])
    );

    
endmodule