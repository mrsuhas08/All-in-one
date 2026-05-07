----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2025 09:28:12
-- Design Name: 
-- Module Name: Sync_fifo - Behavioral
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

entity Sync_fifo is
    generic(data_width:integer:=8);
    Port(clk,rst,we,re:in std_logic;
         din:in std_logic_vector(data_width-1 downto 0);
         dout:out std_logic_vector(data_width-1 downto 0);
         full,empty:out std_logic);
end Sync_fifo;

architecture Behavioral of Sync_fifo is
    constant depth:integer:=8;
    constant addr_size:integer:=3;
    signal bfull,bempty:std_logic;
    signal count:integer;
    signal wptr,rptr: std_logic_vector(addr_size-1 downto 0);
    type store is array (depth-1 downto 0) of std_logic_vector(data_width-1 downto 0);
    signal fifo:store:=(others =>(others =>'0'));
begin

    full<=bfull;
    bfull<='1' when count=depth else '0';
    
    write: process (clk)is
    begin
        if rising_edge(clk) then
            if rst='1' then
                wptr<=(others =>'0');
            elsif (we='1' and bfull='0') then
                fifo(TO_INTEGER(unsigned(wptr)))<=din;
                wptr <= std_logic_vector(unsigned(wptr) + 1);
            end if;
        end if;
    end process;
    
    empty<=bempty;
    bempty<='1' when count=0 else '0';
    
    read: process (clk)is
    begin
        if rising_edge(clk) then
            if rst='1' then
                rptr<=(others =>'0');
                dout<=(others =>'0');
            elsif (re='1' and bempty='0') then
                dout<=fifo(TO_INTEGER(unsigned(rptr)));
                rptr <= std_logic_vector(unsigned(rptr) + 1);
            end if;
        end if;
    end process;
    
    process (clk)is
    begin
        if rising_edge (clk)then
            if rst ='1'then
                count<=0;
            else
                case we is
                    when '1' =>
                        case re is
                            when '0' =>
                                if count = depth then
                                    count<=count;
                                else
                                    count<=count+1;
                                end if;
                            when others =>
                                count<=count;
                        end case;
                    when '0' =>
                        case re is
                            when '1' =>
                                if count = 0 then
                                    count<=count;
                                else
                                    count<=count-1;
                                end if;
                            when others =>
                                count<=count;   
                        end case;
                    when others =>
                        count<=count;                        
                end case;
            end if;
        end if;
    end process;
end Behavioral;
