----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 10:38:53
-- Design Name: 
-- Module Name: pipo - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipo is
  Port (clk,rst: in std_logic;
        pi: in std_logic_vector(3 downto 0);
        po: out std_logic_vector(3 downto 0));
end pipo;

architecture Behavioral of pipo is
    signal temp:std_logic_vector(3 downto 0);--:=(others => '0');
begin
    process (clk,rst,pi) is
    begin
        if rst='1' then
            temp<=(others=> '0');
        elsif rising_edge (clk) then
            temp<=pi;
        end if;
    end process;
    po<=temp;
end Behavioral;
