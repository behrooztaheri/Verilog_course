// Define a multiplexer module with a select signal and two 4-bit inputs
module multiplexer (
input wire s, // Select signal
input wire [3:0] in0, // 4-bit input 0
input wire [3:0] in1, // 4-bit input 1
output wire [3:0] out // 4-bit output
);
// Output is assigned based on the select signal
// If s is high, in1 is selected; otherwise, in0 is selected
assign out = s ? in1 : in0;
endmodule

// Define a shift right module that shifts a 4-bit input by one position to the right
module shift_right (
input wire [3:0] in, // 4-bit input
output wire [3:0] out // 4-bit output
);
// Perform bitwise right shift by one position
assign out = in >> 1;
endmodule

// Define a shift left module that shifts a 4-bit input by one position to the left
module shift_left (
input wire [3:0] in, // 4-bit input
output wire [3:0] out // 4-bit output
);
// Perform bitwise left shift by one position
assign out = in << 1;
endmodule

// Main module that uses the multiplexer and shift modules to process inputs
module main_module (
input wire s, // Select signal for multiplexers
input wire [3:0] IR, // 4-bit input IR
input wire [3:0] IL, // 4-bit input IL
input wire [3:0] A0, // 4-bit input A0
input wire [3:0] A1, // 4-bit input A1
input wire [3:0] A2, // 4-bit input A2
input wire [3:0] A3, // 4-bit input A3
output wire [3:0] H0, // 4-bit output H0
output wire [3:0] H1, // 4-bit output H1
output wire [3:0] H2, // 4-bit output H2
output wire [3:0] H3 // 4-bit output H3
);
// Internal wires to connect the modules
wire [3:0] mux1_out;
wire [3:0] mux2_out; 
wire [3:0] mux3_out; 
wire [3:0] mux4_out;
wire [3:0] sr1_out;
wire [3:0] sl1_out;

// Instantiate the first multiplexer
multiplexer mux1 (
.s(s), // Select signal
.in0(IR), // Input 0 connected to IR
.in1(A1), // Input 1 connected to A1
.out(mux1_out) // Output connected to internal wire mux1_out
);

// Instantiate the second multiplexer
multiplexer mux2 (
.s(s), // Select signal
.in0(A0), // Input 0 connected to A0
.in1(A2), // Input 1 connected to A2
.out(mux2_out) // Output connected to H1 directly
);

// Instantiate the third multiplexer
multiplexer mux3 (
.s(s), // Select signal
.in0(A1), // Input 0 connected to A1
.in1(A3), // Input 1 connected to A3
.out(mux3_out) // Output connected to H2 directly
);

// Instantiate the fourth multiplexer
multiplexer mux4 (
.s(s), // Select signal
.in0(A2), // Input 0 connected to A2
.in1(IL), // Input 1 connected to IL
.out(mux4_out) // Output connected to internal wire mux4_out
);

// Instantiate the shift right module
shift_right sr1 (
.in(mux1_out), // Input connected to mux1_out
.out(sr1_out) // Output connected to H0
);

// Instantiate the shift left module
shift_left sl1 (
.in(mux4_out), // Input connected to mux4_out
.out(sl1_out) // Output connected to H3
);

// Connect the outputs of the modules to the main module outputs
assign H0 = sr1_out; // Connect shift right output to H0
assign H1 = mux2_out; // Connect mux2 output directly to H1
assign H2 = mux3_out; // Connect mux3 output directly to H2
assign H3 = sl1_out; // Connect shift left output to H3
endmodule