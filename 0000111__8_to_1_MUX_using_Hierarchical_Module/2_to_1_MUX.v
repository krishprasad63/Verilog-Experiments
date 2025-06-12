module two_to_one_mux(
    input [1:0]I,
    input S,
    output Y
);
    wire nots, and_1, and_2;

    not u1(nots, S);
    and u2(and_1, I[0], nots);
    and u3(and_2, I[1], S);
    or u4(Y, and_1, and_2);
    
endmodule