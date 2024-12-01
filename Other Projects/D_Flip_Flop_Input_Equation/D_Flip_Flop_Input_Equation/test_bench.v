//gtkwave
`timescale 1ns/1ps
`include "D_Flip_Flop_Input_Equation.v"

module testbench();

    reg D, X, clk;
    wire Q, Q_prime, Y;

    DFF_Input_Equation_test (
        .X(X),
        .clk(clk),
        .Y(Y)
    );

    always #5 clk = ~clk;

    initial begin
        D = 0;
        X = 0;
        clk = 0;
        #10 D = 1; X = 1;
        #10 D = 0; X = 1;
        #10 D = 1; X = 0;
        #10 D = 0; X = 0;
    end

endmodule
