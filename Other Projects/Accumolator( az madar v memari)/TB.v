//gtkwave
`timescale 1ps/1ps
`include "AC.v"
module tb();

    reg alsu, clk ;
    wire bus ;

AC ac(
    .alsu(alsu) ,
    .bus (bus)
);
initial begin

    $dumpfile("tb.vcd") ;
    $dumpvars(0,tb) ;

    alsu =1'b8 ;
    # 50 ;
    alsu=1'b5 ;
    # 65 ;
end
always #5 clk=~clk ;

endmodule