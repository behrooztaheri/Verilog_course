module main_module(
    input wire clk,
    input wire x1,
    input wire x2,
    input wire x3,
    input wire x4,
    input wire x5,
    input wire x6,
    input wire x7,
    output wire IEN  
);

    wire p1, p2, p3, p4; 
    wire xor_result;
    wire jk_Q; 

    assign p1 = x1 & x2 & x3;
    assign p2 = p1 & x4;
    assign p3 = p1 & x5;
    assign p4 = x6 & x7;
    assign xor_result = p3 ^ p4;

    j_k_flip_flop jk_ff (
        .J(p2),
        .K(xor_result),
        .CK(clk),
        .Q(jk_Q)  
    );

    assign IEN = jk_Q;

endmodule

module j_k_flip_flop(
    input wire J,
    input wire K,
    input wire CK,
    output reg Q  
);

    always @(posedge CK) begin
        if (J & ~K)
            Q <= 1'b1;
        else if (~J & K)
            Q <= 1'b0;
        else if (J & K)
            Q <= ~Q;
    end

endmodule


















