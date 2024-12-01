module ac(d,clk,load,inr,clr,q);
input [15:0] d;
input clk,load,inr,clr;
output reg [15:0] q;

always@(posedge clk,d)
begin
if (clr) q = 16'b0;
else if (inr) q = q + 1'b1;
else if (load) q = d;
end


endmodule
