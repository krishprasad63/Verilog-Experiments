module four_bit_binary_counter(
    input t,
    input clk,
    input reset,
    output Qa,
    output Qb,
    output Qc,
    output Qd
);
wire Ta, Tb, Tc, Td;

t_flip_flop m1(
    .t(Ta),
    .clk(clk),
    .rst(reset),
    .q(Qa)
);
t_flip_flop m2(
    .t(Tb),
    .clk(clk),
    .rst(reset),
    .q(Qb)
);
t_flip_flop m3(
    .t(Tc),
    .clk(clk),
    .rst(reset),
    .q(Qc)
);
t_flip_flop m4(
    .t(Td),
    .clk(clk),
    .rst(reset),
    .q(Qd)
);

assign Ta = 1;
assign Tb = Qa;
assign Tc = Qb & Qa;
assign Td = Qc & Qb & Qa;

endmodule