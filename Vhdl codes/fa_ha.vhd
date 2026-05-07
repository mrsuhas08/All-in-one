----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 12:35:59
-- Design Name: 
-- Module Name: fa_ha - f_h
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

entity fa_ha is
  Port (a,b,cin:in std_logic;
        sum,carry:out std_logic);
end fa_ha;

architecture f_h of fa_ha is
    component half_adder is
    Port (h_a,h_b:in std_logic;
          h_sum,h_carry:out std_logic);
    end component;
    
    signal s,c1,c2:std_logic;
begin
    ha1: half_adder port map(h_a=>a,h_b=>b,h_sum=>s,h_carry=>c1);
    ha2: half_adder port map(h_a=>s,h_b=>cin,h_sum=>sum,h_carry=>c2);
    
    carry<= c1 or c2;
    
end f_h;
