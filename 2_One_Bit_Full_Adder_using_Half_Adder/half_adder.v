// This module implements a one-bit half adder

module one_bit_half_adder (
    input A,
    input B,
    output s,
    output c
);

    assign s = A ^ B;
    assign c = A & B;

endmodule