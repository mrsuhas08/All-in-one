----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 15:53:47
-- Design Name: 
-- Module Name: demux_tb - demux4_1
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
use std.env.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux_tb is
--  Port ( );
end demux_tb;

architecture demux4_1 of demux_tb is
    signal y: std_logic:='0';
    signal sel: std_logic_vector(1 downto 0):="00";
    signal a,b,c,d: std_logic;
begin
    dut: entity work.demux
        port map(y=>y,sel=>sel,a=>a,b=>b,c=>c,d=>d);
        
    process is
    begin
        y<='1';
        sel<="00"; 
        wait for 10 ns;
        sel<="01";
        wait for 10 ns;
        sel<="10"; 
        wait for 10 ns;
        sel<="11"; 
        wait for 10 ns;
        finish;
    end process;
end demux4_1;
