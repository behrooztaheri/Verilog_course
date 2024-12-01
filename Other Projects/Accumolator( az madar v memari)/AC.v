module And(
    input a , 
    input b, 
    output c
);
assign c= a & b ;
endmodule

module Or(
    input x , y , w , m , n , v , o ,
    output z 
);
assign z= x | y ;
endmodule

module And_Or(
    input D0, D1, D2 ,
    input T5 ,
    input P ,
    input R , 
    input B11, B4, B7, B5, B9 ,
    output wire LD, INC, CLR,
    output wire AND, ADD, OR, INPR, SHR, SHL
);
And A1 (
    .a(D0) ,
    .b(T5) ,
    .c(AND) 
);
And A2 (
    .a(D1) ,
    .b(T5) ,
    .c(ADD)
);
And A3 (
    .a(D2) ,
    .b(T5) ,
    .c(OR)
);
And A4 (
    .a(P) ,
    .b(B11) ,
    .c(INPR)
);
And A5 (
    .a(R) ,
    .b(B4) ,
    .c(COM)
);
And A6 (
    .a(R) ,
    .b(B7) ,
    .c(SHR)
);
And A7 (
    .a(R) ,
    .b(B9) ,
    .c(SHL)
);
endmodule

module AC(
    input alsu,
    input clk,
    input R, B5, B11, 
    output reg  bus ,
    input  LD, INC, CLR,
    input  AND, ADD, OR, INPR, SHR, SHL
);
And A8 (
    .a(R) ,
    .b(B5) ,
    .c(INC)
);
And A9 (
    .a(R) ,
    .b(B11) ,
    .c(CLR)
);
Or o(
    .x(AND) ,
    .y(ADD) ,
    .w(OR) ,
    .m(INPR) ,
    .n(COM) ,
    .v(SHR) ,
    .o(SHL) ,
    .z(LD)
); 

always @(*)
    begin
        if (CLR==1) begin
            bus=0;
        end
        if (INC==1) begin
            bus=(alsu+1);
        end
        if (LD==1) begin
            bus=1'bz;
        end
end
endmodule
