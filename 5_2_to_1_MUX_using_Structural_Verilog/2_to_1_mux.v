//For structural modeling of 2:1 mux, we have to implement the 2 to 1 mux using gates
// let S stands for select lines
// I0, I1 be two inputs and Y be the required output
// Expression for Y = E.(S'.I0 + S.I1)
//let's implement now

module two_to_one_mux(
    input I0,
    input I1,
    input S,
    output Y
);
    wire nots, and_0_out, and_1_out;

    not u1(nots, S);
    and u2(and_0_out, nots, I0);
    and u3(and_1_out, S, I1);
    or u4(Y, and_0_out,and_1_out);

endmodule
