module Multi_8_bit(
    input [7:0]  A,
    input [7:0]  B,
    output [15:0] C
);  
	
    assign C = A * B;

endmodule