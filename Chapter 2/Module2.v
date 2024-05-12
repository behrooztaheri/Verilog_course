module Full_Adder(
    input X,
    input Y,
    input K,
    output N,
    output G
);

    assign N = (X ^ Y) ^ (K);
    assign G = ((X ^ Y) & K) | (X & Y);

endmodule

module Adder_4bit1(
    input [3:0] A,
    input [3:0] B,
    output [4:0] F
);

    wire [3:0] C;
    assign C[0] = 1'b0;

    Full_Adder FA1(
        .X(A[0]),
        .Y(B[0]),
        .K(C[0]),
        .N(F[0]),
        .G(C[1])
    );

    Full_Adder FA2(
        .X(A[1]),
        .Y(B[1]),
        .K(C[1]),
        .N(F[1]),
        .G(C[2])
    );

    Full_Adder FA3(
        .X(A[2]),
        .Y(B[2]),
        .K(C[2]),
        .N(F[2]),
        .G(C[3])
    );

    Full_Adder FA4(
        .X(A[3]),
        .Y(B[3]),
        .K(C[3]),
        .N(F[3]),
        .G(F[4])
    );


endmodule

module Adder_4bit2(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] F,
    output Carry
);

    wire [3:0] C;

    Full_Adder FA1(
        .X(A[0]),
        .Y(B[0]),
        .K(Cin),
        .N(F[0]),
        .G(C[1])
    );

    Full_Adder FA2(
        .X(A[1]),
        .Y(B[1]),
        .K(C[1]),
        .N(F[1]),
        .G(C[2])
    );

    Full_Adder FA3(
        .X(A[2]),
        .Y(B[2]),
        .K(C[2]),
        .N(F[2]),
        .G(C[3])
    );

    Full_Adder FA4(
        .X(A[3]),
        .Y(B[3]),
        .K(C[3]),
        .N(F[3]),
        .G(F[4])
    );


endmodule