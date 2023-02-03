module jackpot(
    input [3:0] SWITCHES,
    input clk,
    input rst,
    output [3:0] LEDS
    );

    reg[27:0] counter;
    reg[3:0] PREV_SWITCHES;
    reg[3:0] LEDS_TEMP = 4'b0001;

    always @(posedge clk) begin
        if (rst) 
            LEDS_TEMP = 4'b0001;

        if (SWITCHES == LEDS_TEMP && SWITCHES != PREV_SWITCHES)  // if are switches match up (winning) and it wasn't like that previously
            LEDS_TEMP = 4'b1111;

        counter = counter + 1;

        if (counter > 31250000) begin           // period 1/4 sec -> 4 HZ                    
            case(LEDS_TEMP)
                4'b0001: LEDS_TEMP = 4'b0010;   // cycle through 
                4'b0010: LEDS_TEMP = 4'b0100;
                4'b0100: LEDS_TEMP = 4'b1000;
                4'b1000: LEDS_TEMP = 4'b0001;
                4'b1111: LEDS_TEMP = 4'b1111;   // keep it winning if we won
            endcase;

            PREV_SWITCHES = SWITCHES; 
        end
    end

    assign LEDS[3:0] = LEDS_TEMP[3:0];

endmodule
