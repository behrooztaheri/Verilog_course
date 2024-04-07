module JK_Flip_Flop(
    input J,
    input K,
    input Clk,
    output Q,
    output Q_prime
);

    wire R, S;

    assign R = ~(J & Clk & Q_prime);
    assign S = ~(K & Clk & Q);

    assign Q = ~(R & Q_prime);
    assign Q_prime = ~(S & Q);

endmodule