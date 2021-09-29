`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 02:58:49 PM
// Design Name: 
// Module Name: voltrob0_disp
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

module voltorb_disp(input clk, [6:0] x, [5:0] y, output reg [15:0] pixel_data);
    parameter white = 16'hFFFF;
    parameter red = 16'hF100;
    parameter black  = 16'h0000;
    parameter grey = 16'h8410;
    parameter xcen  = 40; parameter ycen = 20;
    reg [6:0] p; reg [6:0] q;
    always @(posedge clk) begin
        p = x - xcen;
        q = y - ycen;
        case (q)
        1: begin
        if (p>=10 && p<=16)  pixel_data <= red;
        else pixel_data <= black;
        end
        
        2: begin
        if (p>=13 && p <=14) pixel_data <= white;
        else if (p>=8 && p <=12) pixel_data <= red;
        else if  (p <= 18  && p>=15) pixel_data <= red;
        else pixel_data <= black;
        end
        
        3: begin
        if (p >=6 && p <=11) pixel_data <= red;
        else if (p <=13 && p >=12) pixel_data <= white;
        else if (p<=17 && p >= 16 ) pixel_data <= black;
        else if (p >=14 && p <=15) pixel_data <= red;
        else if (p >=18 && p <=20) pixel_data <= red;
        else pixel_data <= black;
        end
        
        4: begin
        if (p >=19 && p <=21) pixel_data <= red;
        else if (p <=17 && p >= 18) pixel_data <= white;
        else if (p >=15 && p <=16) pixel_data <= black;
        else if ( p ==6 && p ==11) pixel_data <= black;
        else if (p==5) pixel_data <= red;
        else if (p==12) pixel_data <=white;
        else if (p>=7 && p <= 10) pixel_data <= red;
        else if (p>=13 && p <= 14) pixel_data <= red;
        else pixel_data <=black;
        end
        
        5: begin
        if (p >=8 && p<=10) pixel_data <=red;
        else if (p >=20 && p<=22) pixel_data <=red;
        else if (p <=6 && p >= 5) pixel_data <= white;
        else if (p <=19 && p >= 16) pixel_data <= white;
        else if (p >=13 && p <=15) pixel_data <= black;
        else if ( p ==7 && p ==11) pixel_data <= black;
        else if (p==4 && p==12) pixel_data <= red;
        else pixel_data <=black;
        end
        
        6: begin
        if (p >=9 && p<=11) pixel_data <=red;
        else if (p==4 && p==13) pixel_data <= red;
        else if (p >=20 && p<=22) pixel_data <=red;
        else if (p <=19 && p >= 16) pixel_data <= white;
        else if ( p ==5 && p==7 && p==14) pixel_data <= white;
        else pixel_data <=black;
        end
        
        7: begin
        if (p ==3) pixel_data <=red;
        else if (p <=5 && p >= 4) pixel_data <= white;
        else if (p ==7) pixel_data <=white;
        else if (p >=8 && p<=13) pixel_data <=red;
        else if (p >=19 && p<=23) pixel_data <=red;
        else pixel_data <= black;
        end
        
        8: begin
        if (p ==3) pixel_data <=red;
        else if (p >=8 && p<=23) pixel_data <=red;
        else pixel_data <= black;
        end
        
        9: begin
        if (p >=2 && p<=8) pixel_data <=red;
        else if (p >=14 && p<=24) pixel_data <=red;
        else pixel_data <= black;
        end
        
        10: begin
        if (p >=2 && p<=5) pixel_data <=red;
        else if (p >=18 && p<=24) pixel_data <=red;
        else if (p ==8 && p==14)pixel_data <=grey ;
        else if (p >=9 && p<=13)pixel_data <=white;
        else pixel_data <= black;
        end
        
        11: begin
        if (p==2 )pixel_data <=red;
        else if (p ==5)pixel_data <=grey ;
        else if (p >=16 && p<=18) pixel_data <=grey;
        else if (p >=6 && p<=15)pixel_data <=white;
        else if (p >=22 && p<=24) pixel_data <=red;
        else pixel_data <= black;
        end
        
        12: begin
        if (p==24 )pixel_data <=red;
        else if (p >=3 && p<=13)pixel_data <=white;
        else if (p >=14 && p<=21) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        13: begin
        if (p==2 )pixel_data <= grey ;
        else if (p >=3 && p<=11)pixel_data <=white;
        else if (p >=12 && p<=23) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        14: begin
        if (p >=2 && p <=10) pixel_data <=white;
        else if (p >=11 && p<=23) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        15: begin
        if (p >=2 && p <=9) pixel_data <=white;
        else if (p >=10 && p<=23) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        16: begin
        if (p >=3 && p <=8) pixel_data <=white;
        else if (p >=9 && p<=22) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        17: begin
        if (p >=3 && p <=8) pixel_data <=white;
        else if (p >=9 && p<=22) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        18: begin
        if (p >=4 && p <=7) pixel_data <=white;
        else if (p >=8 && p<=21) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        19: begin
        if (p >=4 && p <=7) pixel_data <=white;
        else if (p >=8 && p<=21) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        20: begin
        if (p >=4 && p <=7) pixel_data <=white;
        else if (p >=8 && p<=21) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        21: begin
        if (p >=5 && p <=7) pixel_data <=white;
        else if (p >=8 && p<=10) pixel_data <=grey;
        else if (p >=16 && p<=21) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        22: begin
        if (p >=5 && p <=7) pixel_data <=white;
        else if (p >=8 && p<=9) pixel_data <=grey;
        else if (p >=11 && p<=15) pixel_data <=grey;
        else if (p >=17 && p<=20) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        23: begin
        if (p >=8 && p <=15) pixel_data <=grey;
        else if (p >=17 && p<=18) pixel_data <=grey;
        else pixel_data <= black;
        end
        
        24: begin
        if (p==10 && p ==16 )pixel_data <= grey ;
        else pixel_data <= black;
        end
        default: pixel_data <= black;
        endcase
    end
endmodule