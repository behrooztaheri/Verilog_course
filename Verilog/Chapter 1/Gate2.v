module Gate_2
(
    input A, 
    input B, 
    input C, 
    output F, 
    output G, 
    output Times, 
    output Sums
);

    wire XOR1, AND1, AND2;

    assign XOR1 = A ^ B;
    assign F = XOR1 ^ C;
    assign AND1 = XOR1 & C;
    assign AND2 = A & B;
    assign G = AND1 | AND2;

    assign Times = A * B;
    assign Sums = XOR1 + AND1;

endmodule




