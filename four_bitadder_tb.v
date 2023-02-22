`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 10:28:58 PM
// Design Name: 
// Module Name: four_bitadder_tb
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

module four_bitadder_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	reg clk;
	// Outputs
	wire c_out;
	wire [3:0] sum;
	wire error_flag;
	wire c_out_verify;
	wire [3:0] sum_verify;

	// Instantiate the Unit Under Test (UUT)
	four_bit_FA uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

// Verification module
    four_bit_FA_Verification Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	

	// Assign Error Flag
	assign error_flag = ((c_out != c_out_verify) || (sum != sum_verify));

	// Verification logic
	always@(posedge clk)
		begin
		if (error_flag == 1'b1)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end

	// Define clk signal for both Verfication and Input signal generation	
	always #5 clk = ~clk;

	

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		
		a = 4'd0;
		b = 4'd0;
		c_in = 1'd0;
	end 

	always@(posedge clk)
		begin
		{c_in, a, b} = {c_in, a, b} + 1'b1; 
		end
	
endmodule