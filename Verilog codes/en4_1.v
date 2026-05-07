`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 11:01:08
// Design Name: 
// Module Name: en4_1
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


module en4_1(a,y);
    input [3:0]a;
    output [1:0]y;
    
    assign y[0]=a[1]|a[3];
    assign y[1]=a[2]|a[3];
    
endmodule
