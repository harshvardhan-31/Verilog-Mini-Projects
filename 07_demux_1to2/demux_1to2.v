`timescale 1ns / 1ps
// Project 07 : 1:2 Demultiplexer
// Routes input d to y0 when sel = 0, or to y1 when sel = 1.
module demux_1to2 (
    input  wire d,
    input  wire sel,
    output wire y0,
    output wire y1
);
    assign y0 = d & ~sel;
    assign y1 = d &  sel;
endmodule
