`timescale 1ps / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 14:55:32
// Design Name: 
// Module Name: spi_m_tb
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


module spi_m_tb();
    parameter a_width=16,d_width=8;
    reg clk,rst,start;
    reg [1:0]r_w;
    reg [a_width-1:0]w_addr,r_addr;
    reg [d_width-1:0]w_data;
    wire [d_width-1:0]r_data;
    wire sclk,cs;
    wire sdio;
    
     spi_mt dut1(clk,rst,start,r_w,w_addr,w_data,r_addr,r_data,sclk,cs,sdio);
     
     always #5 clk =~clk;
     
    initial begin
        {clk,start,w_data,w_addr,r_addr}=0;
        {rst}=1;
        #10 rst=0;
        start=1;
             r_w='b00;
                w_addr='hfffe;
                w_data='hfe;
        #540 r_w='b11;
                r_addr='hfffe;
        #540 r_w='b00;        
                w_addr='hfffd;
                w_data='hfd;
        #540 r_w='b11;
                r_addr='hfffd;
        #540 r_w='b00;
                w_addr='hfffc;
                w_data='hfc;
        #540 r_w='b11;
                r_addr='hfffc;
                        
        #1000 $finish;
    
    
     end

endmodule
