`timescale 10ns/10ns

module one_bit_half_adder_tb;
    reg a, b;

    wire sum, cout;

    one_bit_half_adder test(
        .A(a),
        .B(b),
        .sum(sum),
        .cout(cout)
    );

    initial
    begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, test);

        $monitor ("Time = %0t: a = %b b = %b  |  sum = %b  cout = %b",$time,a,b,sum,cout);
        #10 a=0; b=0;
        #10 a=0; b=1;
        #10 a=1; b=1;
        #10 a=1; b=0;
        #10 a=0; b=1;
        
        #10 $finish;
        
    end

    
endmodule