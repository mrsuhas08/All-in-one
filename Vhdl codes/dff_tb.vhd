----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 09:25:01
-- Design Name: 
-- Module Name: dff_tb - Behavioral
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
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff_tb is
--  Port ( );
end dff_tb;

architecture Behavioral of dff_tb is
    signal clk,rst,d: std_logic:='0';
    signal q,qb: std_logic;
begin
    
    dut: entity work.dff
        port map(clk=>clk,rst=>rst,d=>d,q=>q,qb=>qb);
    
    clock: process is
    begin
        clk<='0';
        wait for 10 ns;
        clk<='1';
        wait for 10 ns;
    end process;
    input: process is
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        wait for 10 ns;
        d<='0';
        wait for 20 ns;
        d<='1';
        wait for 20 ns;
    end process;
end Behavioral;
