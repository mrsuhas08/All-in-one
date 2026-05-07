----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 11:59:09
-- Design Name: 
-- Module Name: seg1110 - Behavioral
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

entity seg1110 is
  Port (clk,rst,x:in std_logic;
        z:out std_logic);
end seg1110;

architecture Behavioral of seg1110 is
    type fsm is (a,b,c,d);
    signal state:fsm;
begin
    process (clk,rst)
    begin
        if rising_edge (clk)then
            if rst='1' then
                z<='0';
                state<=a;
            else
                case state is
                    when a =>
                        if x='1' then
                            state<=b;
                            z<='1';
                        else
                            state<=a;
                            z<='0';
                        end if;
                    when b =>
                        if x='1' then
                            state<=c;
                            z<='1';
                        else
                            state<=a;
                            z<='0';
                        end if;
                    when c =>
                        if x='1' then
                            state<=d;
                            z<='1';
                        else
                            state<=a;
                            z<='0';
                        end if;
                    when d =>
                        if x='0' then
                            state<=a;
                            z<='1';
                        else
                            state<=a;
                            z<='0';
                        end if;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
