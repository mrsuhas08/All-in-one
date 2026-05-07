`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 15:18:04
// Design Name: 
// Module Name: spi_mt
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


module spi_mt #(parameter a_width=16,d_width=8)(clk,rst,start,r_w,w_addr,w_data,r_addr,r_data,sclk,cs,sdio);
    input clk,rst,start;
    input [1:0]r_w;
    input [a_width-1:0]w_addr,r_addr;
    input [d_width-1:0]w_data;
    output reg [d_width-1:0]r_data;
    output reg sclk,cs;
    inout sdio;
    
    reg [a_width-1:0]a_shift;
    reg [d_width-1:0]d_shift;
    reg [a_width-1:0]count;
    
    reg [2:0]state;
    
    localparam idle=0,
               wr_inst=1,
               rd_inst=2,
               wr_addr=3,
               wr_data=4,
               rd_wait=6,
               rd_data=5;
               
    reg drive,sdo;
    reg [1:0]inst;
    reg [3:0]div;
    wire sdi;
    
    assign sdio=drive?sdo:1'bz;
    assign sdi=sdio;
    
    reg sck;
    wire pedge;
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            div<=0;
        else begin
            if(div<9)
                div<=div+1;
            else
                div<=0;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            sclk <= 0;
        else if(cs) begin
            sclk<=0;
        end
        else begin
            if (div < 5)
                sclk <= 0;
            else
                sclk <= 1;
        end
    end
    
    always @(posedge clk)begin
        sck<=sclk;
    end
    
    assign pedge=sclk&~sck;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            count<=0;
            a_shift<=0;
            d_shift<=0;
            sck<=0;
            sclk<=0;
            div<=0;
            cs<=1;
            drive<=0;
            sdo<=0;
            r_data<=0;
            state<=idle;                        
        end
        else begin
            case (state)
                idle:begin
                    cs<=1;
                    drive<=0;
                    count<=0;
                    d_shift<=0;
                    
                    if(start) begin
                        cs<=0;
                        drive<=1;
                        count<=0;
                        if(r_w==2'b00)begin
                            inst<=r_w;
                            a_shift<=w_addr;
                            state<=wr_inst;
                        end
                        if(r_w==2'b01)begin
                            inst<=r_w;
                            a_shift<=r_addr;
                            state<=rd_inst;
                        end
                    end
                end
                
//                rd_wait:begin
//                    if(pedge)begin
//                        state<=rd_inst;
//                    end
//                end
                                
                wr_inst:begin
                    if(pedge)begin
                        sdo<=inst[1];
                        inst<={inst[0],1'b0};
                        count<=count+1;
                        if(count==1)begin
                            count<=a_width;
                            state<=wr_addr;
                        end
                    end
                end
                
                rd_inst:begin
                    if(pedge)begin
                        sdo<=inst[1];
                        inst<={inst[0],1'b0};
                        count<=count+1;
                        if(count==1)begin
                            count<=a_width;
                            state<=wr_addr;
                        end
                    end
                end
                
                wr_addr: begin
                    if(pedge) begin
                        sdo<=a_shift[a_width-1];
                        a_shift<={a_shift[a_width-2:0],1'b0};
                        count<=count-1;
                        if(count==0 && r_w=='b01)begin
                            d_shift<=0;
//                            drive<=0;
                            count<=d_width;
                            state<=rd_data;
                        end
                        if(count==1 && r_w=='b00)begin
                            d_shift<=w_data;
                            count<=d_width;
                            state<=wr_data;
                        end
                    end
                end
                
                wr_data: begin
                    if(pedge) begin
                        sdo<=d_shift[d_width-1];
                        d_shift<={d_shift[d_width-2:0],1'b0};
                        count<=count-1;                        
                        if(count==0)begin
                            count<=0;
                            cs<=1;
                            sclk<=0;
                            drive<=0;
                            state<=idle;
                        end
                    end
                end
                
                rd_data:begin
                    drive<=0;
                    if(pedge)begin
                        d_shift<={d_shift[d_width-2:0],sdi};
                        count<=count-1;
                            
                        if(count==0)begin
                            r_data<=d_shift;
                            count<=0;
                            cs<=1;
                            sclk<=0;
                            drive<=0;
                            state<=idle;
                        end
                    end
                end
                default:state<=idle;
            endcase
        end  
    end
endmodule