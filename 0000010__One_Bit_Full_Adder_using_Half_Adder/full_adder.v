module full_adder_using_half_adder(
    input A,
    input B,
    input Cin,
    output sum,
    output cout
);

wire temp_sum;
wire temp_carry;

one_bit_half_adder test(
    .A(A),
    .B(B),
    .s(temp_sum),
    .c(temp_carry)
);

wire temp_carry_second;

one_bit_half_adder test_second(
    .A(temp_sum),
    .B(Cin),
    .s(sum),
    .c(temp_carry_second)
);

assign cout = temp_carry | temp_carry_second ;

    
endmodule