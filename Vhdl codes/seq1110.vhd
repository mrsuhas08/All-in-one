----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 12:36:13
-- Design Name: 
-- Module Name: seq1110 - Behavioral
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

entity seq1110 is
  Port (clk,rst,x:in std_logic;
        z:out std_logic );
end seq1110;

architecture Behavioral of seq1110 is
    type fsm is(a,b,c,d,e);
    signal state:fsm;
begin
    process (clk,rst)is
    begin
        if rising_edge (clk)then
            if rst='1' then
                state<=a;
            else
                case state is
                    when a =>
                        if x='1' then
                            state<=b;
                        else
                            state<=a;
                        end if;
                    when b =>
                        if x='1' then
                            state<=c;
                        else
                            state<=a;
                        end if;
                    when c =>
                        if x='1' then
                            state<=d;
                        else
                            state<=a;
                        end if;                   
                    when d=>
                        if x='0' then
                            state<=e;
                        else
                            state<=d;
                        end if;
                    when e =>
                        if x='1' then
                            state<=b;
                        else
                            state<=a;
                        end if;
                end case;
            end if;
        end if;
    end process;
    z<='1' when state = e else '0';
end Behavioral;
