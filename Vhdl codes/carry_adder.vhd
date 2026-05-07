----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2025 13:05:35
-- Design Name: 
-- Module Name: carry_adder - ca
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

entity carry_adder is
  Port (a,b:in std_logic_vector(3 downto 0);
        cin:in std_logic;
        sum:out std_logic_vector(3 downto 0);
        carry:out std_logic);
end carry_adder;

architecture ca of carry_adder is
    signal p,g,c:std_logic_vector(3 downto 0);
begin
    p<= a xor b;
    g<= a and b;
    
    c(0)<=cin;
    c(1)<=(p(0) and c(0)) or g(0);
    c(2)<=(p(1) and c(1)) or g(1);
    c(3)<=(p(2) and c(2)) or g(2);
    carry<=(p(3) and c(3)) or g(3);

    sum<= p xor c;

end ca;
