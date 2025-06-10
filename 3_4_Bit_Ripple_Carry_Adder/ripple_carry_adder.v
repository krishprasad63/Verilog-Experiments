module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    output [4:0] Sum
);
    wire s_0, s_1, s_2, s_3;
    wire c_0, c_1, c_2, c_3;

    //Cin will be zero at first
    full_adder first(
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),
        .sum(s_0),
        .cout(c_0)
    );

    full_adder second(
        .A(A[1]),
        .B(B[1]),
        .Cin(c_0),
        .sum(s_1),
        .cout(c_1)
    );

    full_adder third(
        .A(A[2]),
        .B(B[2]),
        .Cin(c_1),
        .sum(s_2),
        .cout(c_2)
    );

    full_adder fourth(
        .A(A[3]),
        .B(B[3]),
        .Cin(c_2),
        .sum(s_3),
        .cout(c_3)
    );

    assign Sum = {c_3, s_3, s_2, s_1, s_0};
    
endmodule