----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 14:21:34
-- Design Name: 
-- Module Name: encoder - en
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

entity encoder is
    Port (d:in std_logic_vector(7 downto 0);
          y:out std_logic_vector(2 downto 0));
end encoder;

architecture en of encoder is
begin
    y(0)<=d(1) or d(3) or d(5) or d(7);
    y(1)<=d(2) or d(3) or d(6) or d(7);
    y(2)<=d(4) or d(5) or d(6) or d(7);
end en;
