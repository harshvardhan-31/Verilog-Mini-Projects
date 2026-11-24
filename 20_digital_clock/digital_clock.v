`timescale 1ns / 1ps
// Project 20 : Digital Clock / Stopwatch
// Counts seconds, minutes and hours (00:00:00 to 23:59:59).
// mode = 0 : clock runs automatically every tick
// mode = 1 : stopwatch, counts only while start = 1
// In a real design 'tick' would be a 1 Hz enable from a clock divider;
// here it is an input so the testbench can drive it.
module digital_clock (
    input  wire       clk,
    input  wire       rst,
    input  wire       tick,    // 1 Hz enable pulse
    input  wire       mode,    // 0 = clock, 1 = stopwatch
    input  wire       start,   // stopwatch run/pause (mode 1 only)
    output reg  [5:0] sec,
    output reg  [5:0] min,
    output reg  [4:0] hour
);
    wire advance = tick & (mode ? start : 1'b1);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sec  <= 6'd0;
            min  <= 6'd0;
            hour <= 5'd0;
        end else if (advance) begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
                if (min == 6'd59) begin
                    min <= 6'd0;
                    if (hour == 5'd23) hour <= 5'd0;
                    else               hour <= hour + 5'd1;
                end else min <= min + 6'd1;
            end else sec <= sec + 6'd1;
        end
    end
endmodule
