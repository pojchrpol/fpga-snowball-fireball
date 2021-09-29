`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 11:25:02 AM
// Design Name: 
// Module Name: char_walk
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


module char_walk(input clk, btnD, btnR, clr, [2:0] cd_cnt,
                    output reg win = 0, reg [6:0] x = 2, reg [5:0] y = 13);
    reg [2:0] state = 0;
    always @ (*) begin
        state[0] = (x == 23 && y < 29) | (x == 47 && y < 45) | (x == 71 && y < 61);
        state[1] = (y >= 31 && y < 47) | (y == 61);
        state[2] = (y >= 47);      
    end
    always @ (posedge clk) begin
        if (clr) begin x <= 2; y <= 13; end
        else if (cd_cnt != 0) begin x <= 2; y <= 13; end
        else if (win) begin x <= 92; y <= 61; end
        else begin case(state[0]) 
            0: x <= (btnR) ? x + 1 : x;
            1: y <= (btnD) ? y + 1 : y;
        endcase end
        win <= (clr) ? 0 : (x == 92 && y == 61) ? 1 : win;
    end
endmodule
