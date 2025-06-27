module register(
    input d,
    input clk,
    input rst,
    output q
);
    wire [3:0] Q;
    assign q = Q[3];
    d_flipflop m1(
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(Q[0])
    );
    
    d_flipflop m2(
        .d(Q[0]),
        .clk(clk),
        .rst(rst),
        .q(Q[1])
    );
    
    d_flipflop m3(
        .d(Q[1]),
        .clk(clk),
        .rst(rst),
        .q(Q[2])
    );
    
    d_flipflop m4(
        .d(Q[2]),
        .clk(clk),
        .rst(rst),
        .q(Q[3])
    );
    
    
endmodule