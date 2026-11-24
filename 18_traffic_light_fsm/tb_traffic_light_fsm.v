`timescale 1ns / 1ps
module tb_traffic_light_fsm;
    reg clk = 0, rst = 1;
    wire [2:0] main_light, side_light;

    traffic_light_fsm uut (
        .clk(clk), .rst(rst),
        .main_light(main_light), .side_light(side_light)
    );

    always #5 clk = ~clk;

    // Decode {red, yellow, green} into a letter
    function [8*3-1:0] light_name(input [2:0] l);
        begin
            case (l)
                3'b001:  light_name = "GRN";
                3'b010:  light_name = "YEL";
                3'b100:  light_name = "RED";
                default: light_name = "???";
            endcase
        end
    endfunction

    always @(posedge clk)
        #1 $display("%4t | main=%s side=%s",
                    $time, light_name(main_light), light_name(side_light));

    initial begin
        $display("time | main side");
        #12 rst = 0;
        repeat (28) @(negedge clk);   // watch two full cycles
        $finish;
    end
endmodule
