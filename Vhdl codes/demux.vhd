----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 15:53:08
-- Design Name: 
-- Module Name: demux - demux4_1
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

entity demux is
  Port (y:in std_logic;
        sel:in std_logic_vector(1 downto 0);
        a,b,c,d:out std_logic);
end demux;

architecture demux4_1 of demux is
begin
    process (y,sel) is
    begin
        case sel is
            when "00" =>
                a<=y;
                b<='0';
                c<='0';
                d<='0';
            when "01" =>
                a<='0';
                b<=y;
                c<='0';
                d<='0';
            when "10" =>
                a<='0';
                b<='0';                
                c<=y;
                d<='0';
            when "11" =>
                a<='0';
                b<='0';
                c<='0';
                d<=y;
            when others =>
                a<='0';
                b<='0';
                c<='0';
                d<='0';
        end case;
    end process;
end demux4_1;
