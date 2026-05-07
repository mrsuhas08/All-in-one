----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 11:25:52
-- Design Name: 
-- Module Name: half_adder_tb - ha
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

entity half_adder_tb is
--  Port ( );
end half_adder_tb;

architecture ha of half_adder_tb is
    signal tb_a,tb_b:bit:='0';
    signal tb_sum,tb_carry:bit;
begin
    dut: entity work.half_adder
        port map(a=>tb_a,b=>tb_b,
                 sum=>tb_sum,carry=>tb_carry);
    process is
        begin
            tb_a<='0';
            tb_b<='0';
            wait for 10 ns;
            tb_a<='0';
            tb_b<='1';
            wait for 10ns;
            tb_a<='1';
            tb_b<='0';
            wait for 10 ns;
            tb_a<='1';
            tb_b<='1';
            wait for 10 ns;
            finish;
    end process;
end ha;
