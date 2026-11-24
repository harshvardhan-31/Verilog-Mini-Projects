`timescale 1ns / 1ps
// Project 04 : Full Adder
// Adds three 1-bit inputs (a, b and carry-in).
module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule
