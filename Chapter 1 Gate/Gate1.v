module Gate_1
(
    input A, 
    input B, 
    input C, 
    output F, 
    output G
);

    xor(XOR1,A,B);
    xor(F,XOR1,C);
    and(AND1,XOR1,C);
    and(AND2,A,B);
    or(G,AND1,AND2);

endmodule