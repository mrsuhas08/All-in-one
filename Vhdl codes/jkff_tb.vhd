----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 09:53:53
-- Design Name: 
-- Module Name: jkff_tb - tb
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
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jkff_tb is
--  Port ( );
end jkff_tb;

architecture tb of jkff_tb is
    component jkff is
        Port (clk,rst,j,k:in std_logic;
              q,qb:out std_logic);
    end component;
    signal clk,rst,j,k: std_logic:='0';
    signal q,qb: std_logic;
begin

    dut: jkff port map(clk=>clk,rst=>rst,j=>j,k=>k,q=>q,qb=>qb);
    
    clock: process is
    begin
    wait for 10 ns;
        clk <= not clk;
    end process;
    input: process is
    begin
        rst<='1';
    wait for 10 ns;
        rst<='0';
        j<='0';k<='0';
    wait for 20 ns;
        j<='0';k<='1';
    wait for 20 ns;
        j<='1';k<='0';
    wait for 20 ns;
        j<='1';k<='1';
    wait for 20 ns;
        j<='1';k<='1';
    wait for 20 ns;
        rst<='1';
    wait for 10 ns;
        finish;
    end process;
end tb;
