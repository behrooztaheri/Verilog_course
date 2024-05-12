module _IF_ELSE(
    input [7:0] A,
    output [7:0] B
);

    // assign B = (A > 8'd18)? 8'd5: 8'd10;

    // assign B = (A > 18)? 5: 10;

    assign B = (A > 18)? 5: (A > 10)? 6: 10;


endmodule