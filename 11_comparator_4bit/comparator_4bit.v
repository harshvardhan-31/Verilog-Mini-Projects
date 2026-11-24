`timescale 1ns / 1ps
// Project 11 : 4-bit Magnitude Comparator
// Compares two unsigned 4-bit numbers.
module comparator_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire       gt,   // a >  b
    output wire       eq,   // a == b
    output wire       lt    // a <  b
);
    assign gt = (a >  b);
    assign eq = (a == b);
    assign lt = (a <  b);
endmodule
