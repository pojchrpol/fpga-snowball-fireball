`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 02:36:57 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(input basys_clock, input [31:0] value_m, output reg new_clock = 0);
    reg [31:0] count = 32'd0;
    
    always @ (posedge basys_clock)
    begin
        count <= (count == value_m) ? 0 : count + 1;
        new_clock <= (count == 0) ? ~new_clock :  new_clock;
    end
endmodule
