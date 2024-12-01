module fa1bit ( input x , input y , input z , output s , output c );
xor(l,x,y);
xor(s,l,z);
and(p,l,z);
and(q,x,y);
or(c,p,q);

endmodule

module fa4bit ( input [3:0] x , input [3:0] y , output [4:0] s );
wire [2:0] c;
fa1bit u1 ( .x(x[0]), .y(y[0]), .z(1'b0), .s(s[0]),  .c(c[0]) );
fa1bit u2 ( .x(x[1]), .y(y[1]), .z(c[0]), .s(s[1]),  .c(c[1]) );
fa1bit u3 ( .x(x[2]), .y(y[2]), .z(c[1]), .s(s[2]),  .c(c[2]) );
fa1bit u4 ( .x(x[3]), .y(y[3]), .z(c[2]), .s(s[3]),  .c(s[4]) );

endmodule


module zarb ( input [2:0]a , input [3:0]b , output [6:0]c );

and ( c[0] , b[0] , a[0] );
and ( w1_1 , b[1] , a[0] );
and ( w1_2 , b[2] , a[0] );
and ( w1_3 , b[3] , a[0] );

and ( w1_4 , b[0] , a[1] );
and ( w1_5 , b[1] , a[1] );
and ( w1_6 , b[2] , a[1] );
and ( w1_7 , b[3] , a[1] );

fa4bit s1 (
.x( { 1'b0 , w1_3 , w1_2 , w1_1 } ),
.y( { w1_7 , w1_6 , w1_5 , w1_4 } ),
.s( { g4 , g3 , g2 , g1 , c[1] } )
);

and ( w2_1 , b[0] , a[2] );
and ( w2_2 , b[1] , a[2] );
and ( w2_3 , b[2] , a[2] );
and ( w2_4 , b[3] , a[2] );

fa4bit s2 (
.x( { g4 , g3 , g2 , g1 } ),
.y( { w2_4 , w2_3 , w2_2 , w2_1 } ),
.s( { c[6] , c[5] , c[4] , c[3] , c[2] } )
);


endmodule