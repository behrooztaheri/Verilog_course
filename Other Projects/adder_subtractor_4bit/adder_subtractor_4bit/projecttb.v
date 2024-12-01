 // gtkwave

`timescale 1ns / 1ps
`include "./project.v"


module test_pr();

            reg [3:0] a;
            reg [3:0] b;
            reg add_sub;
            wire[4:0]result;
            wire carry;

adder_subtractor_4bit uf(
                        .a(a),
                        .b(b),
                        .add_sub(add_sub),
                        .result(result),
                        .carry(carry)
                        );
initial
  begin 
          $dumpfile("TBB.vcd");
          $dumpvars(0 ,test_pr);
    // Test Case 1: Addition
    a =0;
    b = 2;
    add_sub = 0;
    #10;

    // Test Case 2: Subtraction
    a = 10;
    b = 1;
    add_sub = 1;
    #10;
    // test case 3: Addition
    a=7;
    b=6;
    add_sub =0;
    #10;
    //you can test more case of Addition &&  Subtraction
    

    
    $finish;


  end


endmodule
//بهمن1402


















