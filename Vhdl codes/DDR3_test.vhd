----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 14:19:09
-- Design Name: 
-- Module Name: DDR3_test - Behavioral
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
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DDR3_test is
--  Port ( );
end DDR3_test;

architecture Behavioral of DDR3_test is
    
    signal clk,clk_ref : std_logic  := '0';
    signal rst         : std_logic  := '0';
    
    signal test_data   : std_logic_vector(63 downto 0)  := (others => '0');
    signal test_addr   : std_logic_vector(27 downto 0)  := (others => '0');
    signal write_cmd   : std_logic_vector(2 downto 0)   := (others => '0');
    signal read_cmd    : std_logic_vector(2 downto 0)   := (others => '0');
    signal read_data   : std_logic_vector(63 downto 0);

begin
    dut: entity work.DDR3_top
        port map(clk=>clk,
                 clk_ref=>clk_ref,
                 rst=>rst,
                 test_data=>test_data,
                 test_addr=>test_addr,
                 write_cmd=>write_cmd,
                 read_cmd=>read_cmd,
                 read_data=>read_data
                 );
                 
    clock: process is
        begin
            wait for 10 ns;
            clk <=  not clk;
        end process;
        
    clock_ref: process is
        begin
            wait for 5 ns;
            clk_ref <=  not clk_ref;
        end process;
        
    value: process is
        begin
            rst <=  '0';
            wait for 2 us;
            rst <=  '1';
            write_cmd   <=  "000";
            test_addr   <=  x"0000000";
            test_data   <=  x"abababab_abababab";
            wait for 10 us;
            read_cmd    <=  "001";
            test_addr   <=  x"0000000";
            wait for 10 us;
            finish;
        end process;
    
end Behavioral;