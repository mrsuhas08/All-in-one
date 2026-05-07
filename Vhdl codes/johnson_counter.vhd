----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 16:48:22
-- Design Name: 
-- Module Name: johnson_counter - design
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

entity johnson_counter is
    generic (width: integer:=5);
    Port (clk,rst:in std_logic;
          q:out std_logic_vector(width-1 downto 0));
end johnson_counter;

architecture design of johnson_counter is
    signal temp: std_logic_vector(width-1 downto 0):=(others => '0');
begin
    
    process (clk,rst) is
    begin
        if(rst='1') then
            temp<=(others => '0');
        elsif rising_edge(clk)then
            temp<=(not temp(0)) & temp(width-1 downto 1);
        end if;
    end process;
    
    q<=temp;
    
end design;
