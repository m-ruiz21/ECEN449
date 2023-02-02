module clk_divider(
    input clk_in,
    output reg clk_out
);
    reg [23:0] counter;
    always @(posedge clk_in) begin
        counter <= counter + 1;
        if (counter == 24`b125000000) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end 
    end
endmodule
