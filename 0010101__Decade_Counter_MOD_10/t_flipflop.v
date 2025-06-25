module t_flipflop(
    input t,
    input clk,
    input preset,
    input clear,
    output reg q,
    output q_bar
);
    assign q_bar = ~q;

    always @(posedge clk, posedge preset, posedge clear) 
    begin
        if(preset) q<=1'b1;
        else if(clear) q<=1'b1;
        else q<=t^q;    
    end
endmodule