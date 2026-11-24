`timescale 1ns / 1ps
// Project 17 : Counters
// 4-bit up counter, up/down counter, and a mod-10 (BCD) counter.
// All are positive-edge triggered with an active-high asynchronous reset.

// ---------------- 4-bit Up Counter with enable ----------------
module up_counter_4bit (
    input  wire       clk,
    input  wire       rst,
    input  wire       en,
    output reg  [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)     count <= 4'd0;
        else if (en) count <= count + 4'd1;
    end
endmodule

// ---------------- 4-bit Up/Down Counter ----------------
module updown_counter_4bit (
    input  wire       clk,
    input  wire       rst,
    input  wire       up,     // 1 = count up, 0 = count down
    output reg  [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)      count <= 4'd0;
        else if (up)  count <= count + 4'd1;
        else          count <= count - 4'd1;
    end
endmodule

// ---------------- Mod-10 (BCD) Counter : counts 0..9 ----------------
module mod10_counter (
    input  wire       clk,
    input  wire       rst,
    output reg  [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)               count <= 4'd0;
        else if (count == 4'd9) count <= 4'd0;
        else                   count <= count + 4'd1;
    end
endmodule
