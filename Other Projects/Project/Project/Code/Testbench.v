
`timescale 1ns / 1ps
`include "Project.v"


module testbench();
    reg [3:0] A, B;
    reg Cin;
    reg [1:0] S;
    wire [3:0] D;
    wire Cout;

    circuit ALU (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .D(D),
        .Cout(Cout)
    );

    initial 
        begin

            $dumpfile("testbench.vcd");
            $dumpvars(0, testbench);

            A = 4'd0;
            B = 4'd0;
            Cin = 1'd0;
            S = 2'd0;
            #60;

            A = 4'd1; 
            B = 4'd2; 
            Cin = 1'd0; 
            S = 2'd0;
            #60;

            A = 4'd5; 
            B = 4'd10; 
            Cin = 1'd1; 
            S = 2'd1;
            #60;

            A = 4'd15; 
            B = 4'd0; 
            Cin = 1'd0; 
            S = 2'd2;
            #60;

            $finish; 
        end

endmodule
