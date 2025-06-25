`timescale 10ps/1ps
module t_flipflop(
    input t,
    input clk,
    input rst,
    output reg q,
    output q_bar
);
    always @(posedge clk, posedge rst) 
    begin
        
        if (rst) begin
            q <= 1'b0;
        end
        
        else q <= t ^ q;
    end
    assign q_bar = ~q;
    
endmodule