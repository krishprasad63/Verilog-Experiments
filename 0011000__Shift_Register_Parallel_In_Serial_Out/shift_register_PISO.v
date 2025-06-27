module shift_register_PISO(
    input [3:0] data,
    input clk,
    input shift,
    input rst,
    output q_out
);
    wire load;
    assign load = ~shift;
    wire [3:0] B;
    wire [3:0] Q;  
    assign B = data;
    wire [3:0] D;

    
    assign D[0]= B[0];
    assign D[1] = (Q[0]&shift)|(B[1]&load);
    assign D[2] = (Q[1]&shift)|(B[2]&load);
    assign D[3] = (Q[2]&shift)|(B[3]&load);

    assign q_out = Q[3];
    d_flipflop m1(
        .d(D[0]),
        .clk(clk),
        .rst(rst),
        .q(Q[0])
    );
    d_flipflop m2(
        .d(D[1]),
        .clk(clk),
        .rst(rst),
        .q(Q[1])
    );
    d_flipflop m3(
        .d(D[2]),
        .clk(clk),
        .rst(rst),
        .q(Q[2])
    );
    d_flipflop m4(
        .d(D[3]),
        .clk(clk),
        .rst(rst),
        .q(Q[3])
    );
    
endmodule