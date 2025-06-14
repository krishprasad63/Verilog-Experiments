`timescale 1ns / 1ps

module parity_generator_and_checker_tb;

    reg [3:0] A;
    reg [2:0] noise;

    wire [4:0] even_parity;
    wire [4:0] odd_parity;
    wire noise_even_detected;
    wire noise_odd_detected;
    wire [4:0] noise_even;
    wire [4:0] noise_odd;

    parity_generator_and_checker uut (
        .A(A), 
        .noise(noise), 
        .even_parity(even_parity), 
        .odd_parity(odd_parity), 
        .noise_even_detected(noise_even_detected), 
        .noise_odd_detected(noise_odd_detected),
        .noise_even(noise_even),
        .noise_odd(noise_odd)
    );

    initial begin
        $dumpfile("parity_tb.vcd");
        $dumpvars(0, uut);

        $monitor("Time=%0t | A=%b noise=%d | even_parity=%b odd_parity=%b | noise_even=%b noise_odd=%b | even_error=%b odd_error=%b",
                 $time, A, noise, even_parity, odd_parity, noise_even, noise_odd, noise_even_detected, noise_odd_detected);

        #10 A = 4'b1010; noise = 3'd1;
        #10 A = 4'b1111; noise = 3'd2; 
        #10 A = 4'b0000; noise = 3'd1;
        #10 A = 4'b1011; noise = 3'd0; 
        #10 A = 4'b0110; noise = 3'd2; 
        #10 A = 4'b1100; noise = 3'd3; 
        #10 A = 4'b1001; noise = 3'd2; 
        #10 A = 4'b0011; noise = 3'd1;

        $finish;
    end

endmodule
