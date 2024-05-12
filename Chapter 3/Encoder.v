module Encoder1(
    input [3:0] X,
    input en,
    output reg [1:0] Y
);

    always @(*)
        begin
            case(X)
                4'b0001 : begin if(en) Y = 0; else Y = 2'bz; end
                4'b0010 : begin if(en) Y = 1; else Y = 2'bz; end
                4'b0100 : begin if(en) Y = 2; else Y = 2'bz; end
                4'b1000 : begin if(en) Y = 3; else Y = 2'bz; end
                default : begin Y = 4'bz; end
            endcase
        end

endmodule

module Encoder2(
    input [3:0] X,
    input en,
    output reg [1:0] Y
);

    always @(*)
        begin
            case({en, X})
                {1'b1, 4'b0001} : begin  Y = 0;  end
                {1'b1, 4'b0010} : begin  Y = 1;  end
                {1'b1, 4'b0100} : begin  Y = 2;  end
                {1'b1, 4'b1000} : begin  Y = 3;  end
                default : begin Y = 4'bz; end
            endcase
        end

endmodule

module Encoder3(
    input [3:0] X,
    input en,
    output reg [1:0] Y
);

    always @(*)
        begin

        if(en)
            begin
                case(X)
                    4'b0001 : begin  Y = 0;  end
                    4'b0010 : begin  Y = 1;  end
                    4'b0100 : begin  Y = 2;  end
                    4'b1000 : begin  Y = 3;  end
                    default : begin Y = 4'bz; end
                endcase              
            end
        else if(~en)
            begin
              Y = 2'bz;
            end

        end

endmodule