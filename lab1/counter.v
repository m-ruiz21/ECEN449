`timescale 1ns / 1ps

module counter(
    input BUTTONS[1:0],
    input clk, 
    input rst,
    output reg [3:0] LEDS
    );
    
    always @(posedge clk or posedge rst) begin 
        if (rst)
            LEDS <= 2'b0;
        else if (BUTTONS == 2'b01)
            LEDS <= LEDS + 4'b1;
        else if (BUTTONS == 2'b10)
            LEDS <= LEDS - 4'b1;
    end
endmodule
