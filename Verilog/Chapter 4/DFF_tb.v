// gtkwave

`timescale 1ns / 1ps
`include "Flip_Flop_D.v"

module TB();

    reg Clk, Rst, D;
    wire Q, Qp;

    Flip_Flop_D DFF(
        .Clk(Clk),
        .Rst(Rst),
        .D(D),
        .Q(Q),
        .Qp(Qp)
    );

    initial 
        begin

          $dumpfile("TB.vcd");
          $dumpvars(0, TB);

          Clk = 0;
          D = 1;
          Rst = 0;
          #100;

          Rst = 1;
          #60;

          D = 0;
          #60;

          D = 1;
          #60;

          Rst = 0;
          #60;

        end
    
    always #5 Clk = ~Clk;

endmodule