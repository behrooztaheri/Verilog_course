


module TestBench;

	reg [3:0] A;
	reg iR;
	reg iL;
	reg S;

	wire [3:0] Result;

	Shift Tb (A,iR,iL,S,Result);

	initial 
	begin
		A = 4'b1011; iR = 0; iL = 0;
		S = 0; #50;
		S = 1; #50;
		A = 4'b1001; iR = 1; iL = 0;
		S = 0; #50;
		S = 1; #50;
		A = 4'b0011; iR = 0; iL = 1;
		S = 0; #50;
		S = 1; #50;
		A = 4'b1000; iR = 1; iL = 1;
		S = 0; #50;
		S = 1; #50;
	end
      
endmodule

