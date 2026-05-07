----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 12:20:08
-- Design Name: 
-- Module Name: full_adder_tb - fa
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture fa of full_adder_tb is
    signal tb_a,tb_b,tb_cin:std_logic:='0';
    signal tb_sum,tb_carry:std_logic;
begin

    dut: entity work.full_adder
        port map(a=>tb_a,b=>tb_b,cin=>tb_cin,
                 sum=>tb_sum,carry=>tb_carry);
    
    process is
        begin
            tb_a<='0';
            tb_b<='0';
            tb_cin<='0';
            wait for 10 ns;
            tb_a<='0';
            tb_b<='0';
            tb_cin<='1';
            wait for 10 ns;
            tb_a<='0';
            tb_b<='1';
            tb_cin<='0';
            wait for 10 ns;
            tb_a<='0';
            tb_b<='1';
            tb_cin<='1';
            wait for 10 ns;
            tb_a<='1';
            tb_b<='0';
            tb_cin<='0';
            wait for 10 ns;
            tb_a<='1';
            tb_b<='0';
            tb_cin<='1';
            wait for 10 ns;
            tb_a<='1';
            tb_b<='1';
            tb_cin<='0';
            wait for 10 ns;
            tb_a<='1';
            tb_b<='1';
            tb_cin<='1';
            wait for 10 ns;
            finish;
    end process;
end fa;
