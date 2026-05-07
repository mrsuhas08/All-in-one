----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 14:14:57
-- Design Name: 
-- Module Name: DDR3_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DDR3 is
    port(clk_ui        :   in std_logic;
        rst         :   in std_logic;
        
        init_calib_complete :   in std_logic;
        
        test_data   :   in std_logic_vector(63 downto 0);
        test_addr   :   in std_logic_vector(27 downto 0);
        rw_cmd   :   in std_logic_vector(2 downto 0);
        read_data   :   out std_logic_vector(63 downto 0);
        
        app_rdy     :   in std_logic;
        app_wdf_rdy :   in std_logic;
        
        app_rd_data :   in std_logic_vector(63 downto 0);
        app_rd_data_valid   :   in std_logic;
        
        app_addr    :   out std_logic_vector(27 downto 0);
        app_cmd     :   out std_logic_vector(2 downto 0);
        app_en      :   out std_logic;
        
        app_wdf_data:   out std_logic_vector(63 downto 0);
        app_wdf_wren:   out std_logic;
        app_wdf_end :   out std_logic;
        app_wdf_mask:   out std_logic_vector(7 downto 0);
        
        state_dbg   :   out std_logic_vector(2 downto 0)
        );
end entity;

architecture rtl of DDR3 is

    type state_type is (IDLE, WRITE, WAIT_WRITE, READ, WAIT_DATA, DONE);
    signal state : state_type := IDLE;
        
    signal addr_aligned : std_logic_vector(27 downto 0);
    signal count : integer range 0 to 7 := 0;
        
begin
    
    addr_aligned <= test_addr(27 downto 3) & "000";
    
    with state select
    state_dbg <=
        "001" when IDLE,
        "010" when WRITE,
        "011" when WAIT_WRITE,
        "100" when READ,
        "101" when WAIT_DATA,
        "110" when DONE,
        "111" when others;
        
    process(clk_ui)
    begin
    
        if rising_edge(clk_ui) then
        
            if rst = '1' then
                app_addr    <=  (others => '0');
                app_cmd     <=  (others => '0');
                app_en      <=  '0';
                app_wdf_data<=  (others => '0');
                app_wdf_wren<=  '0';
                app_wdf_end <=  '0';
                app_wdf_mask<=  (others => '0');
                read_data   <=  (others => '0');
                count   <=  0;
                state   <= IDLE;
        
            else
            
                case state is
                
                    when IDLE =>
                    
                    if init_calib_complete = '1' then
                        
                        if rw_cmd = "000" then
                            state   <= WRITE;
--                            app_en  <= '1';
                            
                        elsif rw_cmd = "001" then
                            state <= READ;
--                            app_en   <= '1';
                            
                        end if;
                        
                    end if;
                    
                    when WRITE =>
                        app_cmd <= "000";
                        app_addr <= addr_aligned;
                        app_wdf_data <= test_data;
                    if app_rdy='1' and app_wdf_rdy = '1' then
                        app_en  <= '1';
                        
                        app_wdf_wren <= '1';
                        app_wdf_end  <= '1';
                        app_wdf_mask <= "00000000";
                        count   <=  0;
                        state <= WAIT_WRITE;
                    
--                    else
--                        app_en  <= '0';
--                        app_wdf_wren <= '0';
--                        app_wdf_end  <= '0';
                        
                    end if;
                    when WAIT_WRITE =>
                        
                        count   <=  count + 1;
                        if count = 5 then
                            count   <=  0;
                            state   <= DONE;
                        end if;
                    
                    
                    when READ =>
                    app_cmd <= "001";
                    if app_rdy='1' then
                        app_en  <= '1';
                        
                        app_addr <= addr_aligned;
                        state <= WAIT_DATA;
                    
                    end if;
                    
                    when WAIT_DATA =>
                    
                    if app_rd_data_valid = '1' then
                        read_data   <=  app_rd_data;
                        state   <= DONE;
--                        if app_rd_data = test_data then
--                            state <= IDLE;
                            
--                        else
--                            state <= WAIT_DATA;
                            
--                        end if;
                    
                    end if;
                    
                    when DONE =>
                    
                        app_en  <= '0';
                        app_wdf_wren <= '0';
                        app_wdf_end  <= '0';
                        state <= IDLE;
                    
                    when OTHERS =>
                    
                        state <= IDLE;
                
                end case;
                
            end if;
        
        end if;
        
    end process;

end rtl;
