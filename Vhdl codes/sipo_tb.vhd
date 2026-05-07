----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 10:25:22
-- Design Name: 
-- Module Name: sipo_tb - Behavioral
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

entity sipo_tb is
--  Port ( );
end sipo_tb;

architecture Behavioral of sipo_tb is
    signal clk,rst,si: std_logic:='0';
    signal po:std_logic_vector(3 downto 0);
begin
    dut: entity work.sipo
        port map(clk,rst,si,po);
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
        si<='1';
        wait for 20 ns;
        si<='0';
        wait for 20 ns;
        si<='1';
        wait for 20 ns;
        si<='1';
        wait for 20 ns;
        si<='0';
        wait for 20 ns;
        si<='0';
        wait for 20 ns;
        si<='1';
        wait for 20 ns;
        si<='1';
        wait for 80 ns;
        finish;
    end process;
end Behavioral;
