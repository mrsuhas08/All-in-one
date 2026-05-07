----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2026 15:25:16
-- Design Name: 
-- Module Name: UART_top - Behavioral
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

entity UART_top is
    Port(clk        :   in std_logic;
         rst        :   in std_logic;
         wr_en      :   in std_logic;
         data_in    :   in std_logic_vector(7 downto 0);
         clr        :   in std_logic;
         
         rdy        :   out std_logic;
         busy       :   out std_logic;
         data_out   :   out std_logic_vector(7 downto 0));
end UART_top;

architecture Behavioral of UART_top is
    
    component Baud_rate is
    Port(clk    :   in std_logic;
         rst    :   in std_logic;
         
         tx_en  :   out std_logic;
         rx_en  :   out std_logic);
    end component;
    
    component UART_tx is
        Port(clk    :   in std_logic;
             rst    :   in std_logic;
             wr_en  :   in std_logic;
             tx_en  :   in std_logic;
             din    :   in std_logic_vector(7 downto 0);
             
             tx     :   out std_logic;
             busy   :   out std_logic);    
    end component;
    
    component UART_rx is
        Port(clk    :   in std_logic;
             rst    :   in std_logic;
             rx_en  :   in std_logic;
             clr    :   in std_logic;
             rx     :   in std_logic;
             
             rdy    :   out std_logic;
             dout   :   out std_logic_vector(7 downto 0));
    end component;

    signal tx_temp  :   std_logic       := '0';
    signal rx_temp  :   std_logic       := '0';
    
    signal tx_rx    :   std_logic       := '0';
    
begin

    baudrate:   Baud_rate
            port map(clk    =>  clk,
                     rst    =>  rst,
                     tx_en  =>  tx_temp,
                     rx_en  =>  rx_temp);
                     
    trans:  UART_tx
            port map(clk    =>  clk,
                     rst    =>  rst,
                     wr_en  =>  wr_en,
                     tx_en  =>  tx_temp,
                     din    =>  data_in,
                     tx     =>  tx_rx,
                     busy   =>  busy);
    
    receiv: UART_rx
            port map(clk    =>  clk,
                     rst    =>  rst,
                     rx_en  =>  rx_temp,
                     clr    =>  clr,
                     rx     =>  tx_rx,
                     rdy    =>  rdy,
                     dout   =>  data_out);
    
end Behavioral;
