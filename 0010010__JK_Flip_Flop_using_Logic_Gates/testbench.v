`timescale 1ns / 1ps

module tb_jk_flip_flop;

    reg C;
    reg J;
    reg K;
    reg RESETn;
    wire Q;
    wire Qn;

    jk_flip_flop_master_slave uut (
        .Q(Q),
        .Qn(Qn),
        .C(C),
        .J(J),
        .K(K),
        .RESETn(RESETn)
    );

    initial begin
        C = 0;
        forever #5 C = ~C;
    end

    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, tb_jk_flip_flop);

        J = 0; K = 0; RESETn = 0;
        #10;

        RESETn = 1;
        #10;

        J = 1; K = 0;
        #20;

        J = 0; K = 1;
        #20;

        J = 1; K = 1;
        #20;

        J = 0; K = 0;
        #20;

        J = 1; K = 0;
        #20;

        J = 0; K = 1;
        #20;

        J = 1; K = 1;
        #20;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | RESETn=%b | C=%b | J=%b | K=%b | Q=%b | Qn=%b", 
                 $time, RESETn, C, J, K, Q, Qn);
    end

endmodule
