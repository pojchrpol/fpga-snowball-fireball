`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 04:26:00 PM
// Design Name: 
// Module Name: pixel_x_y
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


module pixel_x_y(input [12:0] pixel_index, output [6:0] pixel_x, output [5:0] pixel_y);
    assign pixel_x = (pixel_index) % 96;
    assign pixel_y = (pixel_index - pixel_x) / 96;
endmodule
