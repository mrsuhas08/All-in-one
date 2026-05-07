`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 09:30:13
// Design Name: 
// Module Name: fa_tb
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


module fa_tb;
    reg a,b,cin;
    wire sum,cout;
    
//    fa dut(a,b,cin,sum,cout);
    fa_2ha dut(a,b,cin,sum,cout);    
    
    initial begin
        {a,b,cin}=0;
        #10 a=0;b=0;cin=1;
        #10 a=0;b=1;cin=0;
        #10 a=0;b=1;cin=1;
        #10 a=1;b=0;cin=0;
        #10 a=1;b=0;cin=1;
        #10 a=1;b=1;cin=0;
        #10 a=1;b=1;cin=1;
        #10 $finish;
    end

endmodule
