`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 04:50:56 PM
// Design Name: 
// Module Name: bouncy
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


module bouncy(input clk, clr, [6:0] start_x, [5:0] start_y, [1:0] start_dir,
                output reg [6:0] bouncy_x, reg [5:0] bouncy_y);
    reg [1:0] dir = 2'b10;
    always @ (posedge clk) begin
        if (clr) begin bouncy_x = start_x; bouncy_y = start_y; dir = start_dir; end
        else begin case(dir)
            2'b00: begin bouncy_x = bouncy_x - 1; bouncy_y = bouncy_y + 1; end
            2'b01: begin bouncy_x = bouncy_x - 1; bouncy_y = bouncy_y - 1; end
            2'b10: begin bouncy_x = bouncy_x + 1; bouncy_y = bouncy_y + 1; end
            2'b11: begin bouncy_x = bouncy_x + 1; bouncy_y = bouncy_y - 1; end
        endcase end
        
        if (bouncy_x == 3 || bouncy_x == 92) dir[1] <= ~dir[1];
        if (bouncy_y == 14 || bouncy_y == 60) dir[0] <= ~dir[0];
    end
endmodule
