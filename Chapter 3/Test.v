module Test(
    input en,
    input Start,
    input [1:0] X,

    output reg [3:0] F,
    output reg FADD
);

    reg [3:0] Y;

    always @(*)
        begin
            if(en == 0)
                Y = 4'b0000;
            else if(X==0)
                Y = 4'b0001;
            else if(X==1)
                Y = 4'b0010;
            else if(X==2)
                Y = 4'b0100;
            else if(X==3)
                Y = 4'b1000;
            else
                Y = 4'bz;

            if(Start)
                F = Y;
            else
                F = 0;

            FADD = F[0] & F[1] & F[2] & F[3];


endmodule