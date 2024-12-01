module HalfAdder(

input X,Y,
output N,G

);

assign N = X ^ Y;
assign G = X & Y;

endmodule

module Adder_4bit(

input [3:0] A,
//input [3:0] B,
output [4:0] S

);

wire [4:0] C;
assign C[0] = 1'b0;

HalfAdder HA1(

.X(A[0]),
.Y(1),
.N(S[0]),
.G(C[0]),

);

HalfAdder HA2(

.X(A[1]),
.Y(C[0]),
.N(S[1]),
.G(C[1]),

);

HalfAdder HA3(

.X(A[2]),
.Y(C[1]),
.N(S[2]),
.G(C[2]),

);

HalfAdder HA4(

.X(A[3]),
.Y(C[2]),
.N(S[3]),
.G(C[3]),

);

endmodule