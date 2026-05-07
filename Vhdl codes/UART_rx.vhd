----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2026 15:25:16
-- Design Name: 
-- Module Name: UART_rx - Behavioral
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

entity UART_rx is
    Port(clk    :   in std_logic;
         rst    :   in std_logic;
         rx_en  :   in std_logic;
         clr    :   in std_logic;
         rx     :   in std_logic;
         
         rdy    :   out std_logic;
         dout   :   out std_logic_vector(7 downto 0));
end UART_rx;

architecture Behavioral of UART_rx is
    signal a        :   std_logic                       := '0';
    signal p        :   std_logic                       := '0';
    signal count    :   unsigned(3 downto 0)            := (others => '0');
    signal sample   :   unsigned(3 downto 0)            := (others => '0');
    signal temp     :   std_logic_vector(7 downto 0)    := (others => '0');
    
    type fsm is(idle,
                start,
                data,
                stop);
    signal state    :   fsm     := start;
    
begin
    
    process (clk,rst) is
    begin
    
            if rst = '0' then
                a       <=  '0';
                p       <=  '0';
                count   <=  (others => '0');
                sample  <=  (others => '0');
                temp    <=  (others => '0');
                dout    <=  (others => '0');
                rdy     <=  '0';
                state   <=  idle;
            
            elsif rising_edge(clk) then
            
                if clr = '1' then
                    rdy     <=  '0';
                else
                    if rx_en = '1' then
                        case state is
                            
                            when idle =>
                                    sample  <=  (others => '0');
                                    count   <=  (others => '0');
                                    temp    <=  (others => '0');
                                    state   <=  start;
                                    a       <=  '0';
                                    p       <=  '0';
                            
                            when start =>
                            
                                if rx = '0' and count = 0 then
                                    sample      <=  sample + 1;
                                                            
                                    if sample = 15 then
                                        state   <=  data;
                                        sample  <=  (others => '0');
                                        count   <=  (others => '0');
                                        temp    <=  (others => '0');
                                        
                                    end if;
                                
                                end if;
                            
                            when data =>
                                
                                sample  <=  sample + 1;
                                
                                if sample = 8 then
                                    temp(TO_INTEGER(count)) <=  rx;
                                    count                   <=  count + 1;
                                    
                                end if;
                                
                                if count = 8 and sample = 15 then
                                    state   <=  stop;
                                    sample  <=  (others => '0');
--                                    count   <=  (others => '0');
                                    
                                end if;
                            
                                                        
                            when stop =>
                                
                                if sample = 15 then
                                    rdy     <=  '1';
                                    dout    <=  temp;
                                    sample  <=  (others => '0');
                                    count   <=  (others => '0');
                                    state   <=  idle;
                                else
                                    sample  <=  sample + 1;
                                    
                                end if;
                            
                            when others =>
                                
                                state   <=  idle;
                            
                        end case;
                        
                    end if;
                    
                end if;
            
            end if;
                        
--        end if;
        
    end process;

end Behavioral;