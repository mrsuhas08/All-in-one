----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 14:38:08
-- Design Name: 
-- Module Name: sync_up_down_tb - tb
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

entity sync_up_down_tb is
--  Port ( );
end sync_up_down_tb;

architecture tb of sync_up_down_tb is
    constant width: integer:=3;
    signal clk,rst,m: std_logic:='0';
    signal count: std_logic_vector(width-1 downto 0);
begin
    dut: entity work.sync_up_down
        generic map(width=>width)
        port map(clk=>clk,rst=>rst,m=>m,count=>count);
        
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
        m<='1';
        wait for 500 ns;
        m<='0';
        wait for 500 ns;
        finish;
    end process;
end tb;
