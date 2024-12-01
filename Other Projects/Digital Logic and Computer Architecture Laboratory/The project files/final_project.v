module final_project (
    input clk,
    input clr,
    input ld,
    input inr,
    input [15:0] data_in,
    output reg [15:0] ac
);
    reg prev_clk;

    always @(*) begin
        if (clr)
            ac <= 16'h0000;
        else if (clk && !prev_clk) begin
            if (ld)
                ac <= data_in;
            else if (inr)
                ac <= ac + 1;
        end
    end

    always @(*) begin
        if (clr)
            prev_clk <= 0;
        else
            prev_clk <= clk;
    end
endmodule
