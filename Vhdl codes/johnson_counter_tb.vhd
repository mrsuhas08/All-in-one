----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 16:56:41
-- Design Name: 
-- Module Name: johnson_counter_tb - tb
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

entity johnson_counter_tb is
--  Port ( );
end johnson_counter_tb;

architecture tb of johnson_counter_tb is
    constant width: integer:=3;
    signal clk,rst:std_logic:='0';
    signal q: std_logic_vector(width-1 downto 0);
begin
    dut: entity work.johnson_counter
        generic map(width=>width)
        port map(clk=>clk,rst=>rst,q=>q);
    
    process is
    begin
        wait for 10 ns;
        clk<= not clk;
    end process;
    
    process is
    begin
        rst<='1';
        wait for 20 ns;
        rst<='0';
        wait for 300 ns;
        finish;
    end process;
end tb;
