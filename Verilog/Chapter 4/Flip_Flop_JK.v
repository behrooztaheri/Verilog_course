module Flip_Flop_JK(
    input Clk,
    input Rst,
    input J,
    input K,

    output reg Q,
    output Qp
);

    assign Qp = ~Q;

    always @(posedge Clk or negedge Rst)
        begin
            if(Rst == 0)
                Q = 0;
            else
                begin
                    if (J == 0 && K == 0)
                        Q = Q;
                    else if (J == 0 && K == 1)
                        Q = 0;
                    else if (J == 1 && K == 0)
                        Q = 1;
                    else if (J == 1 && K == 1)
                        Q = ~Q;

                end
        end

endmodule