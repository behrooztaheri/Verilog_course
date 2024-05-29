
module Mux_gate_1to1(
    
    input S0,
    input S1,
    input A,
    input B,
    output reg Ei
);

always @(*)
    begin
        case({S1,S0})
            2'b00 :  Ei = A & B; 
            2'b01 :  Ei = A | B; 
            2'b10 :  Ei = A ^ B; 
            2'b11 :  Ei = ~(A) ; 
            default:  Ei = 1'bx; 
        endcase
    end


endmodule

//=======================================

module Mux_Gate_4to1_FA(
    input S0,
    input S1,
    input CIN,
    input A0,
    input B0,
    input O,

    output D
);

    wire reg Y0;

    assign Y0 = (S0) ? B0 : ~B0;
    assign D = (S1) ? Y0 : ~Y0;
    /*
    .می توانیم ماژول فول ادر را همراه با مولتی پلکسر در این قسمت بنویسیم در عملکرد تفاوتی ندارد
    */
    Full_Adder U1(
        .X1(A0),
        .X2(Y0),
        .cin(CIN),

        .S(D)
    );


endmodule

//=======================================

module Full_Adder(
    input X1,
    input X2,
    input cin,

    output S,
    output Cout
);
    wire  Xor1 , And1 , And2 ;

    assign  Xor1 = (X1 ^ X2);
    assign S = (cin ^ Xor1);

    assign And1 = (cin & Xor1);
    assign And2 = (X1 & X2);
    assign Cout = (And1 | And2);

endmodule

//=======================================

module Logic_Shift(
    input s0,
    input s1,
    input s2,
    input s3,
    input Ai,
    input Bi,
    input Ai_1,
    input Aii,
    output reg F
);

    wire E1 , D1 ;

    Mux_gate_1to1 U1(
        .S0(s0),
        .S1(s1),
        .A(Ai),
        .B(Bi),

        .Ei(E1)
    );

    Mux_Gate_4to1_FA U2(
        .S0(s0),
        .S1(s1),
        .CIN(s2),
        .A0(Ai),
        .B0(Bi),
        .O(E1),

        .D(D1)
    );

    always @(*)
        begin
            case ({s3,s2})
                2'b00 : F = D1;
                2'b01 : F = E1;
                2'b10 : F = Ai_1;
                2'b11 : F = Aii;
                default : F = 1'bx;
            endcase
        end

endmodule
//ترم بهمن 1403