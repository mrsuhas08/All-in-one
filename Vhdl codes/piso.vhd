----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 10:54:00
-- Design Name: 
-- Module Name: piso - Behavioral
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

entity piso is
    Port (clk,rst,load:in std_logic;
          pi:in std_logic_vector(3 downto 0);
          so:out std_logic);
end piso;

architecture Behavioral of piso is
    signal temp:std_logic_vector(3 downto 0);
begin
    process (clk,rst,pi)is
    begin
        if rst='1' then
            temp<=(others =>'0');
        elsif rising_edge (clk) then
            if load='1'then
                temp<=pi;
            else
                temp(3 downto 1)<=temp(2 downto 0);
                temp(0)<='0';
            end if;
        end if;
    end process;
    so<=temp(3);
end Behavioral;
