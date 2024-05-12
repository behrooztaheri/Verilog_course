module ALU(
    input [7:0] A,
    input [7:0] B,
    input [1:0] OpCode,

    output reg [15:0] Result,
    output Zflag
);

    assign Zflag = (Result == 0)? 1 : 0;

    always @(*)
        begin
            case(OpCode)
                2'b00 : begin Result = A + B; end
                2'b01 : begin Result = A - B; end
                2'b10 : begin Result = A * B; end
                2'b11 : begin Result = A << 1; end
                default : begin Result = 16'bz; end
            endcase
        end

endmodule