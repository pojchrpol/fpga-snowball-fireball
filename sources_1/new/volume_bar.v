`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 01:24:07 AM
// Design Name: 
// Module Name: volume_bar
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


module volume_bar(input clk, [1:0] border, [1:0] bar, [6:0] bar_pos,
                    [6:0] pixel_x, [5:0] pixel_y, [3:0] vol,
                    output reg [15:0] pixel_data);
    always @(posedge clk) begin
        //border
        if (pixel_x < 1 || pixel_x > 94 || pixel_y < 1 || pixel_y > 62) pixel_data <= (border == 0) ? 16'h0000 : 16'hFFFF;
        else if (pixel_x < 3 || pixel_x > 92 || pixel_y < 3 || pixel_y > 60) pixel_data <= (border == 2) ? 16'hFFFF : 16'h0000;
        
        //volume bar
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 12 && pixel_y > 9  && vol == 15) pixel_data <= (bar == 2) ? 16'h01EF : (bar) ? 16'hF800 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 15 && pixel_y > 12 && vol >= 14) pixel_data <= (bar == 2) ? 16'h01EF : (bar) ? 16'hF800 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 18 && pixel_y > 15 && vol >= 13) pixel_data <= (bar == 2) ? 16'h01EF : (bar) ? 16'hF800 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 21 && pixel_y > 18 && vol >= 12) pixel_data <= (bar == 2) ? 16'h01EF : (bar) ? 16'hF800 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 24 && pixel_y > 21 && vol >= 11) pixel_data <= (bar == 2) ? 16'h01EF : (bar) ? 16'hF800 : 16'h0000;
                                                                                                            
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 7 && pixel_y < 27 && pixel_y > 24 && vol >= 10) pixel_data <= (bar == 2) ? 16'hF9EF : (bar) ? 16'hFFE0 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 27 && pixel_y > 24 && vol >= 10) pixel_data <= (bar == 2) ? 16'hF9EF : (bar == 1) ? 16'hFFE0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 7 && pixel_y < 30 && pixel_y > 27 && vol >=  9) pixel_data <= (bar == 2) ? 16'hF9EF : (bar) ? 16'hFFE0 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 30 && pixel_y > 27 && vol >=  9) pixel_data <= (bar == 2) ? 16'hF9EF : (bar == 1) ? 16'hFFE0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 7 && pixel_y < 33 && pixel_y > 30 && vol >=  8) pixel_data <= (bar == 2) ? 16'hF9EF : (bar) ? 16'hFFE0 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 33 && pixel_y > 30 && vol >=  8) pixel_data <= (bar == 2) ? 16'hF9EF : (bar == 1) ? 16'hFFE0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 7 && pixel_y < 36 && pixel_y > 33 && vol >=  7) pixel_data <= (bar == 2) ? 16'hF9EF : (bar) ? 16'hFFE0 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 36 && pixel_y > 33 && vol >=  7) pixel_data <= (bar == 2) ? 16'hF9EF : (bar == 1) ? 16'hFFE0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 7 && pixel_y < 39 && pixel_y > 36 && vol >=  6) pixel_data <= (bar == 2) ? 16'hF9EF : (bar) ? 16'hFFE0 : 16'h0000;
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 39 && pixel_y > 36 && vol >=  6) pixel_data <= (bar == 2) ? 16'hF9EF : (bar == 1) ? 16'hFFE0 : 16'h0000;
             
                                        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 42 && pixel_y > 39 && vol >=  5) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 42 && pixel_y > 39 && vol >=  5) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
               
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 45 && pixel_y > 42 && vol >=  4) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 45 && pixel_y > 42 && vol >=  4) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 48 && pixel_y > 45 && vol >=  3) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 48 && pixel_y > 45 && vol >=  3) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 51 && pixel_y > 48 && vol >=  2) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 51 && pixel_y > 48 && vol >=  2) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 54 && pixel_y > 51 && vol >=  1) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 54 && pixel_y > 51 && vol >=  1) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
        
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 5 && pixel_y < 57 && pixel_y > 54) pixel_data <= (bar == 2) ? 16'hF800 : (bar) ? 16'h07E0 : 16'h0000;     
        else if (pixel_x > bar_pos && pixel_x < bar_pos + 9 && pixel_y < 57 && pixel_y > 54) pixel_data <= (bar == 2) ? 16'hF800 : (bar == 1) ? 16'h07E0 : 16'h0000;
       
        else pixel_data <= 16'h0000;
    end
endmodule
