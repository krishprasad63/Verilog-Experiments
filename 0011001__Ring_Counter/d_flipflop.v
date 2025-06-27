module d_flipflop(
    input d,
    input preset,
    input clear,
    input ori,
    input clk,
    output reg q
);
    always @(posedge clk or posedge preset or posedge clear) begin
        if (ori & preset)
            q <= 1'b1;
        else if (ori & clear)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
