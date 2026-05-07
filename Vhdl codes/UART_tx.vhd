----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2026 15:25:16
-- Design Name: 
-- Module Name: UART_tx - Behavioral
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

entity UART_tx is
    Port(clk    :   in std_logic;
         rst    :   in std_logic;
         wr_en  :   in std_logic;
         tx_en  :   in std_logic;
         din    :   in std_logic_vector(7 downto 0);
         
         tx     :   out std_logic;
         busy   :   out std_logic);
         
end UART_tx;

architecture Behavioral of UART_tx is
    constant div    :   integer := 10;
    
    signal temp     :   std_logic_vector(7 downto 0)    := (others => '0');
    signal count    :   unsigned(3 downto 0)            := (others => '0');
    signal wpntr    :   unsigned(7 downto 0)            := (others => '0');
    
    type store is array (0 to 12) of std_logic_vector(7 downto 0);
    signal mem      :   store       :=  ( x"68", x"65", x"6C", x"6C", x"6F", x"20", x"77", x"6F", x"72", x"6C", 
                                       x"64", x"20", x"0A");--68 65 6C 6C 6F 20 77 6F 72 6C 64 20 0A
    
    type fsm is(idle,
                start,
                data,
                stop);
    signal state    :   fsm     := idle;
    
begin
    
    process (clk,rst) is
    begin
        
        
        
            if rst = '0' then
            
                tx      <=  '1';
                count   <=  (others => '0');
                wpntr   <=  (others => '0');
                temp    <=  (others => '0');
                state   <=  idle;
                
            elsif rising_edge(clk) then
            
                case state is
                    
                    when idle =>
                        tx      <=  '1';
                    if tx_en = '1' then
                            
                            state   <=  start;
                            temp    <=  mem(TO_INTEGER(unsigned(wpntr)));
                    end if;
                    when start =>
                        tx      <=  '0';
                    if tx_en = '1' then
                            temp    <=  mem(TO_INTEGER(unsigned(wpntr)));
                            count   <=  (others => '0');
                            state   <=  data;
                    end if;
                    when data =>
                        tx      <=  temp(TO_INTEGER(count));
                    if tx_en = '1' then
                            
--                            temp    <=  '0' & temp(7 downto 1);
--                            count   <=  count + 1;
                            if count = 7 then
--                                tx      <=  '1';
                                state   <=  stop;
                                
                            else
                                count   <=  count + 1;
                                
                            end if;
                    end if;
                    
                    when stop =>
                        tx      <=  '1';
                    if tx_en = '1' then
                            
                            state   <=  IDLE;
                            
                            if wpntr = 12 then
                                wpntr <= (others=> '0');
                            
                            else
                                wpntr   <=  wpntr + 1;
                                
                            end if;
                    else
                        STATE <= STOP;
                           
                    end if;
                    when others =>
                        
                        tx      <=  '1';
                        state   <=  idle;
                    
                end case;
                
--            end if;
            
        end if;
        
    end process;
    
    busy    <=  '0' when state = idle   else '1';

end Behavioral;