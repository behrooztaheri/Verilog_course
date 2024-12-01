module Minest(
    input [3:0] X,
    input [3:0] Y,
    output [4:0] T
);

    assign T = X - Y;

endmodule

module MNST(
    input [3:0] X,
    input [3:0] Y,
    output H
);

    wire [4:0] T;

    Minest M(
        .X(X),
        .Y(Y),
        .T(T)
    );

    assign H = Y[0] | T[2];


endmodule