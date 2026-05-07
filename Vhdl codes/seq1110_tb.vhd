----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 12:51:24
-- Design Name: 
-- Module Name: seq1110_tb - Behavioral
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
use std.env.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seq1110_tb is
--  Port ( );
end seq1110_tb;

architecture Behavioral of seq1110_tb is
    signal clk,rst,x:std_logic:='0';
    signal z:std_logic;
begin
    dut: entity work.seq1110
        port map(clk=>clk,rst=>rst,x=>x,z=>z);
    process is
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    
    process is
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        wait until rising_edge(clk);
        x<='0';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='0';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='0';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='1';
        wait until rising_edge(clk);
        x<='0';
        wait until rising_edge(clk);
        finish;
    end process;
end Behavioral;
