module mux4to1_0 (
    input wire B0,
    input wire S1, 
    input wire S2, 
    output wire Y0 
);

    wire B0_not;
    wire zero = 0;
    wire one = 1;

   
    not (B0_not, B0);

    
    assign Y0 = (S1 == 0 && S2 == 0) ? B0 : 
               (S1 == 0 && S2 == 1) ? B0_not : 
               (S1 == 1 && S2 == 0) ? zero : 
               (S1 == 1 && S2 == 1) ? one : 0;

endmodule

module mux4to1_1 (
    input wire B1, 
    input wire S1, 
    input wire S2, 
    output wire Y1  
);

    wire B1_not;
    wire zero = 0;
    wire one = 1;

    not (B1_not, B1);

    assign Y1 = (S1 == 0 && S2 == 0) ? B1 : 
               (S1 == 0 && S2 == 1) ? B1_not : 
               (S1 == 1 && S2 == 0) ? zero : 
               (S1 == 1 && S2 == 1) ? one : 0;

endmodule

module mux4to1_2 (
    input wire B2, 
    input wire S1, 
    input wire S2, 
    output wire Y2 
);

    wire B2_not;
    wire zero = 0;
    wire one = 1;

 
    not (B2_not, B2);

    assign Y2 = (S1 == 0 && S2 == 0) ? B2 : 
               (S1 == 0 && S2 == 1) ? B2_not : 
               (S1 == 1 && S2 == 0) ? zero : 
               (S1 == 1 && S2 == 1) ? one : 0;

endmodule

module mux4to1_3 (
    input wire B3, 
    input wire S1, 
    input wire S2, 
    output wire Y3  
);

    wire B3_not;
    wire zero = 0;
    wire one = 1;

  
    not (B3_not, B3);

    
    assign Y3 = (S1 == 0 && S2 == 0) ? B3 : 
               (S1 == 0 && S2 == 1) ? B3_not : 
               (S1 == 1 && S2 == 0) ? zero : 
               (S1 == 1 && S2 == 1) ? one : 0;

endmodule


module full_adder_0 (
    input wire A0, 
    input wire Y0,  
    input wire Cin0, 
    output wire D0, 
    output wire Cout0 
);

   
    assign D0 = A0 ^ Y0 ^ Cin0;

   
    assign Cout0 = (A0 & Y0) | (Y0 & Cin0) | (Cin0 & A0);


endmodule

module full_adder_1 (
    input wire A1, 
    input wire Y1, 
    input wire Cin1, 
    output wire D1, 
    output wire Cout1  
);

 
    assign D1 = A1 ^ Y1 ^ Cin1;

   
    assign Cout1 = (A1 & Y1) | (Y1 & Cin1) | (Cin1 & A1);

endmodule

module full_adder_2 (
    input wire A2, 
    input wire Y2,  
    input wire Cin2, 
    output wire D2, 
    output wire Cout2
);

  
    assign D2 = A2 ^ Y2 ^ Cin2;

 
    assign Cout2 = (A2 & Y2) | (Y2 & Cin2) | (Cin2 & A2);

endmodule

module full_adder_3 (
    input wire A3, 
    input wire Y3,  
    input wire Cin3, 
    output wire D3, 
    output wire Cout3  
);

    
    assign D3 = A3 ^ Y3 ^ Cin3;

    assign Cout3 = (A3 & Y3) | (Y3 & Cin3) | (Cin3 & A3);

endmodule

module top_module (
    input wire B0, B1, B2, B3, 
    input wire S1, S2, 
    input wire A0, A1, A2, A3,   
    input wire Cin0,    
    output wire D0, D1, D2, D3, 
    output wire Cout3   
);

    wire Y0, Y1, Y2, Y3; 
    wire Cout0, Cout1, Cout2;

 
    mux4to1_0 mux_inst_0 (
        .B0(B0),
        .S1(S1),
        .S2(S2),
        .Y0(Y0)
    );

    mux4to1_1 mux_inst_1 (
        .B1(B1),
        .S1(S1),
        .S2(S2),
        .Y1(Y1)
    );

    mux4to1_2 mux_inst_2 (
        .B2(B2),
        .S1(S1),
        .S2(S2),
        .Y2(Y2)
    );

 
    mux4to1_3 mux_inst_3 (
        .B3(B3),
        .S1(S1),
        .S2(S2),
        .Y3(Y3)
    );

  
    full_adder_0 adder_inst_0 (
        .A0(A0),
        .Y0(Y0), 
        .Cin0(Cin0),
        .D0(D0),
        .Cout0(Cout0) 
    );

  
    full_adder_1 adder_inst_1 (
        .A1(A1),
        .Y1(Y1), 
        .Cin1(Cout0),
        .D1(D1),
        .Cout1(Cout1) 
    );

 
    full_adder_2 adder_inst_2 (
        .A2(A2),
        .Y2(Y2), 
        .Cin2(Cout1), 
        .D2(D2),
        .Cout2(Cout2)
    );

   
    full_adder_3 adder_inst_3 (
        .A3(A3),
        .Y3(Y3),
        .Cin3(Cout2),
        .D3(D3),
        .Cout3(Cout3) 
    );

endmodule





