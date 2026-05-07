`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 11:18:55
// Design Name: 
// Module Name: en4_1_tb
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


module en4_1_tb;
    reg [3:0]a;
    wire [1:0]y;
    
    en4_1 dut(a,y);
    
    initial begin
        a=1;
        #10 a=2;
        #10 a=4;
        #10 a=8;
        #10 $finish;
    end

endmodule
