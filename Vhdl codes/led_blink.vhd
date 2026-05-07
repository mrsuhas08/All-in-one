----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2026 16:56:39
-- Design Name: 
-- Module Name: led_blink - Behavioral
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

entity led_blink is

    Port (rst   :   in  std_logic;
          clk   :   in  std_logic;
          led   :   out std_logic);
          
end led_blink;

architecture Behavioral of led_blink is

    constant run    :   integer                 :=  50000000;
    signal count    :   integer range 0 to run  :=  0;
    signal temp     :   std_logic               :=  '0';
    signal rst_vio  :   std_logic               :=  '0';
    signal clk_out_50  :   std_logic            :=  '0';

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT ila_0
PORT (
	clk : IN STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;  

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) 
  );
END COMPONENT;
begin

    process (clk_out_50,rst_vio)
    begin
    
        if rst_vio = '0' then
            temp    <=  '0';
            count   <=  0;
        
        elsif rising_edge(clk_out_50) then
            
            if count = run - 1 then
                count   <=  0;
                temp    <=  not temp;
                
            else
                count   <=  count + 1;
                
            end if;
        
        end if;
    
    
    end process;

    led <=  temp;
    
ila_0_inst : ila_0
PORT MAP (
	clk => clk_out_50,
	probe0(0) => temp
);
vio_0_inst : vio_0
  PORT MAP (
    clk => clk_out_50,
    probe_out0(0) => rst_vio
  );
clk_wiz_0_inst : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => clk_out_50,
   -- Clock in ports
   clk_in1 => clk
 );
end Behavioral;
