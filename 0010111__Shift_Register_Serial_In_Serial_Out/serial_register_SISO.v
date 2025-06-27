//4-bit data storage will be done
module serial_register_SISO(
    input data,
    input clk,
    input rst,
    output Q
);
    register abc(
        .d(data),
        .clk(clk),
        .rst(rst),
        .q(Q)
    );

endmodule