----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 09:37:23
-- Design Name: 
-- Module Name: multi_5_tb - tb
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

entity multi_5_tb is
--  Port ( );
end multi_5_tb;

architecture tb of multi_5_tb is
    signal clk,rst: std_logic:='0';
    signal q:std_logic_vector(3 downto 0);
begin
    dut: entity work.multi_5
        port map(clk=>clk,rst=>rst,q=>q);
        
    process is
    begin
        wait for 10 ns;
        clk<= not clk;    
    end process;
    process is
    begin
        rst<='1';
        wait for 5 ns;
        rst<='0';
        wait for 350 ns;
        finish;
    end process;
end tb;
