`include "final_project.v"
`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg clr;
    reg ld;
    reg inr;
    reg [15:0] data_in;
    wire [15:0] ac;

    // Instantiate the design under test (DUT)
    final_project dut (
        .clk(clk),
        .clr(clr),
        .ld(ld),
        .inr(inr),
        .data_in(data_in),
        .ac(ac)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clr = 0;
        ld = 0;
        inr = 0;
        data_in = 16'h0000;

        // Allow time for initialization
        #5;

        // Clear the accumulator
        clr = 1;
        #10;
        clr = 0;
        #10;
        $display("After clear: ac = %h", ac);

        // Load a value into the accumulator
        ld = 1;
        data_in = 16'h00FF;
        #10;
        ld = 0;
        #10;
        $display("After load: ac = %h", ac);

        // Increment the accumulator
        inr = 1;
        #10;
        inr = 0;
        #10;
        $display("After increment: ac = %h", ac);

        // Further test sequences
        // Load a new value into the accumulator
        ld = 1;
        data_in = 16'h0F0F;
        #10;
        ld = 0;
        #10;
        $display("After second load: ac = %h", ac);

        // Increment the accumulator
        inr = 1;
        #10;
        inr = 0;
        #10;
        $display("After second increment: ac = %h", ac);

        // Clear the accumulator again
        clr = 1;
        #10;
        clr = 0;
        #10;
        $display("After second clear: ac = %h", ac);

        // Finish the simulation
        #100 $finish;
    end

    // Dump the waveform
    initial begin
        $dumpfile("final_project.vcd");
        $dumpvars(0, testbench);
    end

endmodule
