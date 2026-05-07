----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 14:37:23
-- Design Name: 
-- Module Name: sync_up_down - Design
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_up_down is
    generic(width: integer:=5);
    Port (clk,rst,m:in std_logic;
          count:out std_logic_vector(width-1 downto 0));
end sync_up_down;

architecture Design of sync_up_down is
signal temp: unsigned(width-1 downto 0):=(others => '0');
begin
    
    process (clk,rst,m)is
    begin
        if rising_edge(clk)then
            if (rst='1')then
                temp<=(others => '0');
            else
                if(m='1')then
                    temp<=temp + 1;
                elsif(m='0')then
                    temp<=temp - 1;
                end if;
            end if;
        end if;
    end process;
    
    count<=std_logic_vector(temp);
    
end Design;
