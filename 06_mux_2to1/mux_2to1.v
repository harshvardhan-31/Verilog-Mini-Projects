`timescale 1ns / 1ps
// Project 06 : 2:1 Multiplexer
// sel = 0 -> y = i0, sel = 1 -> y = i1
module mux_2to1 (
    input  wire i0,
    input  wire i1,
    input  wire sel,
    output wire y
);
    assign y = sel ? i1 : i0;
endmodule
