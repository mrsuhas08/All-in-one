`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 15:20:28
// Design Name: 
// Module Name: spi_ttb
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


module spi_ttb();
    parameter a_width=16,d_width=8;
    reg clk,rst,start;
    reg [1:0]r_w;
    reg [d_width-1:0]w_data;
    reg [a_width-1:0]w_addr,r_addr;
    wire [d_width-1:0]r_data;
    wire sclk_w,cs_w,sdio_w;
    
    spi_t dut(clk,rst,start,r_w,w_addr,w_data,r_addr,r_data,sclk_w,cs_w,sdio_w);
    
    always #10 clk=~clk;
    
    initial begin
        {clk,start,w_data,w_addr,r_addr}=0;
        {rst}=1;
        #20 rst=0;
        #10 start=1;
             r_w='b00;
                w_addr='hfffe;
                w_data='hfe;
        #5330 r_w='b01;
                r_addr='hfffe;
        #5400 r_w='b00;        
                w_addr='hfffd;
                w_data='hfd;
        #5200 r_w='b01;
                r_addr='hfffd;
        #5400 r_w='b00;
                w_addr='hfffc;
                w_data='hfc;
        #5200 r_w='b01;
                r_addr='hfffc;
                        
        #10000 $finish;
    
    end
    
    initial $monitor("time= %0d,clk= %0xb,rst= %0xb,start= %0xb,r_w= %0xb,w_addr= %0xh,w_data= %0xh,r_addr= %0xh,r_data= %0xh,sclk_w= %0xb,cs_w= %0xb,sdio_w= %0xb"
                     ,$time,clk,rst,start,r_w,w_addr,w_data,r_addr,r_data,sclk_w,cs_w,sdio_w);

endmodule
