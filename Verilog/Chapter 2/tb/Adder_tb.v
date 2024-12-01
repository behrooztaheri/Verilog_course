// gtkwave

`timescale 1ns / 1ps
`include "Adder.v"

module TB();

    reg [3:0] X;
    reg [3:0] Y;
    wire [4:0] Z;

    Adder_ U (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial 
        begin

          $dumpfile("TB.vcd");
          $dumpvars(0, TB);

          X = 4'd8;
          Y = 4'd3;
          #50;

          X = 4'd4;
          Y = 4'd4;
          #20;

          X = 4'd3;
          Y = 4'd7;
          #69;

          X = 4'd2;
          Y = 4'd5;
          #20;
        end

endmodule