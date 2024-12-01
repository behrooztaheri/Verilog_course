//gtkwave
`timescale 1ns / 1ps
`include "proje.v"



module tb();

reg [2:0] a;
reg [3:0] b;

wire [6:0] c;    //output


zarb uu(
.a(a),
.b(b),
.c(c)
);

initial
begin
$dumpfile("tb.vcd");
$dumpvars(0,tb);
a=5;
b=3;
#100
a=8;
b=4;
end

endmodule