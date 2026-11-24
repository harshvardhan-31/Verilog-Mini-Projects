`timescale 1ns / 1ps
module tb_shift_registers;
    reg clk = 0, rst = 1;
    reg sin = 0, load = 0;
    reg [3:0] d = 4'b0000;
    wire siso_out, piso_out;
    wire [3:0] sipo_q, pipo_q;

    siso_4bit u_siso (.clk(clk), .rst(rst), .sin(sin), .sout(siso_out));
    sipo_4bit u_sipo (.clk(clk), .rst(rst), .sin(sin), .q(sipo_q));
    piso_4bit u_piso (.clk(clk), .rst(rst), .load(load), .d(d), .sout(piso_out));
    pipo_4bit u_pipo (.clk(clk), .rst(rst), .d(d), .q(pipo_q));

    always #5 clk = ~clk;

    always @(posedge clk)
        #1 $display("%4t | sin=%b load=%b d=%b | SISO=%b SIPO=%b PISO=%b PIPO=%b",
                    $time, sin, load, d, siso_out, sipo_q, piso_out, pipo_q);

    initial begin
        $display("time | inputs           | outputs");
        #12 rst = 0;
        // Shift 1011 serially into SISO/SIPO
        @(negedge clk) sin = 1;
        @(negedge clk) sin = 0;
        @(negedge clk) sin = 1;
        @(negedge clk) sin = 1;
        @(negedge clk) sin = 0;
        // Parallel load 1101 into PISO/PIPO, then shift PISO out
        @(negedge clk) begin d = 4'b1101; load = 1; end
        @(negedge clk) load = 0;
        repeat (4) @(negedge clk);
        $finish;
    end
endmodule
