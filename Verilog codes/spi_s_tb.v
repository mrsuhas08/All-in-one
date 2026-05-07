`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 16:02:17
// Design Name: 
// Module Name: spi_s_tb
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


module spi_s_tb();
    parameter d_width=16,a_width=8;
    reg rst,sclk,cs;
    wire sdio;
    
    wire sdi;
    reg sdo;
    reg drive;
    
    assign sdio=drive?sdo:1'bz;
    assign sdi=sdio;
    
    spi_s dut(rst,sclk,cs,sdio);
    
    always #5 sclk = ~sclk;
    
    initial begin
        sclk=0;
        cs=1;
        rst=1;
        drive=0;
        #10 rst=0;
        #10 cs=0;drive=1;
        sdo='b010101011101010111010101110101011;
        #500 drive=1;
        #500 $finish;
        
    end
    
endmodule
