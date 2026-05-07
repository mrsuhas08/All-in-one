----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 14:03:59
-- Design Name: 
-- Module Name: carry_adder_tb - ca
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

entity carry_adder_tb is
--  Port ( );
end carry_adder_tb;

architecture ca of carry_adder_tb is
    signal tb_a,tb_b: std_logic_vector(3 downto 0):="0000";
    signal tb_cin: std_logic:='0';
    signal tb_sum: std_logic_vector(3 downto 0);
    signal tb_carry: std_logic;
begin
    uut: entity work.carry_adder
         port map(a=>tb_a,b=>tb_b,cin=>tb_cin,
                  sum=>tb_sum,carry=>tb_carry);
         
         process is
            begin
                tb_a<="0000";
                tb_b<="1111";
                tb_cin<='0';
                wait for 10 ns;
                tb_a<="1111";
                tb_b<="0000";
                tb_cin<='1';
                wait for 10 ns;
                tb_a<="0101";
                tb_b<="1010";
                tb_cin<='0';
                wait for 10 ns;
                finish;
         end process;
    
end ca;
