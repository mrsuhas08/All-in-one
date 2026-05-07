----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2025 12:22:54
-- Design Name: 
-- Module Name: Uart_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Uart_tb is
--  Port ( );
end Uart_tb;

architecture Behavioral of Uart_tb is
    signal clk        :   std_logic                     := '0';
    signal rst        :   std_logic                     := '0';
    signal wr_en      :   std_logic                     := '0';
    signal data_in    :   std_logic_vector(7 downto 0)  := (others => '0');
    signal clr        :   std_logic                     := '0';
    
    signal rdy        :   std_logic;
    signal busy       :   std_logic;
    signal data_out   :   std_logic_vector(7 downto 0);
    
begin
    
    dut: entity work.Uart
        port map(clk        =>  clk,
                 rst        =>  rst,
                 wr_en      =>  wr_en,
                 data_in    =>  data_in,
                 clr        =>  clr,
                 rdy        =>  rdy,
                 busy       =>  busy,
                 data_out   =>  data_out);
    
    clock: process
    begin
        wait for 10 ns;
            clk     <=  not clk;
    end process;
    
    values: process
    begin
        rst     <=  '1';
        
        wait for 20 ns;
        rst     <=  '0';
            
        wait until rising_edge(clk);
            clr     <=  '0';
            wr_en   <=  '1';
            data_in <=  x"aa";
            
        wait until busy = '1';
            wr_en   <=  '0';
            
        wait until rdy  = '1';
            clr     <=  '1';
            
        wait until busy = '0';
            clr     <=  '0';
            wr_en   <=  '1';
            data_in <=  x"55";
            
        wait until busy = '1';
            wr_en   <=  '0';
            
        wait until rdy  = '1';
            clr     <=  '1';
        
        wait until busy = '0';
            clr     <=  '0';
            wr_en   <=  '1';
            data_in <=  x"fd";
            
        wait until busy = '1';
            wr_en   <=  '0';
            
        wait until rdy  = '1';
            clr     <=  '1';
        
        wait until busy = '0';
            clr     <=  '0';
            wr_en   <=  '1';
            data_in <=  x"dd";
            
        wait until busy = '1';
            wr_en   <=  '0';
            
        wait until rdy  = '1';
            clr     <=  '1';
        
        wait until busy = '0';
            clr     <=  '0';
            wr_en   <=  '1';
            data_in <=  x"bc";
            
        wait until busy = '1';
            wr_en   <=  '0';
            
        wait until rdy  = '1';
            clr     <=  '1';
            
        wait until rdy  = '1';
        wait for 20 ns;
        finish;
        
    end process;
    
end Behavioral;
