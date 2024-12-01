module testbench;

    reg B0, B1, B2, B3;
    reg S1, S2;
    reg A0, A1, A2, A3;
    reg Cin0;

    wire D0, D1, D2, D3;
    wire Cout3;

    top_module uut (
        .B0(B0), .B1(B1), .B2(B2), .B3(B3),
        .S1(S1), .S2(S2),
        .A0(A0), .A1(A1), .A2(A2), .A3(A3),
        .Cin0(Cin0),
        .D0(D0), .D1(D1), .D2(D2), .D3(D3),
        .Cout3(Cout3)
    );

    initial begin
        B0 = 0; B1 = 0; B2 = 0; B3 = 0;
        S1 = 0; S2 = 0;
        A0 = 0; A1 = 0; A2 = 0; A3 = 0;
        Cin0 = 0;

        #10;

        B0 = 1; B1 = 0; B2 = 1; B3 = 0;
        S1 = 0; S2 = 0;
        A0 = 1; A1 = 0; A2 = 1; A3 = 0;
        Cin0 = 1;

        #10;

        B0 = 0; B1 = 1; B2 = 0; B3 = 1;
        S1 = 1; S2 = 0;
        A0 = 0; A1 = 1; A2 = 0; A3 = 1;
        Cin0 = 0;

        #10;

        B0 = 1; B1 = 1; B2 = 1; B3 = 1;
        S1 = 1; S2 = 1;
        A0 = 1; A1 = 1; A2 = 1; A3 = 1;
        Cin0 = 1;

        #10;

        $stop;
    end

endmodule
##