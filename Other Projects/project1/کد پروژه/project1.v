/***********  FILIP_FIOP_JK  ***********/

module jk_ff (
    input j,
    input k,
    input clk,
    input clr,
    output reg q
);


always @(posedge clk or negedge clr) 
  begin
    if (clr==0)
       q = 0;
    else 
      begin
      if (j==0 && k==0)
        q = q;
    else 
      if(j==0 && k==1)
        q = 0;
    else
      if(j==1 && k==0)  
        q = 1;
    else
      if(j==1 && k==1)
        q = ~q;
      end
  end
endmodule


/*  4BIT BINARY COUNTER WITH PARAIIEI IOADING & SIMULTANEOUS ERASING   */



module binary_counter (
    input [3:0] I,     
    input ld,           
    input clr,          
    input clk,          
    input count,  
    output carry,       
    output [3:0] A  
);


  wire j0, k0, j1, k1, j2, k2, j3, k3,carry;


    /*******************************  GATES  *********************************/

  assign j0 = (~clr & ld &count) | ((~clr & ld) & I[0]);
  assign k0 = clr | (~clr & ~ld & count) | ((~clr & ld) & ~I[0]);
  assign j1 = (A[0] & (~clr & ~ld & count)) | ((~clr & ld) & I[1]);
  assign k1 = clr | (A[0] & (~clr & ~ld & count)) | ((~clr & ld) & ~I[1]);
  assign j2 = (A[1] & ( A[0] & (~clr & ~ld & count)) | ((~clr & ld) & I[2]));
  assign k2 = clr | (A[1] & ( A[0] & (~clr & ~ld & count)) | ((~clr & ld) & ~I[2]));
  assign j3 = (A[2] & (A[1] & ( A[0] & (~clr & ~ld & count)))) | ((~clr & ld) & I[3]);
  assign k3 = clr | (A[2] & (A[1] & ( A[0] & (~clr & ~ld & count)))) | ((~clr & ld) & ~I[3]);
  assign carry = A[3] & (A[2] & (A[1] & ( A[0] & (~clr & ~ld & count))));




    /******************  CALL THE MODUIE FLIP_FLOP_JK  ********************/

    jk_ff ff0 (
      .j(j0), 
      .k(k0),
      .clk(clk),
      .q(A[0])
    );


    jk_ff ff1 (
      .j(j1),
      .k(k1), 
      .clk(clk), 
      .q(A[1])
    );


    jk_ff ff2 (
      .j(j2), 
      .k(k2), 
      .clk(clk), 
      .q(A[2])
    );


    jk_ff ff3 (
      .j(j3), 
      .k(k3), 
      .clk(clk), 
      .q(A[3])
    );


endmodule