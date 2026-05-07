----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2025 14:11:10
-- Design Name: 
-- Module Name: async_fifo_tb - Behavioral
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

entity async_fifo_tb is
--  Port ( );
end async_fifo_tb;

architecture Behavioral of async_fifo_tb is
    constant data_width:integer:=8;
    constant addr:integer:=7;
    signal wclk,rclk,rst,we,re:std_logic:='0';
    signal din:std_logic_vector(data_width-1 downto 0):=(others => '0');
    signal dout:std_logic_vector(data_width-1 downto 0);
    signal full,empty:std_logic;
begin
    dut: entity work.async_fifo
        generic map(data_width=>data_width,addr=>addr)
        port map(wclk=>wclk,rclk=>rclk,rst=>rst,we=>we,re=>re,din=>din,dout=>dout,full=>full,empty=>empty);
        
    process
    begin
        wait for 10 ns;
        wclk <= not wclk;
    end process;
    
    process
    begin
        wait for 20 ns;
        rclk <= not rclk;
    end process;
    
    process
    begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        
--        we<='1'; re<='0';
--        for i in 1 to 70 loop
--            din <= std_logic_vector(to_unsigned(i, data_width));
--            wait until rising_edge(wclk);
--        end loop;
--        we<='0'; 
        
--        wait until rising_edge (rclk);
--        re<='1';
--        while empty='0' loop
--        wait until rising_edge(rclk);
--        end loop;
--        re<='0';

        wait until rising_edge(rclk);
        re<='1';
        wait until rising_edge(wclk);
        we<='1'; 
        for i in 70 downto 0 loop
            din <= std_logic_vector(to_unsigned(i, data_width));
            wait until rising_edge(wclk);
        end loop;
        wait for 4600 ns;
        we<='0';
        re<='0';
        wait until rising_edge(rclk);
        re<='1';
        wait until rising_edge(wclk);
        we<='1'; 
        for i in 70 downto 0 loop
            din <= std_logic_vector(to_unsigned(i, data_width));
            wait until rising_edge(wclk);
        end loop;
        we<='0';
        wait for 1600 ns;
        re<='0';
        wait for 200 ns;
        finish;
    end process;
end Behavioral;
