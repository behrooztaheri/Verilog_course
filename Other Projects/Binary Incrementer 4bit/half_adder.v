module half_adder (
    input  x,
    input  y,
    output S,
    output c
   );
   
    assign S = x ^ y; // XOR for Sum
    assign C = x & y; // AND for Carry

endmodule
