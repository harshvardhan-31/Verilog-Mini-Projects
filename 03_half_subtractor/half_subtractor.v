`timescale 1ns / 1ps
// Project 03 : Half Subtractor
// Computes a - b for 1-bit inputs. diff = a XOR b, borrow = (NOT a) AND b.
module half_subtractor (
    input  wire a,
    input  wire b,
    output wire diff,
    output wire borrow
);
    assign diff   =  a ^ b;
    assign borrow = ~a & b;
endmodule
