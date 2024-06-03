// gtkwave

`timescale 1ns / 1ps
`include "mypro.v"
module TB();

    reg s;
    reg [3:0]IR;
    reg [3:0]IL; 
    reg [3:0] A0;
    reg [3:0] A1;
    reg [3:0] A2;
    reg [3:0] A3;

    wire [3:0] H0;
    wire [3:0] H1;
    wire [3:0] H2;
    wire [3:0] H3;

    main_module MN(
        .s(s),
        .IR(IR),
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .IL(IL),
        .H0(H0),
        .H1(H1),
        .H2(H2),
        .H3(H3)
    );

    initial 
        begin

          $dumpfile("TB.vcd");
          $dumpvars(0, TB);

          s = 0;
          IR = 4'b0000;
          IL = 4'b0001;
          A0 = 4'b0000;
          A1 = 4'b0001;
          A2 = 4'b0010;
          A3 = 4'b0100;
          #100;

          A0 = 4'b1000;
          A1 = 4'b0100;
          A2 = 4'b0010;
          A3 = 4'b0001;
          #50;
          s = 1;
          IR = 4'b0001;
          IL = 4'b0000;
          A0 = 4'b0100;
          A1 = 4'b1001;
          A2 = 4'b0110;
          A3 = 4'b0101;
          #50;

        end
    

endmodule