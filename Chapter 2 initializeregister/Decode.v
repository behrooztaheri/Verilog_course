module Decoder(
    input en,
    input [1:0] X,
    output [3:0]Y
);

    assign Y = (en == 0)? 4'b0000:
                (X == 2'b00)? 4'b0001:
                (X == 2'b01)? 4'b0010:
                (X == 2'b10)? 4'b0100:
                (X == 2'b11)? 4'b1000:
                0;

endmodule