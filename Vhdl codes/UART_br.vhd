----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2026 15:53:19
-- Design Name: 
-- Module Name: UART_br - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Baud_rate is
    Port(clk    :   in std_logic;
         rst    :   in std_logic;
         
         tx_en :   out std_logic;
         rx_en :   out std_logic);
end Baud_rate;

architecture Behavioral of Baud_rate is

    constant div        :   integer                 := 100_000_000 / (9600);
    
    signal tx_count     :   unsigned(13 downto 0)   := (others => '0');
    signal rx_count     :   unsigned(10 downto 0)   := (others => '0');
    
--    signal tx           :   std_logic               := '0';
--    signal rx           :   std_logic               := '0';
begin
--9600 bps
    process (clk,rst)is
    begin
            
        
        
            if rst ='0' then
                tx_count    <=  (others => '0');
                rx_count    <=  (others => '0');
                tx_en       <=  '0';
                rx_en       <=  '0';
            
            elsif rising_edge(clk) then
                if tx_count = div-1 then
                    tx_count    <=   (others => '0');
                    tx_en       <=  '1';
                else
                    tx_en       <=  '0';
                    tx_count    <= tx_count + 1;
                end if;
            
                if rx_count = (div/16)-1 then
                    rx_count    <=  (others => '0');
                    rx_en       <=  '1';
                else
                    rx_en   <=  '0';
                    rx_count  <=  rx_count + 1;
                end if;
                
            end if;
            
--        end if;
    
    end process;
    
--    tx_en   <=  '1'     when tx_count   =   0   else    '0';
--    rx_en   <=  '1'     when rx_count   =   0   else    '0';
    
end Behavioral;
