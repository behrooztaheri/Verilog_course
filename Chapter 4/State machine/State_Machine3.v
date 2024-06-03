module STM(
    input clk,
    input Rst,
    output reg Y
);

    reg [1:0] State;
    reg [1:0] New_state;

    parameter IDLE = 2'b00;
    parameter Pre = 2'b01;
    parameter Final = 2'b10;

    always @(posedge Clk, negedge Rst)
        begin
            if(~Rst)
                State = IDLE;
            else
                State = New_state;
        end

    always @(*)
        begin
            case(State)
                IDLE : begin y = 0; New_state = Pre; end
                Pre : begin y = 0; New_state = Final; end
                Final : begin y = 1; New_state = IDLE; end
            endcase
        end

endmodule