`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2021 09:13:26 PM
// Design Name: 
// Module Name: life_count
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


module life_count(input clk, clr, [6:0] char_x, fire1_x, fire2_x, fire3_x, fire4_x, 
    [5:0] char_y, fire1_y, fire2_y, fire3_y, fire4_y, output reg [1:0] life = 3, reg [2:0] cd_cnt = 0);
    reg hit = 0, cooldown = 0;
    always @ (posedge clk) begin
        cd_cnt <= (cooldown) ? cd_cnt + 1 : 0;
        cooldown <= (cd_cnt == 3'b111) ? 0 : cooldown;
        hit = (((char_x + 4 > fire1_x) && (fire1_x + 4 > char_x) && (char_y + 4 > fire1_y) && (fire1_y + 4 > char_y)) |
               ((char_x + 4 > fire2_x) && (fire2_x + 4 > char_x) && (char_y + 4 > fire2_y) && (fire2_y + 4 > char_y)) |
               ((char_x + 4 > fire3_x) && (fire3_x + 4 > char_x) && (char_y + 4 > fire3_y) && (fire3_y + 4 > char_y)) |
               ((char_x + 4 > fire4_x) && (fire4_x + 4 > char_x) && (char_y + 4 > fire4_y) && (fire4_y + 4 > char_y))) & ~cooldown;
        if (hit) begin cooldown <= 1; hit <= 0; end
        life <= (clr) ? 3 : (hit) ? life - 1 : life;
    end
endmodule
