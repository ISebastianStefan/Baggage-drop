`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:41 11/11/2021 
// Design Name: 
// Module Name:    square_root 
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
module square_root(
   output [15:0] out,
   input  [7:0] in);

   integer i;
   reg [7:0] base;
   reg [15:0] y; 
   reg [31:0] Y;
   reg [15:0] in_new;

	always@(*) begin
		base = 128;
      y = 0;
      for(i = 0; i < 8; i = i + 1) begin 
			y = y + base;
			if((y*y) > in) begin
				y = y - base;
         end
				base = base >> 1;
		end
		y = y << 8; 	  
		base = 128;
		in_new = in << 8;
		i = 0;
		while(i < 8) begin
			y = y + base;
			Y = y*y >> 8;
			if(Y >= in_new) begin
				y = y - base;   
			end
				base = base >> 1;
				i = i + 1;
		end	    	  
	end 
	assign out = { y[15], y[14], y[13], y[12], y[11], y[10], y[9], y[8], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]};
endmodule
