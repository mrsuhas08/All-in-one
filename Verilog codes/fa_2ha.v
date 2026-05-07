`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 09:38:19
// Design Name: 
// Module Name: fa_2ha
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


module fa_2ha(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    
    wire s1,c1,c2;
    
    ha f1(a,b,s1,c1);
    ha f2(s1,cin,sum,c2);
    
    assign cout=c1|c2;

endmodule
