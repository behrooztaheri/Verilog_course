module decoder3to8(
    input B,
    input C,
    input D,
    output reg [7:0] out
);
    always @(*)
    begin
        case({D,C,B})
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000;
        endcase
    end
endmodule

module decoder4to16(
    input E,
    input F,
    input G,
    input H,
    output reg [15:0] T
);
    always @(*)
    begin
        case ({E,F,G,H})
            4'b0000: T = 16'b0000000000000001;
            // ...
            default: T = 16'b0000000000000000;
        endcase
    end
endmodule

module sc(
    input inr ,
    input rst ,
    input clk ,
    output reg [3:0] count,
    output i,
    output j,
    output k,
    output l
);
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            count <=4'b0000;
        else if(inr)
            count <=count + 1;
    end
    assign i=count[0];
    assign j=count[1];
    assign k=count[2];
    assign l=count[3];
endmodule

module control_unit_gates(
    input [7:0] D,
    input [15:0] T,
    input A,
    input [3:0] E,
    output Y
);
    wire [7:0] out_3to8;
    wire [15:0] out_4to16;

    decoder3to8 u1(
        .B(D[2]),
        .C(D[1]),
        .D(D[0]),
        .out(out_3to8)
    );

    decoder4to16 u2(
        .E(E[3]),
        .F(E[2]),
        .G(E[1]),
        .H(E[0]),
        .T(out_4to16)
    );

endmodule

module control_unit (
    input A,
    input B,
    input C,
    input [7:0]D,
    input [3:0] E,
    input clk,
    input rst,
    input inr,
    output Y
);
    wire [7:0] D;
    wire [15:0] T;

    sc u3(
        .inr(inr),
        .rst(rst),
        .clk(clk),
        .count(),
        .i(),
        .j(),
        .k(),
        .l()
    );

    control_unit_gates u4(
        .D(D),
        .T(T),
        .A(A),
        .E(E),
        .Y(Y)
    );

endmodule