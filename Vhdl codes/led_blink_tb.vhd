----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2026 17:42:24
-- Design Name: 
-- Module Name: led_blink_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_blink_tb is
--  Port ( );
end led_blink_tb;

architecture Behavioral of led_blink_tb is
    
    signal  rst     :   std_logic   :=  '0';
    signal  clk     :   std_logic   :=  '0';
    signal  led     :   std_logic;
    
begin

    dut :   entity  work.led_blink
            port map(rst    =>  rst,
                     clk    =>  clk,                     
                     led    =>  led);
    
    process is
    begin
        wait for 10 ns;
        clk <=  not clk;
    end process;
    
    process is
    begin
        rst <=  '0';
        wait for 20 ns;
        rst <=  '1';
        wait;
        
    end process;
    
end Behavioral;
