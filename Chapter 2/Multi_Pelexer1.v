module Multiplexer(
    input X1,
    input X2,
    input X3,
    input X4,
    input S1,
    input S2,
    output Y
);

    assign Y = (S1 == 0 && S2 == 0)? X1: (S1 == 0 && S2 == 1)? X2:
                (S1 == 1 && S2 == 0)? X3: (S1 == 1 && S2 == 1)? X4: 0;

endmodule