----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 16:41:24
-- Design Name: 
-- Module Name: dram - Behavioral
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

entity dram is
    generic(addr_width:integer:=8;
            data_width:integer:=16);
   Port(clk,rst,we0,we1:in std_logic;
        addr0,addr1:in std_logic_vector(addr_width-1 downto 0);
        data0,data1:inout std_logic_vector(data_width-1 downto 0));
end dram;

architecture Behavioral of dram is
    signal temp0,temp1:std_logic_vector(data_width-1 downto 0):=(others =>'0');
    type store is array ((2**addr_width)-1 downto 0)of std_logic_vector(data_width-1 downto 0);
    signal mem:store:=(others =>(others => '0'));
begin
    process (clk,rst)is
    begin
        if rst='1' then
            temp0<=(others => '0');
            temp1<=(others => '0');
        elsif rising_edge(clk) then
        --write
            if we0='1' then
                mem(TO_INTEGER(unsigned(addr0)))<=data0;
            end if;
            if we1='1' then
                mem(TO_INTEGER(unsigned(addr1)))<=data1;
            end if;
        --read    
            if we0='0' then
                temp0<=mem(TO_INTEGER(unsigned(addr0)));
            end if;
            if we1='0' then
                temp1<=mem(TO_INTEGER(unsigned(addr1)));
            end if;
        end if;
    end process;
    
    data0<=temp0 when we0='0' else (others => 'Z');
    data1<=temp1 when we1='0' else (others => 'Z');
    
end Behavioral;
