`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:03 11/12/2021 
// Design Name: 
// Module Name:    baggage_drop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module baggage_drop(
	output   [6 : 0]   seven_seg1, 
   output   [6 : 0]   seven_seg2,
   output   [6 : 0]   seven_seg3,
   output   [6 : 0]   seven_seg4,
   output   [0 : 0]   drop_activated,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4,
   input    [15: 0]   t_lim,
	input              drop_en);

	wire [7:0] height;
	wire [15:0] t_act;
	wire [15:0] var;
	sensors_input sens_in(height, sensor1, sensor2, sensor3, sensor4);
	square_root sqrt(t_act, height);
	assign var=t_act/2;
	display_and_drop disp_and_drop(seven_seg1, seven_seg2, seven_seg3, seven_seg4, drop_activated, var, t_lim, drop_en);
endmodule
