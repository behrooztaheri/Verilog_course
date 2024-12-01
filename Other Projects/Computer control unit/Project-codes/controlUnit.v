/*
Producers: Mahdiyar Babaghassabha - Mehdi Hosseinpour - Mohadese Babashahverdi
Project Name: Computer Control Unit
*/

`timescale 1ns / 1ps

module Control (
	// Register Control Signal //
    output LD_AR,	 
    output CLR_AR,	 
    output INR_AR,	 

    output LD_PC,	 
    output CLR_PC,	 
    output INR_PC,	 

    output LD_DR,	 
    output CLR_DR,	 
    output INR_DR,	 

    output LD_AC,	 
    output CLR_AC,	 
    output INR_AC,	 

    output LD_TR,	 
    output CLR_TR,	 
    output INR_TR,	 

    output LD_IR,	 

    output LD_OUTR,	 
	// Register Control Signal //
	 
	 
	// Flag Control Signal //
	output  Set_S,	 
    output  Clear_S,	 
	 
    output  Clear_E,	 
    output  Comp_E,	 
	 
	output  Set_R,	 
    output  Clear_R,	 
	 
	output  Set_IEN,	 
    output  Clear_IEN,	 
	 
	// output  Set_FGI,	 
    output  Clear_FGI,	 
	 
	output  Set_FGO,	 
    output  Clear_FGO,	 
	// Flag Control Signal //
	 
	 
	// Memory & BUS & ALU Control Signal //
    output Read,	 
    output Write,	 
    
    output reg [2:0] S_BUS,	 
    
	output reg[2:0] ALU_Task ,
	// Memory & BUS & ALU Control Signal //


	// SC Control Signal //
	output  reg CLR_SC,	 
    output  reg INR_SC,	 
	// SC Control Signal //
	  
    input Reset,
	 
	input [15:0] AC,
	input [15:0] DR,
	input [11:0] B,
	 
	input I,
	input S,
	input R,
	input E,
	input IEN,
	input FGI,
	input FGO,
	 
	input [7:0] D, 
	input [15:0] T
    );


// Register Control Signal //
assign LD_AR=(~R&T[0])|(~R&T[2])|(~D[7]&I&T[3]);	 
assign CLR_AR=R&T[0]|Reset;
assign INR_AR=D[5]&T[4]; 

assign LD_PC=(D[4]&T[4])|(D[5]&T[5]);
assign CLR_PC=R&T[1]|Reset;
assign INR_PC=(D[7]&I&T[3]&B[8]&FGO)|(D[7]&I&T[3]&B[9]&FGI)|(D[7]&(~I)&T[3]&B[4]&(~AC[15]))|(D[7]&(~I)&T[3]&B[3]&AC[15])|(D[7]&(~I)&T[3]&B[2]&ZAC)|(D[7]&(~I)&T[3]&B[1]&(~E))|(D[6]&T[6]&ZDR)|(~R&T[1])|(R&T[2]);
assign ZAC=~AC[0]&~AC[1]&~AC[2]&~AC[3]&~AC[4]&~AC[5]&~AC[6]&~AC[7]&~AC[8]&~AC[9]&~AC[10]&~AC[11]&~AC[12]&~AC[13]&~AC[14]&~AC[15];
assign ZDR=~DR[0]&~DR[1]&~DR[2]&~DR[3]&~DR[4]&~DR[5]&~DR[6]&~DR[7]&~DR[8]&~DR[9]&~DR[10]&~DR[11]&~DR[12]&~DR[13]&~DR[14]&~DR[15];

assign LD_DR=(D[6]&T[4])|(D[0]&T[4])|(D[1]&T[4])|(D[2]&T[4]);
assign CLR_DR=Reset;
assign INR_DR=D[6]&T[5];

assign LD_AC=(D[7]&I&T[3]&B[11])|(D[7]&(~I)&T[3]&B[9])|(D[7]&(~I)&T[3]&B[7])|(D[7]&(~I)&T[3]&B[6])|(D[0]&T[5])|(D[1]&T[5])|(D[2]&T[5]);
assign CLR_AC=(D[7]&(~I)&T[3]&B[11])|(Reset);
assign INR_AC=D[7]&(~I)&T[3]&B[5];

assign LD_TR=R&T[0];
assign CLR_TR=Reset;
assign INR_TR=0;

assign LD_IR=~R&T[1];

assign LD_OUTR=(D[7]&I&T[3]&B[10])&FGO;
// Register Control Signal // 



// Flag Control Signal // 
assign Clear_S=(D[7]&~I&T[3]&B[0])&(~Reset);
assign Set_S=Reset;

assign Clear_E=(D[7]&~I&T[3]&B[10])|(Reset);
assign Comp_E=(D[7]&~I&T[3]&B[8])&(~Reset);

assign Clear_R=(Reset)|(R&T[2]);
assign Set_R=(((~T[0])&(~T[1])&(~T[2])&IEN)&(FGI | FGO))&(~Reset);

assign Clear_IEN=((R&T[2])||(D[7]&I&T[3]&B[6]))|(Reset);
assign Set_IEN=(D[7]&I&T[3]&B[7])&(~Reset);

assign Clear_FGI=(D[7]&I&T[3]&B[11])|Reset;
//assign Set_FGI=;
assign Clear_FGO=D[7]&I&T[3]&B[10];
assign Set_FGO=(Reset);
// Flag Control Signal //



// Memory & BUS & ALU Control Signal //
assign Read=(~R&T[1])+(~D[7]&I&T[3])+((D[0]|D[1]|D[2]|D[6])&T[4]);
assign Write=(D[5]&T[4])|(D[6]&T[6])|(D[3]&T[4])|(R&T[1]);

wire [6:0] X;
assign X[0]=(D[4]&T[4])|(D[5]&T[5]);
assign X[1]=(D[5]&T[4])|(~R&T[0])|(R&T[0]);
assign X[2]=D[6]&T[6];
assign X[3]=(D[7]&I&T[3]&B[10])|(D[3]&T[4]);
assign X[4]=~R&T[2];
assign X[5]=R&T[1];
assign X[6]=(~R&T[1])+(~D[7]&I&T[3])+((D[0]|D[1]|D[2]|D[6])&T[4]);

always@(*)
	begin
		case(X)
		7'b0000000 : S_BUS=0;
		7'b0000001 : S_BUS=1;
		7'b0000010 : S_BUS=2;
		7'b0000100 : S_BUS=3;
		7'b0001000 : S_BUS=4;
		7'b0010000 : S_BUS=5;
		7'b0100000 : S_BUS=6;
		7'b1000000 : S_BUS=7;
		endcase
	end


always @(*)
	begin
		if (D[0]&T[5])
			ALU_Task=1;
		else if (D[1]&T[5])
			ALU_Task=2;
		else if (D[2]&T[5])
			ALU_Task=3;
		else if (D[7]&(~I)&T[3]&B[9])
			ALU_Task=4;
		else if (D[7]&(~I)&T[3]&B[7])
			ALU_Task=5;
		else if (D[7]&(~I)&T[3]&B[6])
			ALU_Task=6;
		else if (D[7]&I&T[3]&B[11])
			ALU_Task=7;
		else 
			ALU_Task=0; 
	end
// Memory & BUS & ALU Control Signal //



// SC Control Signal //
always @(*)
begin
	if (Reset || ~S)
		begin
			CLR_SC=1;	
			INR_SC=0;	
		end
	else if ((R&T[2]) || (D[0]&T[5]) || (D[1]&T[5]) || (D[2]&T[5]) || (D[3]&T[4]) || (D[4]&T[4]) || (D[5]&T[5]) || (D[6]&T[6]) || (D[7]&T[3])) //inja when : SC=0 mishavad;
		begin
			INR_SC=0;
			CLR_SC=1;
		end
	else
		begin
			INR_SC=1;
			CLR_SC=0;
		end
end
// SC Control Signal //

endmodule