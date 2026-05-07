----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 09:53:28
-- Design Name: 
-- Module Name: jkff - design
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

entity jkff is
  Port (clk,rst,j,k:in std_logic;
        q,qb:out std_logic);
end jkff;

architecture design of jkff is
    signal temp: std_logic:='0';
begin
    process (clk,rst,j,k) is
    begin
        if (rst='1')then
            temp<='0';
        elsif falling_edge(clk) then
            if (j='0' and k='0')then
                temp<=temp;
            elsif (j='0' and k='1')then
                temp<='0';
            elsif (j='1' and k='0')then
                temp<='1';
            elsif (j='1' and k='1')then
                temp<=not temp;
            else 
                null;
            end if;
        end if;
    end process;
    q <= temp;
    qb <= not temp;
    
end design;
