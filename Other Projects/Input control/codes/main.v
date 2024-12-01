module main(d0,d1,d2,p,r,t5,b11,b4,b7,b6,b5,d_ac,clk,q_ac);
input d0,d1,d2,p,r,t5,b11,b4,b7,b6,b5;
input [15:0] d_ac;
input clk;
output [15:0] q_ac;

and(q_and,d0,t5);
and(q_add,d1,t5);
and(q_dr,d2,t5);
and(q_inpr,p,b11);
and(q_com,r,b4);
and(q_shr,r,b7);
and(q_shl,r,b6);
and(inc,r,b5);
and(clr,r,b11);

or(ld,q_and,q_add,q_dr,q_inpr,q_com,q_shr,q_shl);

ac u1(d_ac,clk,ld,inc,clr,q_ac);


endmodule
