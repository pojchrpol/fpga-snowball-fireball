`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 01:54:36 AM
// Design Name: 
// Module Name: bar_position
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bar_position(input clk, clr, bL, bR, output reg [6:0] bar_pos = 43);
    always @(posedge clk) begin
        bar_pos <= (clr) ? 43 :
                    (bL && bar_pos > 19) ? bar_pos - 2 :
                    (bR && bar_pos < 67) ? bar_pos + 2 :
                    bar_pos;
    end
endmodule
