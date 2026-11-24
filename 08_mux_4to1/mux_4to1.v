`timescale 1ns / 1ps
// Project 08 : 4:1 Multiplexer
// Two select lines choose one of four data inputs.
module mux_4to1 (
    input  wire [3:0] i,     // data inputs i[0]..i[3]
    input  wire [1:0] sel,   // select lines
    output reg        y
);
    always @(*) begin
        case (sel)
            2'b00:   y = i[0];
            2'b01:   y = i[1];
            2'b10:   y = i[2];
            2'b11:   y = i[3];
            default: y = 1'b0;
        endcase
    end
endmodule
