`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 09:47:41 PM
// Design Name: 
// Module Name: signal_truncation
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


module signal_truncation(
	input clk,
	input slow_clk,
	input [11:0] mic_in,
	output reg [3:0] truncated_signal
    );
    reg[11:0] temp = 0;
    reg [25:0] COUNT = 0;
    
  
    
    always @(posedge clk) begin
    	COUNT <= (COUNT == 4000) ? 0: COUNT + 1;
    	if (COUNT == 0) begin
    		if (temp < 2300) begin
				truncated_signal <= 0;
			end
			else if (temp < 2375) begin
				truncated_signal <= 1;
			end
			else if (temp < 2450) begin
				truncated_signal <= 2;
			end
			else if (temp < 2525) begin
				truncated_signal <= 3;
			end
			else if (temp < 2600) begin
				truncated_signal <= 4;
			end
			else if (temp < 2675) begin
				truncated_signal <= 5;
			end
			else if (temp < 2750) begin
				truncated_signal <= 6;
			end
			else if (temp < 2825) begin
				truncated_signal <= 7;
			end
			else if (temp < 2900) begin
				truncated_signal <= 8;
			end
			else if (temp < 2975) begin
				truncated_signal <= 9;
			end
			else if (temp < 3050) begin
				truncated_signal <= 10;
			end
			else if (temp < 3125) begin
				truncated_signal <= 11;
			end
			else if (temp < 3200) begin
				truncated_signal <= 12;
			end
			else if (temp < 3275) begin
				truncated_signal <= 13;
			end
			else if (temp < 3350) begin
				truncated_signal <= 14;
			end
			else begin
				truncated_signal <= 15;
			end
    		temp <= 0;
    	end 
    	else begin
    		if (mic_in > temp) begin
    			temp <= mic_in;
    		end
    	end
    end
endmodule

