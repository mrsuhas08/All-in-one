----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 11:34:06
-- Design Name: 
-- Module Name: tff - Design
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

entity tff is
    Port (clk,rst,t:in std_logic;
          q,qb:out std_logic);
end tff;

architecture Design of tff is
    signal temp: std_logic:='0';
begin
    process (clk,rst,t) is
    begin
        if(rst='1')then
            temp<='0';
        elsif rising_edge(clk) then
            if (t='1')then
                temp<= not temp;
            else
                temp<=temp;
            end if;
        end if;
    end process;
    q<=temp;
    qb<= not temp;
end Design;