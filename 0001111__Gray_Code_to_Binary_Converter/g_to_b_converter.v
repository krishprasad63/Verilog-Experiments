module graycode_to_binary_converter(
    input [3:0] graycode,
    output [3:0] binary
);
    assign binary[3] = graycode[3];
    assign binary[2] = binary[3] + graycode[2];
    assign binary[1] = binary[2] + graycode[1];
    assign binary[0] = binary[1] + graycode[0];
endmodule