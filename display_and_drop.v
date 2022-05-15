`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:43:04 11/11/2021 
// Design Name: 
// Module Name:    display_and_drop 
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
module display_and_drop(
	output   [6 : 0]   seven_seg1, 
   output   [6 : 0]   seven_seg2,
   output   [6 : 0]   seven_seg3,
   output   [6 : 0]   seven_seg4,
   output   [0 : 0]   drop_activated,
   input    [15: 0]   t_act,
   input    [15: 0]   t_lim,
   input              drop_en);
	
	reg [6:0] seg1;
	reg [6:0] seg2;
	reg [6:0] seg3;
	reg [6:0] seg4;
	
	reg [0:0] drop_act;
	reg [7:0] parte_intreaga1;
	reg [7:0] parte_intreaga2;
	reg [7:0] parte_fract1;
	reg [7:0] parte_fract2;
	reg verif;
	
	always@(*) begin
		verif = 0;
		parte_intreaga1 ={t_act[15],t_act[14],t_act[13],t_act[12],t_act[11],t_act[10],t_act[9],t_act[8]};
		parte_fract1 = {t_act[7],t_act[6],t_act[5],t_act[4],t_act[3],t_act[2],t_act[1],t_act[0]};
		parte_intreaga2 = {t_lim[15],t_lim[14],t_lim[13],t_lim[12],t_lim[11],t_lim[10],t_lim[9],t_lim[8]};
		parte_fract2 = {t_lim[7],t_lim[6],t_lim[5],t_lim[4],t_lim[3],t_lim[2],t_lim[1],t_lim[0]};
			if(parte_intreaga1 < parte_intreaga2) begin
				verif = 1;
			end
			if(parte_intreaga1 == parte_intreaga2) begin
				if(parte_fract1 < parte_fract2) begin
					verif = 1;
				end
			end
				if(drop_en == 0) begin
					seg1 = 7'b011_1001;
					seg2 = 7'b101_1100;
					seg3 = 7'b011_1000;
					seg4 = 7'b101_1110;
					drop_act = 0;
				end
				if(verif == 1 && drop_en == 1) begin
					seg1 = 7'b101_1110;
					seg2 = 7'b101_0000;
					seg3 = 7'b101_1100;
					seg4 = 7'b111_0011;
					drop_act = 1;
				end
				if(drop_en == 1 && verif == 0) begin
					seg1 = 7'b000_0000;
					seg2 = 7'b111_0110;
					seg3 = 7'b101_1100;
					seg4 = 7'b111_1000;
					drop_act = 0;
				end
	end
	assign seven_seg1 = seg1;
	assign seven_seg2 = seg2;
	assign seven_seg3 = seg3;
	assign seven_seg4 = seg4;
	assign drop_activated = drop_act;
endmodule
