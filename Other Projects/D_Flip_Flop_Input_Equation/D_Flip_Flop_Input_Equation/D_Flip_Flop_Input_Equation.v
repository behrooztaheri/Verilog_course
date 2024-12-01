module D_Flip_Flop(
    input D,
    input clk,
    output reg Q,
    output reg Q_prime
);
    always @(*)
    begin
        Q = ~(~(D & clk) & Q_prime);
        Q_prime = ~(~(~D & clk) & Q);
    end
endmodule

module DFF_Input_Equation(
    input X,
    input clk,
    output Y
);
    reg A;
    reg A_prime;
    reg B;
    reg B_Prime;
    reg D1;
    reg D2;

    always @(*)
    begin
        D1 = (X & A) | (X & B);
        D2 = A_prime & X;
    end

    D_Flip_Flop D_Flip_Flop_1( 
        .D(D1),
        .clk(clk),
        .Q(A),
        .Q_prime(A_prime)
    );

    D_Flip_Flop D_Flip_Flop_2(
        .D(D2),
        .clk(clk),
        .Q(B),
        .Q_prime(B_Prime) 
    );

    always @(*) 
    begin
        Y = ((A & ~X) | (B & ~X));
    end

endmodule