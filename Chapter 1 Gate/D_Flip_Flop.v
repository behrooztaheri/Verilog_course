module D_Flip_Flop(
    input D,
    input Clk,
    output Q,
    output Q_prime
);

    assign Q = ~(~(D & Clk) & Q_prime);
    assign Q_prime = ~(~(~D & Clk) & Q);

endmodule