`timescale 1ns / 1ps
module tb_flip_flops;
    reg clk = 0, rst = 1;
    reg d = 0, t = 0, j = 0, k = 0, s = 0, r = 0;
    wire q_d, q_t, q_jk, q_sr;

    d_ff  u_d  (.clk(clk), .rst(rst), .d(d),          .q(q_d));
    t_ff  u_t  (.clk(clk), .rst(rst), .t(t),          .q(q_t));
    jk_ff u_jk (.clk(clk), .rst(rst), .j(j), .k(k),   .q(q_jk));
    sr_ff u_sr (.clk(clk), .rst(rst), .s(s), .r(r),   .q(q_sr));

    always #5 clk = ~clk;   // 100 MHz clock

    // Print outputs just after every rising edge
    always @(posedge clk) begin
        #1 $display("%4t | d=%b t=%b jk=%b%b sr=%b%b | Qd=%b Qt=%b Qjk=%b Qsr=%b",
                    $time, d, t, j, k, s, r, q_d, q_t, q_jk, q_sr);
    end

    initial begin
        $display("time | inputs              | outputs");
        #12 rst = 0;
        // apply new inputs on the falling edge
        @(negedge clk) begin d = 1; t = 1; j = 1; k = 0; s = 1; r = 0; end  // set
        @(negedge clk) begin d = 0; t = 1; j = 0; k = 0; s = 0; r = 0; end  // hold
        @(negedge clk) begin d = 1; t = 0; j = 1; k = 1; s = 0; r = 1; end  // toggle / reset
        @(negedge clk) begin d = 0; t = 1; j = 1; k = 1; s = 0; r = 0; end  // toggle again
        @(negedge clk) begin d = 1; t = 1; j = 0; k = 1; s = 1; r = 0; end  // jk reset
        @(negedge clk);
        $finish;
    end
endmodule
