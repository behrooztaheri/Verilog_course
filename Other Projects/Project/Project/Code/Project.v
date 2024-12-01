module circuit (
    input [3:0] A, B,    // 4-bit inputs A and B
    input Cin,           // Carry-in input
    input [1:0] S,       // 2-bit select input for the multiplexer
    output [3:0] D,      // 4-bit output D
    output Cout          // Carry-out output
);

    wire [3:0] not_B;    // 4-bit wire to hold the bitwise NOT of B
    wire [3:0] carry;    // 4-bit wire to hold the carry bits from each full adder
    reg [3:0] mux_out;   // 4-bit register to hold the multiplexer output

    // Calculate the bitwise NOT of B
    assign not_B = ~B;

    // Always block for the multiplexer
    always @(*) begin
        case(S)
            2'b00: mux_out = 4'b0000;   // When S is 00, mux_out is 0000
            2'b01: mux_out = 4'b1111;   // When S is 01, mux_out is 1111
            2'b10: mux_out = B;         // When S is 10, mux_out is B
            2'b11: mux_out = not_B;     // When S is 11, mux_out is not_B
        endcase
    end

    // Instantiate 4 full adders
    full_adder fa0 (
        .X(A[0]),         // First bit of A
        .Y(mux_out[0]),   // First bit of mux_out
        .Cin(Cin),        // Carry-in input
        .Sum(D[0]),       // First bit of sum output D
        .Cout(carry[0])   // First carry-out
    );

    full_adder fa1 (
        .X(A[1]),         // Second bit of A
        .Y(mux_out[1]),   // Second bit of mux_out
        .Cin(carry[0]),   // Carry-in from the first full adder
        .Sum(D[1]),       // Second bit of sum output D
        .Cout(carry[1])   // Second carry-out
    );

    full_adder fa2 (
        .X(A[2]),         // Third bit of A
        .Y(mux_out[2]),   // Third bit of mux_out
        .Cin(carry[1]),   // Carry-in from the second full adder
        .Sum(D[2]),       // Third bit of sum output D
        .Cout(carry[2])   // Third carry-out
    );

    full_adder fa3 (
        .X(A[3]),         // Fourth bit of A
        .Y(mux_out[3]),   // Fourth bit of mux_out
        .Cin(carry[2]),   // Carry-in from the third full adder
        .Sum(D[3]),       // Fourth bit of sum output D
        .Cout(carry[3])   // Fourth carry-out
    );

    // Assign the final carry-out
    assign Cout = carry[3];

endmodule

// Module definition for the full adder
module full_adder (
    input X,        // First input bit
    input Y,        // Second input bit
    input Cin,      // Carry-in input
    output reg Sum, // Sum output
    output reg Cout // Carry-out output
);
    always @(*) begin
        // Calculate the sum and carry-out
        {Cout, Sum} = X + Y + Cin;
    end
endmodule