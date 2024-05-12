module Multiplexer(
    input [3:0] X,
    input [1:0] S,
    output Y
);

    assign Y = (S == 0)? X[0]: (S == 1)? X[1]:
                (S == 2)? X[2]: (S == 3)? X[3]: 0;

endmodule