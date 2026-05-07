----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 14:57:11
-- Design Name: 
-- Module Name: sram_tb - Behavioral
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
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sram_tb is
--  Port ( );
end sram_tb;

architecture Behavioral of sram_tb is
    constant addr_width:integer:=8;
    constant data_width:integer:=16;
    signal clk,rst,rw: std_logic:='0';
    signal addr: std_logic_vector(addr_width-1 downto 0):=(others => '0');
    signal data: std_logic_vector(data_width-1 downto 0):=(others => '0');
    signal temp: std_logic_vector(data_width-1 downto 0):=(others => '0');
begin
    dut: entity work.sram
        generic map(addr_width,data_width)
        port map(clk=>clk,rst=>rst,rw=>rw,addr=>addr,data=>data);
    
    data<=temp when rw='1' else (others => 'Z');
    
    process
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;
    
    process
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
            rw<='0';
            addr<=x"fe";
        wait for 30 ns;
    rw<='1';
            addr<=x"ff";
            temp<=x"abcd";
        wait for 40 ns;
            addr<=x"fe";
            temp<=x"dcba";
        wait for 40 ns;
            addr<=x"fd";
            temp<=x"baba";
        wait for 40 ns;      
    rw<='0';      
            addr<=x"ff";
        wait for 40 ns;      
            addr<=x"fe";
        wait for 40 ns;
            addr<=x"fd";
        wait for 40 ns;
        std.env.stop;
    end process;
end Behavioral;

