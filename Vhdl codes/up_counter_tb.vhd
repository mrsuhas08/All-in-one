----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 14:14:26
-- Design Name: 
-- Module Name: up_counter_tb - tb
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
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_counter_tb is
--  Port ( );
end up_counter_tb;

architecture tb of up_counter_tb is
    signal clk,rst:std_logic:='0';
    signal count:std_logic_vector(2 downto 0):="000";
begin
    
    dut: entity work.up_counter
        port map(clk=>clk,rst=>rst,count=>count);
    
    clock: process is
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    
    value: process is
    begin
        rst<='1';
        wait for 5 ns;
        rst<='0';
        wait for 160 ns;
        finish;
    end process;
end tb;
