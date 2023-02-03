`timescale 1ns / 1ps

module counter(
    input BUTTON0,
    input BUTTON1,
    input clk, 
    input rst,
    output reg [3:0] LEDS
    );
    
    reg [26:0] counter = 26'b0;
    always @(posedge clk) begin
        if (rst)
            LEDS <= 4'b0;
        if (counter >= 125000000) begin
            counter <= 0;
            if (BUTTON0)
                LEDS <= LEDS + 4'b1;
            else if (BUTTON1)
                LEDS <= LEDS - 4'b1;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
