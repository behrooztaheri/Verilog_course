module main_tb;

	reg d0,d1,d2,p,r,t5,b11,b4,b7,b6,b5;
	reg [15:0] d_ac;
	reg clk;
	wire [15:0] q_ac;

	main uut (.d0(d0), .d1(d1), .d2(d2), .p(p), .r(r), .t5(t5), .b11(b11), .b4(b4), 
		.b7(b7), .b6(b6), .b5(b5), .d_ac(d_ac), .clk(clk), .q_ac(q_ac));

	always #10 clk = ~clk;
	
	initial begin
		d0 = 0;
		d1 = 1;
		d2 = 0;
		p = 0;
		r = 0;
		t5 = 1;
		b11 = 0;
		b4 = 0;
		b7 = 0;
		b6 = 0;
		b5 = 0;
		d_ac = 16'b1100110011100001;
		clk = 0;

		#20;
		d1 = 1'b0;
		t5 = 1'b0;
      r = 1'b1;
		b11 = 1'b1;
		
		#40;
		r = 1'b0;
		b11 = 1'b0;
		d2 = 1'b1;
		t5 = 1'b1;
		d_ac = 16'b0001110111111111;
		
		#20;
		d2 = 1'b0;
		t5 = 1'b0;
		r = 1'b1;
		b5 = 1'b1;
		
		#40;
		b11 = 1'b1;
		b5 = 1'b0;
		
	end
      
endmodule

