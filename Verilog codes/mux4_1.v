`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 09:45:12
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(a,b,c,d,s,out);
    input a,b,c,d;
    input [1:0]s;
    output reg out;
    
//    assign out=s[1]?(s[0]?d:c):(s[0]?b:a);
    
    always @ * begin
        case (s)
            0:out<=a;
            1:out<=b;
            2:out<=c;
            3:out<=d;
        endcase
    end
    
endmodule
