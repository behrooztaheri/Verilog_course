`timescale 1ns / 1ps
`include "BinaryAdder_4bit.v"

module BinaryAdder_4bit_tb ();

	reg [3:0] A;
	reg [3:0] B;
	reg C0;

	wire [3:0] S;
	wire C4;

	BinaryAdder_4bit dut (
		.A(A),
		.B(B),
		.C0(C0),
		.S(S),
		.C4(C4)
	);

	initial 
		begin
			A = 4'b0110;
			B = 4'b1100;
			C0 = 0;
			#10
			A = 4'b1110;
			B = 4'b1000;
			#10
			A = 4'b0111;
			B = 4'b1110;
			#10
			A = 4'b0010;
			B = 4'b1001;
			#10
			A = 4'b0000;
			B = 4'b0000;
			#10
			A = 4'b0010;
			B = 4'b0011;
			#10
			C0 = 1;
			#10
			A = 4'b1000;
			B = 4'b0111;
		end
endmodule
