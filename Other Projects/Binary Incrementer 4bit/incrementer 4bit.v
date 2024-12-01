module incrementer_4bit (
    input [3:0] A,
    output [3:0] S,
    output C4
);
    wire [3:1] C; // Internal carries between half adders

    half_adder HA0(A[0], 1'b1, S[0], C[1]); // The rightmost half adder (A0) has a constant input of 1
    half_adder HA1(A[1], C[1], S[1], C[2]); // The rest of the half adders receive the carry from the previous one
    half_adder HA2(A[2], C[2], S[2], C[3]);
    half_adder HA3(A[3], C[3], S[3], C4);
endmodule
