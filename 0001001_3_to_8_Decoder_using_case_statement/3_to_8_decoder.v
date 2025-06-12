//if input in demultiplexer is considered or connected to +5 v or logic 1, we can construct decoder... it was just relation between the two
//let's implement 3:8 decoder now
//3 inputs and as accoradence to input output will change

module three_to_eight_decoder(
    input [2:0] inp,
    output reg [7:0] out
);
    always @(*) begin
        case (inp)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000; // Should never happen with 3-bit input
        endcase
    end
endmodule
