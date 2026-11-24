`timescale 1ns / 1ps
// Project 13 : 4-bit Adder / Subtractor
// mode = 0 : result = a + b
// mode = 1 : result = a - b   (b is inverted and carry-in = 1 -> two's complement)
module adder_subtractor_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       mode,
    output wire [3:0] result,
    output wire       cout,      // carry out (for subtraction: 1 = no borrow)
    output wire       overflow   // signed overflow
);
    wire [3:0] b_x = b ^ {4{mode}};   // XOR gates invert b when subtracting
    wire c1, c2, c3;

    as_full_adder fa0 (.a(a[0]), .b(b_x[0]), .cin(mode), .sum(result[0]), .cout(c1));
    as_full_adder fa1 (.a(a[1]), .b(b_x[1]), .cin(c1),   .sum(result[1]), .cout(c2));
    as_full_adder fa2 (.a(a[2]), .b(b_x[2]), .cin(c2),   .sum(result[2]), .cout(c3));
    as_full_adder fa3 (.a(a[3]), .b(b_x[3]), .cin(c3),   .sum(result[3]), .cout(cout));

    assign overflow = c3 ^ cout;
endmodule

module as_full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule
