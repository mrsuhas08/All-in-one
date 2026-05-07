----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 10:58:37
-- Design Name: 
-- Module Name: piso_tb - Behavioral
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

entity piso_tb is
--  Port ( );
end piso_tb;

architecture Behavioral of piso_tb is
    signal clk,rst,load:std_logic:='0';
    signal pi:std_logic_vector(3 downto 0):=(others=>'0');
    signal so:std_logic;
begin
    dut: entity work.piso
        port map(clk=>clk,rst=>rst,load=>load,pi=>pi,so=>so);
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
        load<='1';
        pi<="1011";
        wait for 20 ns;
        load<='0';
        wait for 120 ns;
        load<='1';
        pi<="1110";
        wait for 20 ns;
        load<='0';
        wait for 80 ns;
        finish;
    end process;    
end Behavioral;
