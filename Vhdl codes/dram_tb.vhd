----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2025 17:21:14
-- Design Name: 
-- Module Name: dram_tb - Behavioral
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

entity dram_tb is
--  Port ( );
end dram_tb;

architecture Behavioral of dram_tb is
    constant addr_width:integer:=8;
    constant data_width:integer:=16;
    
    signal clk,rst,we0,we1: std_logic:='0';
    signal addr0,addr1: std_logic_vector(addr_width-1 downto 0):=(others => '0');
    signal data0,data1: std_logic_vector(data_width-1 downto 0);
    
    signal temp0,temp1:std_logic_vector(data_width-1 downto 0):=(others =>'0');
begin
    dut: entity work.dram
        generic map(addr_width,data_width)
        port map(clk=>clk,rst=>rst,we0=>we0,we1=>we1,addr0=>addr0,addr1=>addr1,data0=>data0,data1=>data1);
    
    data0<=temp0 when we0='1' else (others => 'Z');
    data1<=temp1 when we1='1' else (others => 'Z');
    
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
        we0<='1'; we1<='1'; 
            addr0<=x"ff"; temp0<=x"abcd";
            addr1<=x"fe"; temp1<=x"ef01";
        wait for 40 ns;
            addr0<=x"fd"; temp0<=x"2345";
            addr1<=x"fc"; temp1<=x"6789";
        wait for 40 ns;
            addr0<=x"fb"; temp0<=x"0123";
            addr1<=x"fa"; temp1<=x"4567";
        wait for 40 ns;
        we0<='0'; we1<='0';
            addr0<=x"ff";
            addr1<=x"fe";
        wait for 40 ns;
            addr0<=x"fd";
            addr1<=x"fc";
        wait for 40 ns;
            addr0<=x"fa";
            addr1<=x"fb";
        wait for 40 ns;
        finish;
    end process;
end Behavioral;
