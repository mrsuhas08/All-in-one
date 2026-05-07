`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 16:01:17
// Design Name: 
// Module Name: spi_s
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


module spi_s #(parameter d_width=16, a_width=8)(rst,sclk,cs,sdio);
    input rst,sclk,cs;
    inout sdio;
    
    reg [d_width-1:0]mem[a_width-1:0];
    reg [a_width-1:0]reg_addr;
    
    reg [d_width-1:0]count;
    reg [a_width-1:0]a_shift;
    reg [d_width-1:0]d_shift;
    
    reg [1:0] state;
    
    localparam idle=0,
               write=1,
               read=2;
                                  
    reg r_w,drive,sdo;
    wire sdi;
    
    assign sdio = drive ?sdo:1'bz;
    assign sdi=sdio;
    
    always @(posedge sclk or posedge rst)begin
        if(rst)begin
            count<=0;
            r_w<=0;
            drive<=0;
            sdo<=0;
            a_shift<=0;
            d_shift<=0;
            reg_addr<=0;
            state<=idle;       
        end
        else begin
            if(cs)begin
                state<=idle;
                drive<=0;
                count<=0; 
            end
            else begin
                case (state)
                    idle: begin
                        count<=0;
                        drive<=0;
                        state<=write;
                    end
                    
                    write: begin
                        if(count==0)begin
                            r_w<=sdi;
//                            count<=count+1;
                        end
                        else if(count<=a_width)begin
                            a_shift<={a_shift[a_width-2:0],sdi};
                            count<=count+1;
                                          
                            if(count==a_width)
                                reg_addr<={a_shift[a_width-2:0],sdi};
                        end        
                        else begin
                            if(!r_w)begin
                                if(count>a_width && count<d_width)begin
                                    d_shift<={d_shift[d_width-2:0],sdi};
                                    count<=count+1;
                                     
                                    if(count==a_width+d_width) begin
                                        mem[reg_addr]<={d_shift[d_width-2:0],sdi};
                                        //d_shift<=mem[reg_addr];
                                        //drive<=1;
                                        //count<=0;
                                        state<=idle;
                                    end
                                end
                            end
                            else begin
                                drive<=1;
                                count<=0;
                                state<=read;
                                d_shift<=mem[reg_addr];
                            end
                        end
                    end
                    
                    read: begin
                        if(r_w)begin
                            //d_shift<={a_shift[d_width-2:0],mem[reg_addr]};
                            //drive<=1;
                            sdo<=d_shift[d_width-1];
                            d_shift<={d_shift[d_width-2:0],1'b0};
                            count<=count+1;
                            if(count==d_width-1)begin
                                state<=idle;
                                drive<=0;
                            end
                        end
                    end
                
                default:state<=idle;
                endcase
            end
        end
    end
    
endmodule
