module FullAdder_1bit (
    input X,
    input Y,
    input Cin,
    output S,
    output Cout
    );

    wire W1, W2, W3;
    
    xor G1 (W1, X, Y);
    xor G2 (S, W1, Cin);
    and G3 (W2, W1, Cin);
    and G4 (W3, X, Y);
    or  G5 (Cout, W2, W3);

endmodule

module BinaryAdder_4bit (
    input [3:0] A,
    input [3:0] B,
    input C0,
    output [3:0] S,
    output C4
    );
    
    wire C1, C2, C3;
    
    FullAdder_1bit U1 (
    .X(A[0]),
    .Y(B[0]),
    .Cin(C0),
    .S(S[0]),
    .Cout(C1)
    );
    
    FullAdder_1bit U2 (
    .X(A[1]),
    .Y(B[1]),
    .Cin(C1),
    .S(S[1]),
    .Cout(C2)
    );
    
    FullAdder_1bit U3 (
    .X(A[2]),
    .Y(B[2]),
    .Cin(C2),
    .S(S[2]),
    .Cout(C3)
    );
    
    FullAdder_1bit U4 (
    .X(A[3]),
    .Y(B[3]),
    .Cin(C3),
    .S(S[3]),
    .Cout(C4)
    );
    
endmodule