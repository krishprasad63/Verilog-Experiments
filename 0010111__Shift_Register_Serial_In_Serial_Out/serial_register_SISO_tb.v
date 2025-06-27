`timescale 10ps/1ps
module serial_register_SISO_tb;
    reg clk, reset;
    reg data;
    wire Q;

    serial_register_SISO uut(
        .data(data),
        .clk(clk),
        .rst(reset),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #20 clk = ~clk;
    end

    initial begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,serial_register_SISO_tb);


        $monitor("Time : %0t | Clock : %b | Reset : %b | Data : %b | Q : %b",$time, clk, reset, data, Q);

         
        reset = 1; data = 0;
        @(posedge clk);  
        reset = 0;

        // Serial data input (bitstream): 1 0 1 0 0 0 1 1 1 0 1 1 0 1 1 0 1
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        @(posedge clk);
        $finish;
    end

    
    task send_bit(input reg bit_val);
        begin
            @(posedge clk);
            data = bit_val;
        end
    endtask

endmodule