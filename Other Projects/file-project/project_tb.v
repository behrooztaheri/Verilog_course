// gtkwave

`timescale 1ns / 1ps
`include "project.v"
module tb_main_module();

    reg clk;
    reg x1;
    reg x2;
    reg x3;
    reg x4;
    reg x5;
    reg x6;
    reg x7;
    wire IEN;

    main_module uut (
        .clk(clk),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .IEN(IEN)
    );

    initial 
    begin
         $dumpfile("tb_main_module.vcd");
         $dumpvars(0, tb_main_module); // اصلاح این خط
        clk = 0;
        x1 = 0; x2 = 0; x3 = 0; x4 = 0; x5 = 0; x6 = 0; x7 = 0;

        #20 x1 = 1; x2 = 1; x3 = 1; x4 = 1;
        #10 x5 = 1; x6 = 1; x7 = 1;
        #30 x1 = 0; x2 = 0; x3 = 0; x4 = 0; x5 = 0; x6 = 0; x7 = 0;
        #10 x1 = 1; x2 = 0; x3 = 1; x4 = 1; x5 = 1; x6 = 0; x7 = 1;
        #70 x1 = 0; x2 = 1; x3 = 1; x4 = 0; x5 = 1; x6 = 1; x7 = 0;
        #10 x1 = 1; x2 = 1; x3 = 1; x4 = 1; x5 = 0; x6 = 1; x7 = 1;
        #10; // افزودن یک توقف در انتها
    end

    always #5 clk = ~clk;

endmodule


