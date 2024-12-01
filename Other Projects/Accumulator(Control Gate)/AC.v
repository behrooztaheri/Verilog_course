`timescale 1ns/1ps

module AC (
    input [15:0] IN,
    input CLK,
    input D0, D1, D2, T5, p, r, B5, B6, B7, B9, B11,
    output reg [15:0] OUT
);

    reg AND, ADD, DR, INPR, COM, SHR, SHL, CLR, INC, LD;

    always @(*) begin
        AND = D0 & T5;
        ADD = D1 & T5;
        DR = D2 & T5;
        INPR = p & B11;
        COM = r & B9;
        SHR = r & B7;
        SHL = r & B6;
        
        LD = (AND | ADD | DR | INPR | COM | SHR | SHL);
        INC = r & B5;
        CLR = r & B11;

        if (LD) begin
            OUT = IN;
        end
        else if (INC) begin
            OUT = OUT + 1;
        end
        else if (CLR) begin
            OUT = 16'bZ;
        end
    end

    initial begin
        $dumpfile("TB.vcd");
        $dumpvars(0, AC);
    
        // LD(ADD) ==>
        D1 = 1;
        T5 = 1;
        // first 100 ns
        #100;

        // INC ==>
        r = 1;
        B5 = 1;
        // secound 200 ns
        #200;
        
        // CLR ==>
        r = 1;
        B11 = 1;
        // third 300 ns
        #300;
    end

endmodule