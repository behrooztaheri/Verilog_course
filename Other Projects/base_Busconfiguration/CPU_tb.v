//gtkwave
`timescale 1ns/1ps
`include "CPU.v"

module CPU_tb;

    reg clk;
    reg reset;
    reg [11:0] IR_address;
    reg [2:0] opcode;
    reg I;

    CPU u (
        .clk(clk),
        .reset(reset),
        .IR_address(IR_address),
        .opcode(opcode),
        .I(I)
    );

    always #5 clk = ~clk;

    initial begin

    $dumpfile("CPU_tb.vcd");
    $dumpvars(0,CPU_tb);
    end
    
    initial begin
        clk = 0;
        reset = 1;
        IR_address = 12'b0;
        opcode = 3'b0;
        I = 0;

        #10 reset = 0;

        IR_address = 12'b000000000001;
        opcode = 3'b000; 
        I = 1'b0;
        #20;

        IR_address = 12'b011010001010;
        opcode = 3'b001; 
        I = 1'b1;
        #20;

        IR_address = 12'b110010000011;
        opcode = 3'b010; 
        I = 1'b0;
        #20;

        IR_address = 12'b100111000100;
        opcode = 3'b011; 
        I = 1'b1;
        #20;

        IR_address = 12'b000000000101;
        opcode = 3'b100; 
        I = 1'b1;
        #20;

        IR_address = 12'b001011000101;
        opcode = 3'b101; 
        I = 1'b0;
        #20;

        IR_address = 12'b010111000101;
        opcode = 3'b110; 
        I = 1'b1;
        #20;

        IR_address = 12'b101011000101;
        opcode = 3'b111; 
        I = 1'b1;
        #20;

        $finish;
    end

endmodule
