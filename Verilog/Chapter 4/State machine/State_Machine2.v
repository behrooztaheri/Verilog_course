module STM(
    input clk,
    input Rst,
    output reg Y
);

    reg [1:0] State;

    always @(posedge Clk or negedge Rst)
        begin
            if(~Rst)
                    State = 0;
            else
                begin
                    case(State)
                        0 :  State = 1;  
                        1 :  State = 2;  
                        2 :  State = 0;  
                    endcase
                end
        end

        always @(*)
            begin
                case(State)
                    0 :  y = 0;  
                    1 :  y = 0;  
                    2 :  y = 1;  
                endcase
            end

endmodule