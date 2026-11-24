`timescale 1ns / 1ps
// Project 15 : Flip-Flops (D, T, JK, SR)
// All are positive-edge triggered with an active-high asynchronous reset.

// ---------------- D Flip-Flop ----------------
module d_ff (
    input  wire clk,
    input  wire rst,
    input  wire d,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else     q <= d;
    end
endmodule

// ---------------- T Flip-Flop ----------------
module t_ff (
    input  wire clk,
    input  wire rst,
    input  wire t,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)    q <= 1'b0;
        else if (t) q <= ~q;
    end
endmodule

// ---------------- JK Flip-Flop ----------------
module jk_ff (
    input  wire clk,
    input  wire rst,
    input  wire j,
    input  wire k,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;      // hold
                2'b01: q <= 1'b0;   // reset
                2'b10: q <= 1'b1;   // set
                2'b11: q <= ~q;     // toggle
            endcase
        end
    end
endmodule

// ---------------- SR Flip-Flop ----------------
module sr_ff (
    input  wire clk,
    input  wire rst,
    input  wire s,
    input  wire r,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;      // hold
                2'b01: q <= 1'b0;   // reset
                2'b10: q <= 1'b1;   // set
                2'b11: q <= 1'bx;   // invalid
            endcase
        end
    end
endmodule
