`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 02:17:11 PM
// Design Name: 
// Module Name: 4bit_FA
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


module 4bit_FA(
    input a,
    input b,
    input c_in,
    output c_out,
    output sum
    );
    
    wire fa1_cout, fa2_cout, fa3_cout; 
    
    genvar i; 
    generate
    for(i=0; i<4; i=i+1)
        begin 
            Add_Full_FA_1bit(sum[i], c[i+1], a[i], b[i], c[i])
        end
    endgenerate 
    
    assign c[0] = c_in; 
    assign c_out = c[4];   
    
endmodule
