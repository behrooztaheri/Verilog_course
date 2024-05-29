`include "Flip_Flop_T.v"

module Counter4(
    input Clk,
    input Rst,
    output [3:0] F
    ); 
	
wire [3:0] Qp;
wire w1,w2;

and(w1,F[0],F[1]);
and(w2,w1,F[2]);
	
Flip_Flop_T U0(.Clk(Clk),.Rst(Rst),.T(1'b1),.Q(F[0]),.Qp(Qp[0]));
Flip_Flop_T U1(.Clk(Clk),.Rst(Rst),.T(F[0]),.Q(F[1]),.Qp(Qp[1]));
Flip_Flop_T U2(.Clk(Clk),.Rst(Rst),.T(w1),.Q(F[2]),.Qp(Qp[2]));
Flip_Flop_T U3(.Clk(Clk),.Rst(Rst),.T(w2),.Q(F[3]),.Qp(Qp[3]));
	
endmodule