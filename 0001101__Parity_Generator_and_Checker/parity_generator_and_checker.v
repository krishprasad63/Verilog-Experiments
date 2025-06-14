//given a 4-bit original signal that is to be transmitted, now odd or even parity can be generated
//from the input noise, i will change the thvalue of bit at that location..

module parity_generator_and_checker(
    input [3:0] A,
    input [2:0] noise,
    output reg [4:0]even_parity,
    output reg [4:0] odd_parity,
    output reg noise_even_detected,
    output reg noise_odd_detected,
    output reg [4:0] noise_even,
    output reg [4:0] noise_odd
);
    wire t;

    

    assign t = ^A;
    always @(*) 
        begin
            if (t)
                begin
                    even_parity = {A,1'b1};
                    odd_parity = {A,1'b0}; 
                end
            else
                begin
                    even_parity = {A,1'b0};
                    odd_parity = {A,1'b1}; 
                end
        end
  
    always @(*) begin
        noise_even = even_parity;
        noise_odd  = odd_parity;

        if (noise < 5) begin
            noise_even[noise] = ~even_parity[noise];
            noise_odd[noise]  = ~odd_parity[noise];
        end
    end

    wire x1, x2;
    
    assign x1 = ^noise_even;
    assign x2 = ^noise_odd;

    always @(*) 
        begin
            if (x1) 
                begin
                    noise_even_detected = 1'b1;
                end
            else
                begin
                    noise_even_detected = 1'b0;
                end

            if (x2) 
                begin
                    noise_odd_detected = 1'b0;
                end
            else
                begin
                    noise_odd_detected = 1'b1;
                end
        end

endmodule