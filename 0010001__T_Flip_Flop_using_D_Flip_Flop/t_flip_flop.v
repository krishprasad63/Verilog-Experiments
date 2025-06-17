module t_flip_flop_using_d (
    input wire clk,
    input wire rst,
    input wire t,
    output reg q=0
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= t ^ q;
end

endmodule
