`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 10:35:37 PM
// Design Name: 
// Module Name: bar_control
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


module bar_control(input clk, sw_on, bU, bD,
                    output reg [1:0] border = 1, reg [1:0] bar = 1);
    always @ (posedge clk) begin
        if (~sw_on) begin border <= 1; bar <= 1; end
        else begin
            border <= (bU) ? (border == 2) ? 0 : border + 1 : border;
            bar <= (bD) ? bar + 1 : bar;
        end
    end
endmodule
