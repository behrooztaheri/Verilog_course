`timescale 1ns/1ps
`include "project1.v"


module TB();
reg [3:0]I;
reg ld;
reg clr;
reg clk;
reg count;
wire carry;
wire [3:0] A;


/****************************************************/


binary_counter u(
    .I(I),
    .ld(ld),
    .clr(clr),
    .clk(clk),
    .count(count),
    .carry(carry),
    .A(A)
);


/*****************************************************/


initial 
begin
  $dumpfile("TB.vcd");
  $dumpvars(0,TB);

  clk=1; I=4'b010; clr=0; ld=0; count=0; #100;
  clk=1; clr=0; ld=0; count=1; #200;
  I=4'b1111; ld=1; clk=1;  clr=0; #80;
  clk=1;  clr=1; #70;
end

always #5 clk=~clk;
endmodule