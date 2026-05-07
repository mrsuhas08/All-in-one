----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 17:45:16
-- Design Name: 
-- Module Name: mod_counter_tb - tb
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

entity mod_counter_tb is
--  Port ( );
end mod_counter_tb;

architecture tb of mod_counter_tb is
    constant N: integer:=11;
    signal clk,rst:std_logic:='0';
    signal q:std_logic_vector(N-1 downto 0);
begin
    dut: entity work.mod_counter
        generic map(N=>N)
        port map(clk=>clk,rst=>rst,q=>q);
    
    process is
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    
    process is
    begin
        rst<='1';
        wait for 20 ns;
        rst<='0';
        wait for 400 ns;
    end process;
    
end tb;
