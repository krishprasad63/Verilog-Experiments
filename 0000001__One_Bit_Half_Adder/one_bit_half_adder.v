// This module implements a one-bit half adder

module one_bit_half_adder (
    input A,
    input B,
    output sum,
    output cout
);

    assign sum = A ^ B;
    assign cout = A & B;

endmodule