module four_bit_comparator(
    input [3:0] A,
    input [3:0] B,
    output AGB,
    output AEB,
    output ALB
);
    //for A=B
    wire x1, x2, x3, x0;

    xnor u1(x3, A[3], B[3]);
    xnor u2(x2, A[2], B[2]);
    xnor u3(x1, A[1], B[1]);
    xnor u4(x0, A[0], B[0]);
    and u5(AEB, x1, x2, x3, x0);

    
    //for A>B
    wire og1, og2, og3, og4;
    wire yg0 ,yg1, yg2;
    wire notb3, notb2, notb1, notb0;

    not u6(notb3, B[3]);
    not u7(notb2, B[2]);
    not u8(notb1, B[1]);
    not u9(notb0, B[0]);

    and u10(og1, A[3], notb3);
    and u11(yg2, A[2], notb2);
    and u12(yg1, A[1], notb1);
    and u13(yg0, A[0], notb0);

    and u14(og2, x3, yg2);
    and u15(og3, x3, x2, yg1);
    and u16(og4, x3, x2, x1, yg0);

    or u17(AGB, og1, og2, og3, og4);

    //for A<B
    wire ol1, ol2, ol3, ol4;
    wire yl0 ,yl1, yl2;
    wire nota3, nota2, nota1, nota0;

    not u18(nota3, A[3]);
    not u19(nota2, A[2]);
    not u20(nota1, A[1]);
    not u21(nota0, A[0]);

    and u22(ol1, B[3], nota3);
    and u23(yl2, B[2], nota2);
    and u24(yl1, B[1], nota1);
    and u25(yl0, B[0], nota0);

    and u26(ol2, x3, yl2);
    and u27(ol3, x3, x2, yl1);
    and u28(ol4, x3, x2, x1, yl0);

    or u29(ALB, ol1, ol2, ol3, ol4);
    
endmodule