`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 10:03:03
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();
    reg a,b,c,d;
    reg [1:0]s;
    wire out;
    
    mux4_1 dut(a,b,c,d,s,out);
    
    initial begin
        {a,b,c,d,s}=0;
        #10 s=0;
            a=0;b=0;c=0;d=0;
        #10 s=1;
            a=0;b=0;c=1;d=1;
        #10 s=2;
            a=1;b=1;c=0;d=0;
        #10 s=3;
            a=1;b=1;c=1;d=1;
        #10 $finish;
    end    

endmodule
