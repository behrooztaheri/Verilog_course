
module Shift(
    input [3:0] A,
    input iR,
    input iL,
    input S,
    output [3:0] Result
    );

	Multiplexer2_1 M1 (iR,A[1],S,Result[0]);
	
	Multiplexer2_1 M2 (A[0],A[2],S,Result[1]);
	
	Multiplexer2_1 M3 (A[1],A[3],S,Result[2]);
	
	Multiplexer2_1 M4 (A[2],iL,S,Result[3]);

endmodule



module Multiplexer2_1(
    input Data0,
    input Data1,
    input S,
    output Result
    );
	
	wire nS,P1,P2;
	
	not (nS,S);
	and (P1,Data0,nS);
	and (P2,Data1, S);
	or (Result,P1,P2);
	
endmodule

