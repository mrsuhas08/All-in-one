----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 12:47:05
-- Design Name: 
-- Module Name: fa_ha_tb - f_h
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

entity fa_ha_tb is
--  Port ( );
end fa_ha_tb;

architecture f_h of fa_ha_tb is
    signal tb_a,tb_b:std_logic_vector(7 downto 0):=(others => '0');
    signal tb_cin:std_logic:='0';
    signal tb_sum:std_logic_vector(7 downto 0):=(others => '0');
    signal tb_carry:std_logic;
begin

    dut: entity work.fa_8bit
        port map(a=>tb_a,b=>tb_b,cin=>tb_cin,
                 sum=>tb_sum,carry=>tb_carry);
    
    process is
        begin
            tb_a<="00000001";
            tb_b<="11111110";
            tb_cin<='0';
            wait for 10 ns;
            tb_a<="10101010";
            tb_b<="01010101";
            tb_cin<='1';
            wait for 10 ns;
            tb_a<="11110000";
            tb_b<="00001111";
            tb_cin<='0';
            wait for 10 ns;
            tb_a<="11001100";
            tb_b<="00110011";
            tb_cin<='1';
            wait for 10 ns;
            finish;
    end process;
end f_h;
