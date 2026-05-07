----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 09:52:11
-- Design Name: 
-- Module Name: siso - Behavioral
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

entity siso is
  Port (clk,rst,si: in std_logic;
        so: out std_logic);
end siso;

architecture Behavioral of siso is
    signal temp:std_logic_vector(3 downto 0);
begin
    process (clk,rst,si) is
    begin
        if rst='1' then
            temp<=(others => '0');
        elsif rising_edge(clk) then
            temp(3 downto 1)<=temp(2 downto 0);
            temp(0)<=si;
        end if;      
    end process;
    so<=temp(3);
end Behavioral;
