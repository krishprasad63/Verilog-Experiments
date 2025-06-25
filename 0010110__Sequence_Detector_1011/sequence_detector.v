module sequence_detector(
    input x,
    input clk,
    input reset,
    output [2:0] Q,
    output y
);
    wire [2:0] D;
    assign D[0] = ~Q[0] & Q[1] & Q[2] & x;
    assign D[1] = (~Q[0] & Q[2] & ~x) | (~Q[0] & Q[1] & ~Q[2] & x) | (Q[0] & ~Q[1] & ~Q[2] & ~x);
    assign D[2] = (~Q[0] & ~Q[2] & x) | (~Q[0] & ~Q[2] & x) | (Q[0] & ~Q[1] & ~Q[2] & x);
    assign y = ~Q[0] & Q[1] & Q[2] & x;

    d_flipflop m1(
        .d(D[0]),
        .clk(clk),
        .reset(reset),
        .q(Q[0])
    );
    d_flipflop m2(
        .d(D[1]),
        .clk(clk),
        .reset(reset),
        .q(Q[1])
    );
    d_flipflop m3(
        .d(D[2]),
        .clk(clk),
        .reset(reset),
        .q(Q[2])
    );
    
endmodule