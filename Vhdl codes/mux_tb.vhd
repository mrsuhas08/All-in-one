----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 15:22:04
-- Design Name: 
-- Module Name: mux_tb - mux4_1
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

entity mux_tb is
--  Port ( );
end mux_tb;

architecture mux4_1 of mux_tb is
    signal a,b,c,d: std_logic:='0';
    signal sel: std_logic_vector(1 downto 0):="00";
    signal y: std_logic;
begin
    
    dut: entity work.mux
        port map(a=>a,b=>b,c=>c,d=>d,sel=>sel,
                 y=>y);
                 
    process is
    begin
        a<='1';b<='0';c<='0';d<='0';
        sel <= "00";
        wait for 10 ns;
        a<='0';b<='1';c<='0';d<='0';
        sel <= "01";
        wait for 10 ns;
        a<='0';b<='0';c<='1';d<='0';
        sel <= "10";
        wait for 10 ns;
        a<='0';b<='0';c<='0';d<='1';
        sel <= "11";
        wait for 10 ns;
        finish;    
    end process;
    
end mux4_1;
