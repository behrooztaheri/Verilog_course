module Flip_Flop_T(
    input Clk,
    input Rst,
    input T,
    output reg Q,
    output Qp
);

    assign Qp=~Q;
 
    always @(posedge Clk or negedge Rst)
    begin 
	if (Rst==0)
	    Q=0;
	else 
	begin 
	    if (T==0)
		Q=Q;
	    else if (T==1)
		Q=~Q;
        end 
    end

endmodule