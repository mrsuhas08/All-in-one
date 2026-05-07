----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 11:05:48
-- Design Name: 
-- Module Name: up_counter - Design
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

entity up_counter is
  Port (clk,rst:in std_logic;
        count:out std_logic_vector(2 downto 0));
end up_counter;

architecture Design of up_counter is
    component tff is
        Port (clk,rst,t:in std_logic;
              q,qb:out std_logic);
    end component;
    signal cnt:std_logic_vector(2 downto 0);
    signal temp: std_logic_vector(2 downto 0);
begin

    dut1: tff port map(clk=>clk,rst=>rst,t=>'1',q=>cnt(0),qb=>temp(0));
    dut2: tff port map(clk=>cnt(0),rst=>rst,t=>'1',q=>cnt(1),qb=>temp(1));
    dut3: tff port map(clk=>cnt(1),rst=>rst,t=>'1',q=>cnt(2),qb=>temp(2));
    
    count<= not cnt;
    
end Design;
