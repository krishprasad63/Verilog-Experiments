`timescale 10ps/1ps

module decade_counter_mod_ten_tb;
    reg clear, reset, t, clk;
    wire [3:0] Q;
    wire [3:0] Q_bar;

    decade_counter_mod_ten uut(
        .clock(clk),
        .clear(clear),
        .preset(reset),
        .T(t),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial 
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,decade_counter_mod_ten_tb);

        $monitor("Time : %0t | Clk : %b | Reset : %b | Clear : %b | T : %b | Q : %b",$time, clk, reset, clear, t, Q_bar);
        reset =1 ;t=0; 
        #10 reset = 0; clear = 0; t = 1;
        
        #300;
        #10 $finish;
    end
endmodule