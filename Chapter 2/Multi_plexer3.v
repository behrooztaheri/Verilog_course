module Multiplexer(
    input [7:0] X1,
    input [7:0] X2,
    input [7:0] X3,
    input [7:0] X4,
    input [1:0] S,
    output [7:0] Y
);

    assign Y = (S == 0)? X1: (S == 1)? X2:
                (S == 2)? X3: (S == 3)? X4: 0;

endmodule