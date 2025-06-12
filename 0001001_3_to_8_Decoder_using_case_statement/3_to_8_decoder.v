//if input in demultiplexer is considered or connected to +5 v or logic 1, we can construct decoder... it was just relation between the two
//let's implement 3:8 decoder now
//3 inputs and as accoradence to input output will change

module three_to_eight_decoder(
    input [2:0] inp,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'b00000000;
        out[inp] = 1'b1;
    end
endmodule