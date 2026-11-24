`timescale 1ns / 1ps
module tb_counters;
    reg clk = 0, rst = 1;
    reg en = 1, up = 1;
    wire [3:0] up_cnt, updown_cnt, bcd_cnt;

    up_counter_4bit   u_up   (.clk(clk), .rst(rst), .en(en), .count(up_cnt));
    updown_counter_4bit u_ud (.clk(clk), .rst(rst), .up(up), .count(updown_cnt));
    mod10_counter     u_bcd  (.clk(clk), .rst(rst), .count(bcd_cnt));

    always #5 clk = ~clk;

    always @(posedge clk)
        #1 $display("%4t | en=%b up=%b | up=%2d updown=%2d bcd=%2d",
                    $time, en, up, up_cnt, updown_cnt, bcd_cnt);

    initial begin
        $display("time | inputs   | counters");
        #12 rst = 0;
        repeat (5) @(negedge clk);
        en = 0;                      // pause the up counter
        repeat (2) @(negedge clk);
        en = 1; up = 0;              // up/down counter goes down
        repeat (6) @(negedge clk);
        $finish;
    end
endmodule
