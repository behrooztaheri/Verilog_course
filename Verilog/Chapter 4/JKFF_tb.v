// gtkwave

`timescale 1ns / 1ps
`include "Flip_Flop_JK.v"

module TB2();

    reg  Clk, Rst, J, K;
    wire Q, Qp;

    Flip_Flop_JK JKFF(
        .Clk(Clk),
        .Rst(Rst),
        .J(J),
        .K(K),
        .Q(Q),
        .Qp(Qp)
    );

    initial 
        begin

          $dumpfile("TB2.vcd");
          $dumpvars(0, TB2);

          Clk = 0;
          J = 1;
          K = 0;
          Rst = 0;
          #100;

          Rst = 1;
          #60;

          J = 0;
          K = 0;
          #60;

          J = 1;
          K = 0;
          #60;

          J = 0;
          K = 1;
          #60;

          J = 1;
          K = 1;
          #60;

          Rst = 0;
          #60;
        end

    always #5 Clk = ~Clk;    

    
    

endmodule