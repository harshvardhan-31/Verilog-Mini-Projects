`timescale 1ns / 1ps
// Project 18 : Traffic Light Controller (FSM)
// Controls a main road and a side road.
// Sequence: MAIN_GREEN -> MAIN_YELLOW -> SIDE_GREEN -> SIDE_YELLOW -> repeat.
// Each green lasts 4 clock cycles, each yellow 2 cycles (scaled for simulation).
module traffic_light_fsm (
    input  wire       clk,
    input  wire       rst,
    output reg  [2:0] main_light,  // {red, yellow, green}
    output reg  [2:0] side_light
);
    localparam MAIN_GREEN  = 2'd0,
               MAIN_YELLOW = 2'd1,
               SIDE_GREEN  = 2'd2,
               SIDE_YELLOW = 2'd3;

    localparam GREEN_TIME  = 4,
               YELLOW_TIME = 2;

    reg [1:0] state;
    reg [2:0] timer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= MAIN_GREEN;
            timer <= 3'd0;
        end else begin
            case (state)
                MAIN_GREEN: begin
                    if (timer == GREEN_TIME - 1) begin
                        state <= MAIN_YELLOW;
                        timer <= 3'd0;
                    end else timer <= timer + 3'd1;
                end
                MAIN_YELLOW: begin
                    if (timer == YELLOW_TIME - 1) begin
                        state <= SIDE_GREEN;
                        timer <= 3'd0;
                    end else timer <= timer + 3'd1;
                end
                SIDE_GREEN: begin
                    if (timer == GREEN_TIME - 1) begin
                        state <= SIDE_YELLOW;
                        timer <= 3'd0;
                    end else timer <= timer + 3'd1;
                end
                SIDE_YELLOW: begin
                    if (timer == YELLOW_TIME - 1) begin
                        state <= MAIN_GREEN;
                        timer <= 3'd0;
                    end else timer <= timer + 3'd1;
                end
                default: begin
                    state <= MAIN_GREEN;
                    timer <= 3'd0;
                end
            endcase
        end
    end

    always @(*) begin
        main_light = 3'b100;  // red by default
        side_light = 3'b100;
        case (state)
            MAIN_GREEN:  begin main_light = 3'b001; side_light = 3'b100; end
            MAIN_YELLOW: begin main_light = 3'b010; side_light = 3'b100; end
            SIDE_GREEN:  begin main_light = 3'b100; side_light = 3'b001; end
            SIDE_YELLOW: begin main_light = 3'b100; side_light = 3'b010; end
            default:     begin main_light = 3'b100; side_light = 3'b100; end
        endcase
    end
endmodule
