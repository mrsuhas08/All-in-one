----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 09:25:08
-- Design Name: 
-- Module Name: multi_5 - design
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

entity multi_5 is
  Port (clk,rst: in std_logic;
        q: out std_logic_vector(3 downto 0));
end multi_5;

architecture design of multi_5 is
    signal temp:unsigned(3 downto 0):=(others =>'0');
begin

    process (clk,rst) is
    begin
        if rising_edge (clk) then
            if(rst='1')then
                temp<=(others => '0');
                q<=(others => '0');
            else
                temp<=temp+1;
                if((temp mod 5) = 0)then
                    q<=std_logic_vector(temp);
                else
                    q<=(others => '0');
                end if;
            end if;
        end if;
    end process;
end design;
