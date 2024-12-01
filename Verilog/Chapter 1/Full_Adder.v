module Full_Adder(
    input X,
    input Y,
    input W,
    output S,
    output C
);

    assign S = (X ^ Y) ^ W;
    assign C = ((X ^ Y) & W) | (X & Y);

endmodule