module STM(
    input clk,
    input Rst,
    output reg Y
);

    reg [1:0] State;

    always @(posedge Clk or negedge Rst)
        begin
            if(~Rst)
                begin
                    State = 0;
                    y = 0;  
                end
            else
                begin
                    case(State)
                        0 : begin State = 1; y = 0; end
                        1 : begin State = 2; y = 1; end
                        2 : begin State = 0; y = 0; end
                    endcase
                end
        end

endmodule