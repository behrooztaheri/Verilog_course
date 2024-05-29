 // gtkwave

`timescale 1ns / 1ps
`include "./project.v"


module Test_pr();

    reg S0 , S1 , S2 , S3 , Ai , Bi , Ai1 , Ai2 ;
    wire F;

    Logic_Shift LF(
        .s0(S0),
        .s1(S1),
        .s2(S2),
        .s3(S3),
        .Ai(Ai),
        .Bi(Bi),
        .Ai_1(Ai1),
        .Aii(Ai2),


        .F(F)
    );

    initial
    begin
      
      $dumpfile("TBB.vcd");
      $dumpvars(0 , Test_pr);

      
      // test case 01;
      S0 = 0;
      S1 = 0;
      S2 = 0;
      S3 = 0;
      Ai = 0;
      Bi = 0;
      Ai1 = 0;
      Ai2 = 0;
      #60;

      // test case 02;
      S0 = 1;
      S1 = 0;
      S2 = 1;
      S3 = 0;
      Ai = 1;
      Bi = 0;
      Ai1 = 1;
      Ai2 = 0;

      #60;

      // test case 03;
      S0 = 1;
      S1 = 0;
      S2 = 0;
      S3 = 1;
      Ai = 0;
      Bi = 1;
      Ai1 = 0;
      Ai2 = 1;

      #60;

      // test case 04;
      S0 = 1;
      S1 = 1;
      S2 = 1;
      S3 = 1;
      Ai = 1;
      Bi = 1;
      Ai1 = 1;
      Ai2 = 1;

      #60;

      $finish;
    end

    


endmodule