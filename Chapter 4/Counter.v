module Counter1(
    input Clk,
    output reg [15:0] Y
);

    initial
        begin
          Y = 0;
        end

    always @(posedge Clk)
        begin
          Y = Y + 1;
        end

endmodule

module Counter2(
    input Clk,
    output reg [15:0] Y
);

    initial
        begin
          Y = 0;
        end

    always @(negedge Clk)
        begin
          Y = Y + 1;
        end

endmodule