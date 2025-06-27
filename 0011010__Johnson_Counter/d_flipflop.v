module d_flipflop(
    input d,
    input clear,
    input ori,
    input clk,
    output reg q,
    output q_bar
);
    assign q_bar =~q;
    always @(posedge clk or posedge clear) begin
        if (ori & clear)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
