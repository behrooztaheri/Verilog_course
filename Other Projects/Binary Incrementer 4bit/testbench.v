module testbench;
    reg [3:0] A;
    wire [3:0] S;
    wire C4;

    incrementer_4bit uut (
        .A(A), 
        .S(S), 
        .C4(C4)
    );

    initial begin

        A = 4'b0000; // Initialize Inputs

        #100; // Wait 100 ns for global reset to finish

        A = 4'b0101; #10; // Test Case 1: Increment 5
        A = 4'b1100; #10; // Test Case 2: Increment 12
        A = 4'b1111; #10; // Test Case 3: Increment 15
    end
      
    initial begin
        $monitor("At time %dns, A = %b, S = %b, C4 = %b", $time, A, S, C4);
    end
endmodule
