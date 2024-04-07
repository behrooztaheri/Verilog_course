module Full_Adder(
    input X,
    input Y,
    input W, 
    output [1:0] SUM
);

    assign SUM = X + Y + W;

endmodule