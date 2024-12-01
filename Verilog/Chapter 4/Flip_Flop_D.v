module Flip_Flop_D(
    input Clk,
    input Rst,
    input D,

    output reg Q,
    output Qp
);

    assign Qp = ~Q;

    always @(posedge Clk or negedge Rst)
        begin
            if(Rst == 0)
                Q = 0;
            else
                Q = D;
        end

endmodule