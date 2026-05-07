----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 14:50:44
-- Design Name: 
-- Module Name: decoder_tb - de
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

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture de of decoder_tb is
    signal tb_d: std_logic_vector(2 downto 0):=(others => '0');
    signal tb_y: std_logic_vector(7 downto 0):=(others => '0');
begin
    dut: entity work.decoder
        port map(d=>tb_d,y=>tb_y);
    
    process is
    begin
        tb_d<="000";
        wait for 10 ns;
        tb_d<="001";
        wait for 10 ns;
        tb_d<="010";
        wait for 10 ns;
        tb_d<="011";
        wait for 10 ns;
        tb_d<="100";
        wait for 10 ns;
        tb_d<="101";
        wait for 10 ns;
        tb_d<="110";
        wait for 10 ns;
        tb_d<="111";
        wait for 10 ns;
        finish;        
    end process;
end de;
