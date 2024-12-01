module Computer(
    input [7:0] A,
    input [11:0] Adr,
    input [1:0] Op,
    input Rd,
    input Wr,

    output [15:0] F,
    output Z
);

    wire [7:0] B;

    Memory Unit1(
        .Din(8'b0),
        .Adress(Adr),
        .Read(Rd),
        .Write(Wr),
        .Dout(B)
    );

    ALU Unit2(
        .A(A),
        .B(B),
        .OpCode(Op),
        .ZFlag(Z)
    );


endmodule