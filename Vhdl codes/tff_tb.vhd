----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 12:50:31
-- Design Name: 
-- Module Name: tff_tb - design
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

entity tff_tb is
--  Port ( );
end tff_tb;

architecture design of tff_tb is
    component tff is
        port (clk,rst,t:in std_logic;
              q,qb:out std_logic);
    end component;
    signal clk,rst,t: std_logic:='0';
    signal q,qb: std_logic;
begin
    dut: tff port map(clk=>clk,rst=>rst,t=>t,q=>q,qb=>qb);
    clock: process is
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    value: process is
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        t<='0';
        wait for 30 ns;
        t<='1';
        wait for 20 ns;
        t<='0';
        wait for 20 ns;
        t<='1';
        wait for 20 ns;
--        finish;
    end process;
end design;
