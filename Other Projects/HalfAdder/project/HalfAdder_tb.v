//gtkwave
`timescale 1ps/1ps
`include "HalfAdder.v"

module TB();

reg x,y;
wire n,g;

HalfAdder HA(

.X(x),
.Y(y),
.N(n),
.G(g),

);

initial begin

    $dumpfile("TB.vcd");
    $dumpvars(0,TB);

    x = 4'd8;
    y = 4'd3;
    #50;

    x = 4'd4;
    y = 4'd4;
    #20;

    x = 4'd7;
    y = 4'd3;
    #60;

    x = 4'd2;
    y = 4'd5;
    #30;

end

endmodule