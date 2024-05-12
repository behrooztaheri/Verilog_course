module Memory(
    input [7:0] Din,
    input [11:0] Address,
    input Read,
    input Write,

    output [7:0] Dout 
);

    reg [7:0] MEM [4095:0];

    initial 
        begin
          MEM[0] = 5;
          MEM[86] = 24;
          MEM[4065] = 60;
        end

    assign Dout = (Read == 1)? MEM[Address]:8'bz;
    
    always @(*)
        begin
            if(Write==1)
                MEM[Address] = Din;
        end

endmodule