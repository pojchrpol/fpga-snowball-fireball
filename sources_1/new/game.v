`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 11:03:30 AM
// Design Name: 
// Module Name: game
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


module game(input clk, win, bouncy_clk, cooldown, [1:0] life, [2:0] cd_cnt,
                    [6:0] char_x, fire1_x, fire2_x, fire3_x, fire4_x,
                    [5:0] char_y, fire1_y, fire2_y, fire3_y, fire4_y,
                    [6:0] x, [5:0] y,
                    output reg [15:0] pixel_data);
    parameter hcen = 30;
    parameter xcen = 50;
    parameter ncen = 70;
    parameter red = 16'hF800;
    always @ (posedge clk) begin         
        //snowball
        if   (x == char_x      &&  y == char_y) pixel_data <= 16'h001F;
        else if ((x <= char_x + 2) && (x >= char_x - 2) && (y <= char_y + 2) && (y >= char_y - 2) & cd_cnt[1] != 1)
        pixel_data <= 16'h0FFF;
                  
        //border
        else if (x < 2 || x > 93 || y == 12 || y < 2  || y > 61) pixel_data <= 16'hCAA0;
       
 
         //fireball 1
         else if   (x == fire1_x      &&  y == fire1_y) pixel_data <= 16'hF800;
         else if (((x == fire1_x - 1) && (y == fire1_y - 1)) || ((x == fire1_x - 1) && (y == fire1_y + 1))
               || ((x == fire1_x)     && (y == fire1_y - 1)) || ((x == fire1_x)     && (y == fire1_y + 1))
               || ((x == fire1_x + 1) && (y == fire1_y - 1)) || ((x == fire1_x + 1) && (y == fire1_y + 1))
               || ((x == fire1_x + 1) && (y == fire1_y))     || ((x == fire1_x - 1) && (y == fire1_y)))
                    pixel_data <= 16'hFE40;
                    
         //fireball2
         else if   (x == fire2_x      &&  y == fire2_y) pixel_data <= 16'hF800;
         else if (((x == fire2_x - 1) && (y == fire2_y - 1)) || ((x == fire2_x - 1) && (y == fire2_y + 1))
               || ((x == fire2_x)     && (y == fire2_y - 1)) || ((x == fire2_x)     && (y == fire2_y + 1))
               || ((x == fire2_x + 1) && (y == fire2_y - 1)) || ((x == fire2_x + 1) && (y == fire2_y + 1))
               || ((x == fire2_x + 1) && (y == fire2_y))     || ((x == fire2_x - 1) && (y == fire2_y)))
                    pixel_data <= 16'hFE40;
                    
         //fireball3
         else if   (x == fire3_x      &&  y == fire3_y) pixel_data <= 16'hF800;
         else if (((x == fire3_x - 1) && (y == fire3_y - 1)) || ((x == fire3_x - 1) && (y == fire3_y + 1))
               || ((x == fire3_x)     && (y == fire3_y - 1)) || ((x == fire3_x)     && (y == fire3_y + 1))
               || ((x == fire3_x + 1) && (y == fire3_y - 1)) || ((x == fire3_x + 1) && (y == fire3_y + 1))
               || ((x == fire3_x + 1) && (y == fire3_y))     || ((x == fire3_x - 1) && (y == fire3_y)))
                    pixel_data <= 16'hFE40;
                    
         //fireball4
         else if   (x == fire4_x      &&  y == fire4_y) pixel_data <= 16'hF800;
         else if (((x == fire4_x - 1) && (y == fire4_y - 1)) || ((x == fire4_x - 1) && (y == fire4_y + 1))
               || ((x == fire4_x)     && (y == fire4_y - 1)) || ((x == fire4_x)     && (y == fire4_y + 1))
               || ((x == fire4_x + 1) && (y == fire4_y - 1)) || ((x == fire4_x + 1) && (y == fire4_y + 1))
               || ((x == fire4_x + 1) && (y == fire4_y))     || ((x == fire4_x - 1) && (y == fire4_y)))
                    pixel_data <= 16'hFE40;
         
         //path
         else if (y == 13 && (x >= 2  && x <  23)) pixel_data <= 16'h001F;
         else if (y == 29 && (x >= 23 && x <  47)) pixel_data <= 16'h001F;
         else if (y == 45 && (x >= 47 && x <  71)) pixel_data <= 16'h001F;
         else if (y == 61 && (x >= 71 && x < 94)) pixel_data <= 16'h001F;
         
         else if (x == 23 && (y >= 13 && y <  29)) pixel_data <= 16'h001F;
         else if (x == 47 && (y >= 29 && y <  45)) pixel_data <= 16'h001F;
         else if (x == 71 && (y >= 45 && y <  61)) pixel_data <= 16'h001F;
         
         //heart
         else if (y == 4  && (x == hcen - 2 || x == hcen + 2)) pixel_data <= 16'hF800;
         else if (y == 5  && (x >= hcen - 3 && x <= hcen + 3 && x != hcen)) pixel_data <= 16'hF800;
         else if (y == 6  && (x >= hcen - 3 && x <= hcen + 3 && x != hcen)) pixel_data <= 16'hF800;
         else if (y == 7  && (x >= hcen - 3 && x <= hcen + 3)) pixel_data <= 16'hF800;
         else if (y == 8  && (x >= hcen - 2 && x <= hcen + 2)) pixel_data <= 16'hF800;
         else if (y == 9  && (x >= hcen - 1 && x <= hcen + 1)) pixel_data <= 16'hF800;
         else if (y == 10 && (x == hcen)) pixel_data <= 16'hF800;
         else pixel_data <= 0;
         
         //win
         if (win) begin
         if (y == 4  && (x == xcen - 2 || x == xcen + 2)) pixel_data <= 16'hF800;
         else if (y == 5  && (x >= xcen - 3 && x <= xcen + 3 && x != xcen)) pixel_data <= 16'hF800;
         else if (y == 6  && (x >= xcen - 3 && x <= xcen + 3 && x != xcen)) pixel_data <= 16'hF800;
         else if (y == 7  && (x >= xcen - 3 && x <= xcen + 3)) pixel_data <= 16'hF800;
         else if (y == 8  && (x >= xcen - 2 && x <= xcen + 2)) pixel_data <= 16'hF800;
         else if (y == 9  && (x >= xcen - 1 && x <= xcen + 1)) pixel_data <= 16'hF800;
         else if (y == 10 && (x == xcen)) pixel_data <= 16'hF800;
         
         else if (y == 4  && (x == ncen - 2 || x == ncen + 2)) pixel_data <= 16'hF800;
         else if (y == 5  && (x >= ncen - 3 && x <= ncen + 3 && x != ncen)) pixel_data <= 16'hF800;
         else if (y == 6  && (x >= ncen - 3 && x <= ncen + 3 && x != ncen)) pixel_data <= 16'hF800;
         else if (y == 7  && (x >= ncen - 3 && x <= ncen + 3)) pixel_data <= 16'hF800;
         else if (y == 8  && (x >= ncen - 2 && x <= ncen + 2)) pixel_data <= 16'hF800;
         else if (y == 9  && (x >= ncen - 1 && x <= ncen + 1)) pixel_data <= 16'hF800;
         else if (y == 10 && (x == ncen)) pixel_data <= 16'hF800;
         end

         //life
         else begin 

         //cross
         if (y == 5  && (x == xcen - 2 || x == xcen + 2)) pixel_data <= 16'hF800;
         else if (y == 6  && (x == xcen - 1 || x == xcen + 1)) pixel_data <= 16'hF800;
         else if (y == 7  && (x == xcen                     )) pixel_data <= 16'hF800;
         else if (y == 8  && (x == xcen - 1 || x == xcen + 1)) pixel_data <= 16'hF800;
         else if (y == 9  && (x == xcen - 2 || x == xcen + 2)) pixel_data <= 16'hF800;
         else if (y > 1 && y < 12 && x < ncen - 2 && x > ncen + 2) pixel_data <= 16'hFD63;
         
         case(life)
            3: begin
                if (y == 3  && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 4  && (x == ncen - 2 || x == ncen - 1 || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 5  && (x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 6  && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 7  && (x == ncen - 1 || x == ncen     || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 8  && (x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 9  && (x == ncen - 2 || x == ncen - 1 || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 10 && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800; 
                else if (y > 1 && y < 12 && x >= ncen - 2 && x <= ncen + 2) pixel_data <= 16'h0000; end
            2: begin
                if (y == 3  && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 4  && (x == ncen - 2 || x == ncen - 1 || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 5  && (x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 6  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 7  && (x == ncen - 1 || x == ncen    )) pixel_data <= 16'hF800;
                else if (y == 8  && (x == ncen - 1 || x == ncen    )) pixel_data <= 16'hF800;
                else if (y == 9  && (x == ncen - 2 || x == ncen - 1)) pixel_data <= 16'hF800;
                else if (y == 10 && (x == ncen - 2 || x == ncen - 1 || x == ncen || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800; 
                else if (y > 1 && y < 12 && x >= ncen - 2 && x <= ncen + 2) pixel_data <= 16'h0000; end
             1: begin
                if (y == 3  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 4  && (x == ncen - 1 || x == ncen    || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 5  && (x == ncen - 2 || x == ncen    || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 6  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 7  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 8  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 9  && (x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 10 && (x == ncen - 2 || x == ncen - 1 || x == ncen || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800; 
                else if (y > 1 && y < 12 && x >= ncen - 2 && x <= ncen + 2) pixel_data <= 16'h0000; end
             0: begin
                if (y == 3  && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800;
                else if (y == 4  && (x == ncen - 2 || x == ncen - 1 || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 5  && (x == ncen - 2 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 6  && (x == ncen - 2 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 7  && (x == ncen - 2 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 8  && (x == ncen - 2 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 9  && (x == ncen - 2 || x == ncen - 1 || x == ncen + 1 || x == ncen + 2)) pixel_data <= 16'hF800;
                else if (y == 10 && (x == ncen - 1 || x == ncen     || x == ncen + 1)) pixel_data <= 16'hF800; 
                else if (y > 1 && y < 12 && x >= ncen - 2 && x <= ncen + 2) pixel_data <= 16'h0000; end
         endcase
         end
    end
endmodule
