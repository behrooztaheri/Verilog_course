module Gate_3(
    input A,
    output S,
    output C
);

    wire n = 1'b1;
    wire m = 1'b0;

    assign S = A ^ n;
    assign C = A & m;

endmodule