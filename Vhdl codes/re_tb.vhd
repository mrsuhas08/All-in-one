----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 11:35:45
-- Design Name: 
-- Module Name: re_tb - Behavioral
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
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity re_tb is
--  Port ( );
end re_tb;

architecture Behavioral of re_tb is
    signal clk,rst,inp:std_logic:='0';
    signal re:std_logic;
begin
    dut: entity work.re
        port map(clk=>clk,rst=>rst,inp=>inp,re=>re);
    process is
    begin
        wait for 10 ns;
        clk<= not clk;
    end process;
    
    process is
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        wait for 5 ns;
        inp<= not inp;
        wait for 300 ns;
        finish;
    end process;
end Behavioral;
