----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 17:31:59
-- Design Name: 
-- Module Name: mod_counter - design
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_counter is
    generic(N:integer:=10);
    Port(clk,rst:in std_logic;
         q:out std_logic_vector(N-1 downto 0));
end mod_counter;

architecture design of mod_counter is
    signal count:unsigned(N-1 downto 0):=(others => '0');
begin
    process (clk,rst) is
    begin
        if rising_edge(clk)then
            if(rst='1')then
                count<=(others => '0');
            else
                count<=count+1;
                if(count=(N-1))then
                count<=(others => '0');
                end if;
            end if;
        end if;
    end process;
    q<=std_logic_vector(count);
end design;
