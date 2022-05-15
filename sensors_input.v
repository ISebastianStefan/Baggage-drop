`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:19 11/11/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(
	output   [7 : 0]   height,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4);
	
	reg [15 : 0] sum ;
	
	// 1 si 3 || 2 si 4
	always@(*) begin
		if(sensor1 == 0 || sensor3 == 0) begin
			sum = (sensor2 + sensor4); //140+139=279
			if(sum[0] == 0) begin
				sum = sum / 2;
			end else //279-impar
				sum = (sum + 1) / 2; //279+1=280/2=140
		end 
		if(sensor2 == 0 || sensor4 == 0) begin
			sum = (sensor1 + sensor3);
			if(sum[0] == 0) begin
				sum = sum / 2;
			end else 
				sum = (sum + 1) / 2;
		end 
		if(sensor1 != 0 && sensor2 != 0 && sensor3 !=0 && sensor4 !=0) begin
			sum = (sensor1 + sensor2 + sensor3 + sensor4); //140+138+139+140=557
			sum = sum / 2; //557/2=278.5
			if(sum[0] == 0) begin //278.5-par => primul if
				sum = sum / 2; //278.5/2=139.25
			end else 
				sum = (sum + 1) / 2; 
		end 
	end
	assign height = { sum[7], sum[6], sum[5], sum[4], sum[3], sum[2], sum[1], sum[0]};
endmodule
