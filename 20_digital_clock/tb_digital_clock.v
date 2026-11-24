`timescale 1ns / 1ps
module tb_digital_clock;
    reg clk = 0, rst = 1;
    reg tick = 0, mode = 0, start = 0;
    wire [5:0] sec, min;
    wire [4:0] hour;
    integer i;

    digital_clock uut (
        .clk(clk), .rst(rst), .tick(tick),
        .mode(mode), .start(start),
        .sec(sec), .min(min), .hour(hour)
    );

    always #5 clk = ~clk;

    // One tick = one second
    task one_second;
        begin
            @(negedge clk) tick = 1;
            @(negedge clk) tick = 0;
        end
    endtask

    initial begin
        $display("time | mode start | hh:mm:ss");
        #12 rst = 0;

        $display("--- clock mode: 3 seconds ---");
        for (i = 0; i < 3; i = i + 1) begin
            one_second;
            $display("%4t |  %b     %b   | %2d:%2d:%2d", $time, mode, start, hour, min, sec);
        end

        $display("--- roll over 59 -> 60 seconds (min increments) ---");
        for (i = 0; i < 58; i = i + 1) one_second;
        for (i = 0; i < 3; i = i + 1) begin
            one_second;
            $display("%4t |  %b     %b   | %2d:%2d:%2d", $time, mode, start, hour, min, sec);
        end

        $display("--- stopwatch mode: paused, then running ---");
        mode = 1; start = 0;
        one_second;
        $display("%4t |  %b     %b   | %2d:%2d:%2d (paused)", $time, mode, start, hour, min, sec);
        start = 1;
        for (i = 0; i < 2; i = i + 1) begin
            one_second;
            $display("%4t |  %b     %b   | %2d:%2d:%2d (running)", $time, mode, start, hour, min, sec);
        end
        $finish;
    end
endmodule
