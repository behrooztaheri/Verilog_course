module STM(
    input clk,
    input Rst,
    input X,
    output reg Y
);

    reg [1:0] State;
    reg [1:0] New_state;

    always @(posedge Clk or negedge Rst)
        begin
            if(~Rst)
                State = 0;
            else
                State = New_state;
        end

        always @(*)
            begin
                case(State)
                    0 : begin y = 0; if(~X) New_state = 0; else New_state = 1; end 
                    1 : begin y = 0; if(~X) New_state = 0; else New_state = 2; end 
                    2 : begin y = 1; if(~X) New_state = 1; else New_state = 0; end 
                endcase
            end

endmodule