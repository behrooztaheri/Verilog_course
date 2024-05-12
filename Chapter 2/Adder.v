module Adder(
    input [3:0] X,
    input [3:0] Y,
    output [4:0] F
);

    assign F = X + Y; 

endmodule


module NewAdder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [3:0] E,
    input [3:0] F,

    output [4:0] G,
    output [4:0] H,
    output [4:0] K
);

    Adder U1(
        .X(A),
        .Y(B),
        .F(G)
    );

    Adder U2(
        .X(C),
        .Y(D),
        .F(H)
    );

    Adder U3(
        .X(E),
        .Y(F),
        .F(K)
    );

endmodule