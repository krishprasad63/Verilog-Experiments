module four_to_one_mux(
    input [3:0] In,
    input[1:0] Se,
    output R
);
    wire [1:0] t;
    two_to_one_mux M1(
        .I(In[1:0]),
        .S(Se[0]),
        .Y(t[0])
    );

    two_to_one_mux M2(
        .I(In[3:2]),
        .S(Se[0]),
        .Y(t[1])
    );

    two_to_one_mux M3(
        .I(t[1:0]),
        .S(Se[1]),
        .Y(R)
    );
    
endmodule