`timescale 1ps/1ps
`include "project.v"
//gtkware
module control_unit_tb(
        reg A,
        reg B, 
        reg C, 
        reg D,
        reg [3:0]E,
        reg clk,
        reg rst,
        reg inr,
        wire Y); 
control_unit u1 (
  .A(A),
  .B(B),
  .C(C),
  .D(D),
  .E(E),
  .clk(clk),
  .rst(rst),
  .inr(inr),
  .Y(Y)
);

initial begin
  $dumpfile("control_unit.vcd");
  $dumpvars(0, control_unit_tb);
 
  // Test case 1
  A = 1'b0;
  B = 1'b1;
  C = 1'b0;
  D = 1'b1;
  E = 4'b1010;
  clk = 1'b0;
  rst = 1'b1;
  inr = 1'b0;
 
  #10 rst = 1'b0;
  #20 inr = 1'b1;
  #100 inr = 1'b0;
 
  // Test case 2
  #150;
 
  A = 1'b1;
  B = 1'b0;
  C = 1'b1;
  D = 1'b0;
  E = 4'b0110;
 
  rst = 1'b1;
  inr = 1'b0;
 
  #10 rst = 1'b0;
  #30 inr = 1'b1;
 
end

always #5 clk <= ~clk;

endmodule