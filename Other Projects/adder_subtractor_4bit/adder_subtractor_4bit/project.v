//

module adder_subtractor_4bit(
                            input [3:0] a, 
                            input [3:0] b, 
                            input add_sub, 
                            output [4:0] result,
                            output carry 
                            );
                            
    wire [3:0] b_xor;
        assign b_xor = b ^ {4{add_sub}};
            wire [3:0] sum;
             wire carry_out;
                 wire carry_in;
                    assign carry_in = add_sub; // برای تفریق، کری اولیه باید 1 باشد

    // اجرای جمع 4 بیتی
    full_adder fa0 (
    .a(a[0]),
    .b(b_xor[0]),
    .carry_in(carry_in),
    .result(result[0]),
    .carry_out(carry_out0)
    );
        full_adder fa1 (
        .a(a[1]),
        .b(b_xor[1]),
        .carry_in(carry_out0),
        .result(result[1]),
        .carry_out(carry_out1)
        );
            full_adder fa2 (
            .a(a[2]),
            .b(b_xor[2]),
            .carry_in(carry_out1),
            .result(result[2]),
            .carry_out(carry_out2)
            );
                full_adder fa3 (
                .a(a[3]),
                .b(b_xor[3]),
                .carry_in(carry_out2),
                .result(result[3]),
                .carry_out(carry_out)
                );

                    assign result =result;
                     assign carry = carry_out; // کری برای جمع

endmodule

// ماژول جمع‌کننده کامل
module full_adder(
                input a,
                input b,
                input carry_in,
                output result,
                output carry_out
                );

                    assign result= a ^ b ^ carry_in;
                         assign carry_out = (a & b) | (b & carry_in) | (a & carry_in);

endmodule
//بهمن1402