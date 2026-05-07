----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 14:22:34
-- Design Name: 
-- Module Name: encoder_tb - en
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

entity encoder_tb is
--  Port ( );
end encoder_tb;

architecture en of encoder_tb is
    signal tb_d: std_logic_vector(7 downto 0):=(others => '0');
    signal tb_y: std_logic_vector(2 downto 0);
begin
    dut: entity work.encoder
        port map(d=>tb_d,
                 y=>tb_y);
    process is
        begin
            tb_d<="00000001";
            wait for 10 ns;
            tb_d<="00000010";
            wait for 10 ns;
            tb_d<="00000100";
            wait for 10 ns;
            tb_d<="00001000";
            wait for 10 ns;
            tb_d<="00010000";
            wait for 10 ns;
            tb_d<="00100000";
            wait for 10 ns;
            tb_d<="01000000";
            wait for 10 ns;
            tb_d<="10000000";
            wait for 10 ns;
            finish;
    end process;
            
end en;
