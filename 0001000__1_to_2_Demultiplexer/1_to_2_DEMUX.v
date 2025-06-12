module one_to_two_demux(
    input I,
    input select,
    output Y0,
    output Y1
);
    wire nots;
    not u1(nots, select);
    and u2(Y0, nots, I);
    and u3(Y1, select, I);
endmodule
//file.vvp 1_to_2_DEMUX.v testbench.v