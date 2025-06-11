module full_adder(
    input A,
    input B,
    input Cin,
    output sum,
    output cout
);
    assign sum = A^B^Cin;
    assign cout = A&B | Cin&(A^B);
    
endmodule