`timescale 1ns / 1ps
// Project 16 : 4-bit Shift Registers
// SISO, SIPO, PISO and PIPO registers built from D flip-flops.
// All are positive-edge triggered with an active-high synchronous reset.

// ---------------- SISO : Serial In, Serial Out ----------------
module siso_4bit (
    input  wire clk,
    input  wire rst,
    input  wire sin,
    output wire sout
);
    reg [3:0] q;
    always @(posedge clk) begin
        if (rst) q <= 4'b0000;
        else     q <= {q[2:0], sin};
    end
    assign sout = q[3];
endmodule

// ---------------- SIPO : Serial In, Parallel Out ----------------
module sipo_4bit (
    input  wire       clk,
    input  wire       rst,
    input  wire       sin,
    output wire [3:0] q
);
    reg [3:0] r;
    always @(posedge clk) begin
        if (rst) r <= 4'b0000;
        else     r <= {r[2:0], sin};
    end
    assign q = r;
endmodule

// ---------------- PISO : Parallel In, Serial Out ----------------
module piso_4bit (
    input  wire       clk,
    input  wire       rst,
    input  wire       load,   // 1 = load parallel data, 0 = shift
    input  wire [3:0] d,
    output wire       sout
);
    reg [3:0] q;
    always @(posedge clk) begin
        if (rst)      q <= 4'b0000;
        else if (load) q <= d;
        else           q <= {q[2:0], 1'b0};
    end
    assign sout = q[3];
endmodule

// ---------------- PIPO : Parallel In, Parallel Out ----------------
module pipo_4bit (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] d,
    output reg  [3:0] q
);
    always @(posedge clk) begin
        if (rst) q <= 4'b0000;
        else     q <= d;
    end
endmodule
