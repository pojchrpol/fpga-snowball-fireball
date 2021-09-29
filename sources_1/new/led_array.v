`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 08:18:46 PM
// Design Name: 
// Module Name: led_array
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


module led_array(
	input clk,
	input [3:0] truncated_signal,
	output reg [15:0] led
    );
    
    always @  (posedge clk) begin
    	case (truncated_signal) 
    		15:led <= 16'b1111111111111111;
			14:led <= 16'b0111111111111111;
			13:led <= 16'b0011111111111111;
			12:led <= 16'b0001111111111111;
			11:led <= 16'b0000111111111111;
			10:led <= 16'b0000011111111111;
			9:led <= 16'b0000001111111111;
			8:led <= 16'b0000000111111111;
			7:led <= 16'b0000000011111111; 
			6:led <= 16'b0000000001111111;
			5:led <= 16'b0000000000111111;
			4:led <= 16'b0000000000011111;
			3:led <= 16'b0000000000001111;
			2:led <= 16'b0000000000000111;
			1:led <= 16'b0000000000000011;
			0:led <= 16'b0000000000000001;
	endcase

end
    
endmodule
