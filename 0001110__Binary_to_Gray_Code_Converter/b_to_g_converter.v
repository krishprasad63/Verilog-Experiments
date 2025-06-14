module binary_to_gray_code_converter(
    input [3:0] binary,
    output [3:0] gray_code
);
    assign gray_code[3]=binary[3];
    assign gray_code[2]=binary[3] ^ binary[2];
    assign gray_code[1]=binary[2] ^ binary[1];
    assign gray_code[0]=binary[1] ^ binary[0];
endmodule