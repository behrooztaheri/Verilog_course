// gtkwave

`include "Test.v"

module xor_tb();

    reg a, b;
    wire Out;

    xor_gate G1(a, b, Out);

    initial begin

        $dumpfile("xor_tb.vcd");
        $dumpvars(0, xor_tb);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
      
    end

endmodule