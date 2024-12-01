module Decoder(
    input en,
    input [1:0] X,
    output reg [3:0] Y
);

    always @(*)
        begin
            if(en == 0)
                begin
                    Y = 4'b0000;
                end
            else if(X==0)
                begin
                    Y = 4'b0001;
                end
            else if(X==1)
                begin
                    Y = 4'b0010;
                end
            else if(X==2)
                begin
                    Y = 4'b0100;
                end
            else if(X==3)
                begin
                    Y = 4'b1000;
                end
            else
                begin
                  Y = 4'bzzzz;
                end

        end

endmodule