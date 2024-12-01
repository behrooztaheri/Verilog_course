// project Ali ghasemzadeh
module multiplexer (
input wire s, 
input wire [3:0] in0, 
input wire [3:0] in1, 
output wire [3:0] out 
);

assign out = s ? in1 : in0;
endmodule

module shift_left (
input wire [3:0] in, 
output wire [3:0] out 
);
assign out = in << 1;
endmodule 
////////////
module shift_right (
input wire [3:0] in, 
output wire [3:0] out 
);
assign out = in >> 1;
endmodule
////////////

module main_module (
    input wire [3:0] A0, 
    input wire [3:0] A1, 
    input wire [3:0] A2, 
    input wire [3:0] A3, 
    input wire [3:0] IR, 
    input wire [3:0] IL,
    input wire s, 
    output wire [3:0] H0, 
    output wire [3:0] H1, 
    output wire [3:0] H2, 
    output wire [3:0] H3 
);

wire [3:0] mux1_out;
wire [3:0] mux2_out; 
wire [3:0] mux3_out; 
wire [3:0] mux4_out;


multiplexer mux1 (
.s(s), 
.in0(IR), 
.in1(A1), 
.out(mux1_out) 
);

multiplexer mux2 (
.s(s), 
.in0(A0), 
.in1(A2), 
.out(mux2_out) 
);

multiplexer mux3 (
.s(s), 
.in0(A1), 
.in1(A3), 
.out(mux3_out) 
);

multiplexer mux4 (
.s(s), 
.in0(A2),
.in1(IL), 
.out(mux4_out)
);

assign H0 = mux1_out; 
assign H1 = mux2_out; 
assign H2 = mux3_out; 
assign H3 = mux4_out; 
endmodule