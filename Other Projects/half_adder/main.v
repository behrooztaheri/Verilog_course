module main(a,s,cout);
input [3:0] a;
output [3:0] s;
output cout;
wire [3:1] c;

halfadder u1(a[0],1'b1,s[0],c[1]);
halfadder u2(a[1],c[1],s[1],c[2]);
halfadder u3(a[2],c[2],s[2],c[3]);
halfadder u4(a[3],c[3],s[3],cout);


endmodule
