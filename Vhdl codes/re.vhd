----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 11:27:05
-- Design Name: 
-- Module Name: re - Behavioral
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

entity re is
  Port ( clk,rst,inp: in  std_logic;
         re: out std_logic );
end re;

architecture Behavioral of re is
    signal dly: std_logic:='0';
begin

    process(clk,rst)
    begin
        if rst='1' then
            dly<= '0';
        elsif rising_edge(clk) then
            dly<= inp; 
        end if;
    end process;
    re<= inp and (not dly); 
end Behavioral;

