----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 16:37:59
-- Design Name: 
-- Module Name: fa_8bit - fa_8
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

entity fa_8bit is
  Port (a,b:in std_logic_vector(7 downto 0);
        cin:in std_logic;
        sum:out std_logic_vector(7 downto 0);
        carry:out std_logic);
end fa_8bit;

architecture fa_8 of fa_8bit is
    component fa_ha is
        port(a,b,cin:in std_logic;
        sum,carry:out std_logic);    
    end component;
    signal c:std_logic_vector(6 downto 0);    
begin
    
    fa1: fa_ha port map(a=>a(0),b=>b(0),cin=>cin,sum=>sum(0),carry=>c(0));
    fa2: fa_ha port map(a=>a(1),b=>b(1),cin=>c(0),sum=>sum(1),carry=>c(1));
    fa3: fa_ha port map(a=>a(2),b=>b(2),cin=>c(1),sum=>sum(2),carry=>c(2));
    fa4: fa_ha port map(a=>a(3),b=>b(3),cin=>c(2),sum=>sum(3),carry=>c(3));
    fa5: fa_ha port map(a=>a(4),b=>b(4),cin=>c(3),sum=>sum(4),carry=>c(4));
    fa6: fa_ha port map(a=>a(5),b=>b(5),cin=>c(4),sum=>sum(5),carry=>c(5));
    fa7: fa_ha port map(a=>a(6),b=>b(6),cin=>c(5),sum=>sum(6),carry=>c(6));
    fa8: fa_ha port map(a=>a(7),b=>b(7),cin=>c(6),sum=>sum(7),carry=>carry);
    
end fa_8;
