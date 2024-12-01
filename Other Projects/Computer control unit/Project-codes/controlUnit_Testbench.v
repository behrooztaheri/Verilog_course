/*
Producers: Mahdiyar Babaghassabha - Mehdi Hosseinpour - Mohadese Babashahverdi 
Project Name: Computer Control Unit (Test bench)
*/

`timescale 1ns/1ps
`include "controlUnit.v"

module Control_TestBench (
    );

    reg Reset;
    reg [15:0] AC;
    reg [15:0] DR;
    reg [11:0] B;
    reg I, S, R, E, IEN, FGI, FGO;
    reg [7:0] D;
    reg [15:0] T;

    wire LD_AR, CLR_AR, INR_AR;
    wire LD_PC, CLR_PC, INR_PC;
    wire LD_DR, CLR_DR, INR_DR;
    wire LD_AC, CLR_AC, INR_AC;
    wire LD_TR, CLR_TR, INR_TR;
    wire LD_IR, LD_OUTR;
    wire Set_S, Clear_S, Clear_E, Comp_E, Set_R, Clear_R, Set_IEN, Clear_IEN, Clear_FGI, Set_FGO;
    wire Read, Write;
    wire [2:0] S_BUS;
    wire [2:0] ALU_Task;
    wire CLR_SC, INR_SC;

    Control UUT (
        .Reset(Reset),
        .AC(AC), .DR(DR), .B(B),
        .I(I), .S(S), .R(R), .E(E), .IEN(IEN), .FGI(FGI), .FGO(FGO),
        .D(D), .T(T),
        .LD_AR(LD_AR), .CLR_AR(CLR_AR), .INR_AR(INR_AR),
        .LD_PC(LD_PC), .CLR_PC(CLR_PC), .INR_PC(INR_PC),
        .LD_DR(LD_DR), .CLR_DR(CLR_DR), .INR_DR(INR_DR),
        .LD_AC(LD_AC), .CLR_AC(CLR_AC), .INR_AC(INR_AC),
        .LD_TR(LD_TR), .CLR_TR(CLR_TR), .INR_TR(INR_TR),
        .LD_IR(LD_IR), .LD_OUTR(LD_OUTR),
        .Set_S(Set_S), .Clear_S(Clear_S),
        .Clear_E(Clear_E), .Comp_E(Comp_E),
        .Set_R(Set_R), .Clear_R(Clear_R),
        .Set_IEN(Set_IEN), .Clear_IEN(Clear_IEN),
        .Clear_FGI(Clear_FGI),
        .Set_FGO(Set_FGO),
        .Read(Read), .Write(Write),
        .S_BUS(S_BUS), .ALU_Task(ALU_Task),
        .CLR_SC(CLR_SC), .INR_SC(INR_SC)
    );

    initial
        begin
            $dumpfile("controlUnit_Testbench.VCD");
            $dumpvars(0, Control_TestBench);
        end

    initial 
        begin
            Reset = 1;
            #10;
            Reset = 0;
        end

    initial 
        begin
            AC = 16'h58CA;
            DR = 16'h7C4;
            B = 12'hABC;
            I = 1; S = 1; R = 0; E = 1; IEN = 1; FGI = 0; FGO = 1;
            D = 8'h7B;
            T = 16'h1234;

            repeat (20) //این بلاک یک حلقه تکرار است. یعنی دستورات درون بلاک، 20 بار تکرار می شوند
                begin 
                    #5;
                    T = T + 1;
                end

                #10;
                $finish;
        end

endmodule