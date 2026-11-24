`timescale 1ns / 1ps
// Project 10 : 4-to-2 Priority Encoder
// d[3] has the highest priority. valid = 0 when no input is active.
module priority_encoder_4to2 (
    input  wire [3:0] d,
    output reg  [1:0] y,
    output reg        valid
);
    always @(*) begin
        valid = 1'b1;
        casez (d)
            4'b1???: y = 2'd3;
            4'b01??: y = 2'd2;
            4'b001?: y = 2'd1;
            4'b0001: y = 2'd0;
            default: begin
                y     = 2'd0;
                valid = 1'b0;
            end
        endcase
    end
endmodule
