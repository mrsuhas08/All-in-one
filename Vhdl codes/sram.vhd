----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 14:13:14
-- Design Name: 
-- Module Name: sram - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sram is
    generic(addr_width: integer:=8;
            data_width: integer:=16);
   Port(clk,rst,rw:in std_logic;
        addr:in std_logic_vector(addr_width-1 downto 0);
        data:inout std_logic_vector(data_width-1 downto 0)
        );
end sram;

architecture Behavioral of sram is
    type store is array ((2**addr_width)-1 downto 0) of std_logic_vector(data_width-1 downto 0);
    signal mem:store:=(others => (others => '0'));
    signal temp:std_logic_vector(data_width-1 downto 0);
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst='1' then
                temp<=(others => '0');
            else
                if rw='1' then
                    mem(to_integer(unsigned(addr)))<=data;
                elsif rw='0' then
                    temp<=mem(to_integer(unsigned(addr)));
                end if;
            end if;
        end if;    
    end process;
    data<=temp when rw='0' else (others => 'Z');
end Behavioral;
