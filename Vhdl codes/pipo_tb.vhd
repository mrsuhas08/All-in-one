----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 10:43:32
-- Design Name: 
-- Module Name: pipo_tb - Behavioral
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

entity pipo_tb is
--  Port ( );
end pipo_tb;

architecture Behavioral of pipo_tb is
    signal clk,rst:std_logic:='0';
    signal pi:std_logic_vector(3 downto 0):=(others => '0');
    signal po:std_logic_vector(3 downto 0);
begin
    dut: entity work.pipo
        port map(clk=>clk,rst=>rst,pi=>pi,po=>po);
    process is
    begin
        wait for 10 ns;
        clk<= not clk;
    end process;
    process is
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        pi<="1101";
        wait for 20 ns;
        pi<="1011";
        wait for 40 ns;
        finish;
    end process;
end Behavioral;
