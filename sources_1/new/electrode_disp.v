`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 01:44:25 PM
// Design Name: 
// Module Name: voltrob_disp
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


module electrode_disp(input clk, blink_clk, [1:0] state, [6:0] x, [5:0] y, output reg [15:0] pixel_data);
    parameter white = 16'hFFFF;
    parameter red = 16'hF100;
    parameter black  = 16'h0000;
    parameter gray = 16'h8410;
    wire [15:0] yellow = (((state == 2'b01) & blink_clk) | state == 2'b10) ? 16'hFFE0 : 16'h0000;
    parameter xcen  = 40; parameter ycen = 20;
    reg [6:0] p; reg [5:0] q;
    always @ (posedge clk) begin
        p = (x > xcen) ? x - xcen : 0;
        q = (y > ycen) ? y - ycen : 0;
        case (q)
            1: begin
                if (p >= 9 && p <= 16) pixel_data <= white;
                else pixel_data <= yellow;
                end
            2: begin
                if (p >= 7 && p <= 17) pixel_data <= white;
                else if (p == 18) pixel_data <= gray;
                else pixel_data <= yellow;
                end
            3: begin
                if (p >= 5 && p <= 17) pixel_data <= white;
                else if (p>= 18 && p <= 20) pixel_data <= gray;
                else pixel_data <= yellow;
                end
            4: begin
                if (p >= 4 && p <= 17) pixel_data <= white;
                else if (p >= 18 && p <= 21) pixel_data <= gray;
                else pixel_data <= yellow;
                end
            5: begin
                if (p >= 3 && p <= 18) pixel_data <= white;
                else if (p >= 19 && p <= 22) pixel_data <= gray;
                else pixel_data <= yellow;
                end
            6: begin
                if (p >= 3 && p <= 18) pixel_data <= white;
                else if (p >= 19 && p <= 22) pixel_data <= gray;
                else pixel_data <= yellow;
                end
            7: begin
                if ((p >= 3 && p <= 15) || p == 19) pixel_data <= white;
                else if (p >= 20 && p <= 23) pixel_data <= gray;
                else if (p >= 16 && p <= 18) pixel_data <= black;
                else pixel_data <= yellow;
                end
            8: begin
                if (p == 2 || p == 5 || p == 6 || (p >= 8 && p <= 10) || p == 12 || p == 13 ||
                    (p >= 17 && p <= 20)) pixel_data <= white;
                else if (p >= 21 && p <= 23) pixel_data <= gray;
                else if (p <= 1 || p >= 24) pixel_data <= yellow;
                else pixel_data <= black; end
            9: begin
                if ((p >= 1 && p <= 3) || p == 6 || (p >=8 && p <= 10) || p == 12 ||
                    (p >= 15 && p <= 20)) pixel_data <= white;
                else if (p >= 21 && p <= 24) pixel_data <= gray;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;
                end
            10: begin
                if ((p >= 1 && p <= 4) || (p >= 7 && p <= 10) ||(p >= 14 && p <= 19)) pixel_data <= white;
                else if (p >= 20 && p <= 23) pixel_data <= gray;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;
                end
            11: begin
                if ((p >= 1 && p <= 4) || (p >= 6 && p <= 11) ||(p >= 13 && p <= 17)) pixel_data <= white;
                else if (p >= 18  && p <= 22) pixel_data <= gray;
                else if (p == 24) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            12: begin
                if ((p >= 1 && p <= 11) ||(p >= 13 && p <= 17)) pixel_data <= white;
                else if (p >= 18  && p <= 19) pixel_data <= gray;
                else if (p >= 24 && p <= 25) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            13: begin
                if ((p >= 2 && p <= 17)) pixel_data <= white;
                else if (p >= 20 && p <= 24) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            14: begin
                if ((p >= 3 && p <= 14)) pixel_data <= white;
                else if (p == 1 || (p >= 18 && p <= 24)) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            15: begin
                if ((p >= 5 && p <= 12)) pixel_data <= white;
                else if (p == 1 || p == 2 || (p >= 15 && p <= 24)) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            16: begin
                if ((p >= 1 && p <= 4) || (p >= 13 && p <= 16) || (p >= 20 && p <= 24)) pixel_data <= red;
                else if (p <= 0 || p >= 25) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            17: begin
                if ((p >= 18 && p <= 19)) pixel_data <= white;
                else if ((p >= 2 && p <= 13) || (p >= 21 && p <= 23)) pixel_data <= red;
                else if (p == 17) pixel_data <= gray;
                else if (p <= 1 || p >= 24) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            18: begin
                if ((p >= 15 && p <= 16) || (p >= 18 && p <= 19)) pixel_data <= white;
                else if ((p >= 2 && p <= 3) || (p >= 6 && p <= 10) || (p >= 21 && p <= 23)) pixel_data <= red;
                else if (p == 14 || p == 17) pixel_data <= gray;
                else if (p <= 1 || p >= 24) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            19: begin
                if ((p >= 11 && p <= 13) || (p >= 15 && p <= 16) || p == 18) pixel_data <= white;
                else if ((p >= 3 && p <= 4) || (p >= 20 && p <= 22)) pixel_data <= red;
                else if (p == 14 || p == 17) pixel_data <= gray;
                else if (p <= 2 || p >= 23) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            20: begin
                if ((p >= 8 && p <= 13) || (p >= 15 && p <= 16) || p == 18) pixel_data <= white;
                else if ((p >= 3 && p <= 5) || (p >= 20 && p <= 22)) pixel_data <= red;
                else if (p == 14 || p == 17) pixel_data <= gray;
                else if (p <= 2 || p >= 23) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            21: begin
                if ((p >= 10 && p <= 13) || (p >= 15 && p <= 16)) pixel_data <= white;
                else if ((p >= 4 && p <= 7) || (p >= 19 && p <= 21)) pixel_data <= red;
                else if (p == 14 || p == 17) pixel_data <= gray;
                else if (p <= 3 || p >= 22) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            22: begin
                if ((p >= 5 && p <= 9) || (p >= 17 && p <= 20)) pixel_data <= red;
                else if (p <= 4 || p >= 21) pixel_data <= yellow;
                else pixel_data <= black;                 
                end
            23: begin
                if (p >= 7 && p <= 18) pixel_data <= red;
                else pixel_data <= yellow;
                end
            24: begin
                if (p >= 9 && p <= 16) pixel_data <= red;
                else pixel_data <= yellow;
                end                 
            default: pixel_data <= yellow;
        endcase
        
    end
endmodule
