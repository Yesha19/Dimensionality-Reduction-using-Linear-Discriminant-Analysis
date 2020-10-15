`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:04:09 11/12/2018
// Design Name:   main
// Module Name:   F:/MY STUDIES/AU/Sem 3/LDA/LDAv2/main_tb.v
// Project Name:  LDAv2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [23:0] ans_ev1,ans_ev2,ans_v1x,ans_v2x,ans_v1y,ans_v2y;
	wire [7:0] temp_ev1,temp_ev2,temp_v1x,temp_v2x,temp_v1y,temp_v2y;
	wire sign_ev1,sign_ev2,sign_v1x,sign_v2x,sign_v1y,sign_v2y;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.sign_ev1(sign_ev1),
		.ans_ev1(ans_ev1),
		.temp_ev1(temp_ev1),
		
		.sign_ev2(sign_ev2),
		.ans_ev2(ans_ev2),
		.temp_ev2(temp_ev2),
		
		.sign_v1x(sign_v1x),
		.ans_v1x(ans_v1x),
		.temp_v1x(temp_v1x),
		
		.sign_v2x(sign_v2x),
		.ans_v2x(ans_v2x),
		.temp_v2x(temp_v2x),
		
		.sign_v1y(sign_v1y),
		.ans_v1y(ans_v1y),
		.temp_v1y(temp_v1y),
		
		.sign_v2y(sign_v2y),
		.ans_v2y(ans_v2y),
		.temp_v2y(temp_v2y),

		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

	end
	
   always #5 clk=~clk; 
endmodule

