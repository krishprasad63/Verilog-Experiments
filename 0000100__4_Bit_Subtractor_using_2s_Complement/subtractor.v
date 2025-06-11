// For 2s complement, add 1 in 1s complement, and for 1's complement, take negation of the input
// We know that for subtacting in 2s complement form, the number can be signed or unsigned..
// So let's there be a 5 bit number in which the msb will show the sign

//In this program the input will be in 2's complement form and we know that 2's complement of +ve number is negative and vice versa

//We also know that as its a 5 bit number, the results will go invalid if the subtractions results exceeds 15 or it's below -16.
//In 2s complement subtraction, A-B is effectively A + 2's complement of B

module four_bit_subtractor(
    input [3:0] A,
    input [3:0] B,
    output [4:0] result
);
    wire [4:0] A_0, B_0;
    assign A_0 = {1'b0, A}; 

    assign B_0 = {1'b0, ~B} + 5'b00001;
    assign result = A_0 + B_0;
endmodule