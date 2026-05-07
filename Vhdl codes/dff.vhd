----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 09:24:36
-- Design Name: 
-- Module Name: dff - Behavioral
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

entity dff is
  Port (clk,rst,d:in std_logic;
        q,qb:out std_logic);
end dff;

architecture Behavioral of dff is
begin
    process (clk,rst,d) is
    begin
        if(rising_edge(clk))then
            if(rst='1')then
                q <='0';
                q <='1';
            else
                q <= d;
                qb <= not d;
            end if;
        end if;        
    end process;
end Behavioral;
