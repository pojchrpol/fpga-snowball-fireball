`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 06:23:58 PM
// Design Name: 
// Module Name: poke_disp
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


module poke_disp(input [15:0] vt_pixel, [15:0] ele_pixel, [1:0] state, output [15:0] pixel_data);
    assign pixel_data = (state == 2'b00) ? vt_pixel : ele_pixel;    
endmodule
