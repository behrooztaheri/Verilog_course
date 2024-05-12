module Sum_4bit(
    input [3:0] A,
    input [3:0] B,
    output [4:0] C
);

    assign C = A + B;

endmodule