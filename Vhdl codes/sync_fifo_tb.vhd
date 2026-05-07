----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2025 10:35:25
-- Design Name: 
-- Module Name: sync_fifo_tb - Behavioral
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
use IEEE.numeric_std.ALL;
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_fifo_tb is
--  Port ( );
end sync_fifo_tb;

architecture Behavioral of sync_fifo_tb is
    constant data_width:integer:=8;
    signal clk,rst,we,re:std_logic:='0';
    signal din:std_logic_vector(data_width-1 downto 0):=(others => '0');
    signal dout:std_logic_vector(data_width-1 downto 0);
    signal full,empty:std_logic;
begin
    dut: entity work.sync_fifo
        generic map(data_width)
        port map(clk=>clk,rst=>rst,we=>we,re=>re,din=>din,dout=>dout,full=>full,empty=>empty);
        
    process
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    
    process
    begin
        rst<='1';
        wait for 20 ns;
        rst<='0';
        we<='1'; re<='0';
        din<=x"ff";
        wait for 160 ns;
        we<='0'; re<='1';
        wait for 160 ns;
        finish;
    end process;
end Behavioral;
