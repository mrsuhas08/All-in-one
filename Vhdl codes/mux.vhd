----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 15:21:36
-- Design Name: 
-- Module Name: mux - mux4_1
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

entity mux is
  Port (a,b,c,d:in std_logic;
        sel:in std_logic_vector(1 downto 0);
        y:out std_logic);
end mux;

architecture mux4_1 of mux is
begin
    process (a,b,c,d,sel) is
    begin
        if sel = "00" then
            y<=a;
        elsif sel = "01" then
            y<=b;
        elsif sel = "10" then
            y<=c;
        else
            y<=d;
        end if;
    end process;
end mux4_1;
