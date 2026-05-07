----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2025 11:15:31
-- Design Name: 
-- Module Name: async_fifo - Behavioral
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

entity async_fifo is
    generic(data_width: integer:=8;
            addr:integer:=6);
    Port(wclk,rclk,rst,we,re:in std_logic;
         din:in std_logic_vector(data_width-1 downto 0);
         dout:out std_logic_vector(data_width-1 downto 0);
         full,empty:out std_logic);
end async_fifo;

architecture Behavioral of async_fifo is
    constant depth:integer:=80;
    
    signal bfull,bempty:std_logic;
    
    signal wptr,rptr: std_logic_vector(addr downto 0):=(others => '0');
    
    signal wptr_g,rptr_g: std_logic_vector(addr downto 0):=(others => '0');
    
    signal wptr_s1,wptr_s2: std_logic_vector(addr downto 0):=(others => '0');
    signal rptr_s1,rptr_s2: std_logic_vector(addr downto 0):=(others => '0');
    
    type store is array (depth-1 downto 0) of std_logic_vector(data_width-1 downto 0);
    signal fifo:store:=(others =>(others =>'0'));
begin
    write: process (wclk,rst)is
    begin
        if rising_edge(wclk) then
            if rst='1' then
                wptr<=(others =>'0');
            elsif (we='1' and bfull='0') then
                fifo(TO_INTEGER(unsigned(wptr(addr-1 downto 0))))<=din;
                wptr <= std_logic_vector(unsigned(wptr) + 1);
            end if;
        end if;
    end process;
    
    read: process (rclk,rst)is
    begin
        if rising_edge(rclk) then
            if rst='1' then
                rptr<=(others =>'0');
                dout<=(others =>'0');
            elsif (re='1' and bempty='0') then
                dout<=fifo(TO_INTEGER(unsigned(rptr(addr-1 downto 0))));
                rptr <= std_logic_vector(unsigned(rptr) + 1);
            end if;
        end if;
    end process;
    
    wptr_g<=std_logic_vector(unsigned(wptr) xor shift_right(unsigned(wptr),1));
    rptr_g<=std_logic_vector(unsigned(rptr) xor shift_right(unsigned(rptr),1));
    
    process (rclk,rst)is
    begin
        if rising_edge(rclk) then
            if rst='1' then
                wptr_s1<=(others =>'0');
                wptr_s2<=(others =>'0');
            else
                wptr_s1<=wptr_g;
                wptr_s2<=wptr_s1;
            end if;
        end if;
    end process;
    
    process (wclk,rst)is
    begin
        if rising_edge(wclk) then
            if rst='1' then
                rptr_s1<=(others =>'0');
                rptr_s2<=(others =>'0');
            else
                rptr_s1<=rptr_g;
                rptr_s2<=rptr_s1;
            end if;
        end if;
    end process;
    
    bempty<='1' when unsigned(rptr_g)=unsigned(wptr_s2) else '0';
    empty<=bempty;

    bfull<='1' when (not (wptr_g(addr) = rptr_g(addr))) and 
                    (not (wptr_g(addr-1) = rptr_g(addr-1))) and
                    (wptr_g(addr-2 downto 0) = rptr_g(addr-2 downto 0)) else '0';
    full<=bfull;

end Behavioral;
