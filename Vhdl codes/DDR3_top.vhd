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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DDR3_top is
    port(clk        :   in std_logic;
        
--        sys_rst         :   in std_logic;
    
      ddr3_dq       : inout std_logic_vector(15 downto 0);
      ddr3_dqs_p    : inout std_logic_vector(1 downto 0);
      ddr3_dqs_n    : inout std_logic_vector(1 downto 0);

      ddr3_addr     : out   std_logic_vector(13 downto 0);
      ddr3_ba       : out   std_logic_vector(2 downto 0);
      ddr3_ras_n    : out   std_logic;
      ddr3_cas_n    : out   std_logic;
      ddr3_we_n     : out   std_logic;
      ddr3_reset_n  : out   std_logic;
      ddr3_ck_p     : out   std_logic_vector(0 downto 0);
      ddr3_ck_n     : out   std_logic_vector(0 downto 0);
      ddr3_cke      : out   std_logic_vector(0 downto 0);
	  ddr3_cs_n     : out   std_logic_vector(0 downto 0);
      ddr3_dm       : out   std_logic_vector(1 downto 0);
      ddr3_odt      : out   std_logic_vector(0 downto 0);
        
        led : out std_logic
        
--        test_data   :  in std_logic_vector(31 downto 0);
--        test_addr   :  in std_logic_vector(27 downto 0);
--        write_cmd   :  in std_logic_vector(2 downto 0);
--        read_cmd    :  in std_logic_vector(2 downto 0)
--        read_data   :  out std_logic_vector(31 downto 0)
        );

end entity;

architecture rtl of DDR3_top is
    
    signal test_data    :  std_logic_vector(63 downto 0);
    signal test_addr    :  std_logic_vector(27 downto 0);
    signal rw_cmd    :  std_logic_vector(2 downto 0);
    signal read_data    :  std_logic_vector(63 downto 0) := (others => '0');
    
    signal clk_ref_i : std_logic;
    signal sys_rst   : std_logic;
    signal sys_clk   : std_logic;
    signal clk_fb    : std_logic;
    signal ila_clk   : std_logic;
        
    signal app_addr : std_logic_vector(27 downto 0);
    signal app_cmd  : std_logic_vector(2 downto 0);
    signal app_en   : std_logic;
    
    signal app_wdf_data : std_logic_vector(63 downto 0);
    signal app_wdf_wren : std_logic;
    signal app_wdf_end  : std_logic;
    signal app_wdf_mask : std_logic_vector(7 downto 0);
    
    signal app_rd_data       : std_logic_vector(63 downto 0);
    signal app_rd_data_valid : std_logic;
    
    signal app_rd_data_end  : std_logic;
    signal app_sr_req       : std_logic;
    signal app_ref_req      : std_logic;
    signal app_zq_req       : std_logic;
    signal app_sr_active    : std_logic;
    signal app_ref_ack      : std_logic;
    signal app_zq_ack       : std_logic;
    signal ui_clk_sync_rst  : std_logic;
    
    signal app_rdy     : std_logic;
    signal app_wdf_rdy : std_logic;
    
    signal ui_clk : std_logic;
    
    signal init_calib_complete : std_logic;
    
    signal state_dbg : std_logic_vector(2 downto 0);
    
    component mig_7series_0

  port (
      ddr3_dq       : inout std_logic_vector(15 downto 0);
      ddr3_dqs_p    : inout std_logic_vector(1 downto 0);
      ddr3_dqs_n    : inout std_logic_vector(1 downto 0);

      ddr3_addr     : out   std_logic_vector(13 downto 0);
      ddr3_ba       : out   std_logic_vector(2 downto 0);
      ddr3_ras_n    : out   std_logic;
      ddr3_cas_n    : out   std_logic;
      ddr3_we_n     : out   std_logic;
      ddr3_reset_n  : out   std_logic;
      ddr3_ck_p     : out   std_logic_vector(0 downto 0);
      ddr3_ck_n     : out   std_logic_vector(0 downto 0);
      ddr3_cke      : out   std_logic_vector(0 downto 0);
	  ddr3_cs_n     : out   std_logic_vector(0 downto 0);
      ddr3_dm       : out   std_logic_vector(1 downto 0);
      ddr3_odt      : out   std_logic_vector(0 downto 0);

      app_addr                  : in    std_logic_vector(27 downto 0);
      app_cmd                   : in    std_logic_vector(2 downto 0);
      app_en                    : in    std_logic;
      app_wdf_data              : in    std_logic_vector(63 downto 0);
      app_wdf_end               : in    std_logic;
      app_wdf_mask         : in    std_logic_vector(7 downto 0);
      app_wdf_wren              : in    std_logic;
      app_rd_data               : out   std_logic_vector(63 downto 0);
      app_rd_data_end           : out   std_logic;
      app_rd_data_valid         : out   std_logic;
      app_rdy                   : out   std_logic;
      app_wdf_rdy               : out   std_logic;
      app_sr_req                : in    std_logic;
      app_ref_req               : in    std_logic;
      app_zq_req                : in    std_logic;
      app_sr_active             : out   std_logic;
      app_ref_ack               : out   std_logic;
      app_zq_ack                : out   std_logic;
      
      ui_clk                    : out   std_logic;
      ui_clk_sync_rst           : out   std_logic;
      init_calib_complete       : out   std_logic;
      -- System Clock Ports
      sys_clk_i                      : in    std_logic;
      -- Reference Clock Ports
      clk_ref_i                                : in    std_logic;
    sys_rst                     : in    std_logic

  );

end component mig_7series_0;
  
  component DDR3
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
end component;


COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_out0 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

component clk_wiz_0
port
 (-- Clock in ports
  clkfb_in          : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic;
  clkfb_out         : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

component clk_wiz_1
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;

	probe0 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe6 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;


begin

u_mig_7series_0 : mig_7series_0

    port map (
       -- Memory interface ports
       ddr3_addr                      => ddr3_addr,
       ddr3_ba                        => ddr3_ba,
       ddr3_cas_n                     => ddr3_cas_n,
       ddr3_ck_n                      => ddr3_ck_n,
       ddr3_ck_p                      => ddr3_ck_p,
       ddr3_cke                       => ddr3_cke,
       ddr3_ras_n                     => ddr3_ras_n,
       ddr3_reset_n                   => ddr3_reset_n,
       ddr3_we_n                      => ddr3_we_n,
       ddr3_dq                        => ddr3_dq,
       ddr3_dqs_n                     => ddr3_dqs_n,
       ddr3_dqs_p                     => ddr3_dqs_p,

       init_calib_complete            => init_calib_complete,

	   ddr3_cs_n                      => ddr3_cs_n,
       ddr3_dm                        => ddr3_dm,
       ddr3_odt                       => ddr3_odt,
       -- Application interface ports
       app_addr                       => app_addr,
       app_cmd                        => app_cmd,
       app_en                         => app_en,
       app_wdf_data                   => app_wdf_data,
       app_wdf_end                    => app_wdf_end,
       app_wdf_wren                   => app_wdf_wren,

       app_rd_data                    => app_rd_data,
       app_rd_data_end                => app_rd_data_end,
       app_rd_data_valid              => app_rd_data_valid,
       app_rdy                        => app_rdy,
       app_wdf_rdy                    => app_wdf_rdy,

       app_sr_req                     => '0', --app_sr_req,
       app_ref_req                    => '0',--app_ref_req,
       app_zq_req                     => '0',--app_zq_req,
       app_sr_active                  => app_sr_active,
       app_ref_ack                    => app_ref_ack,
       app_zq_ack                     => app_zq_ack,

       ui_clk                         => ui_clk,
       ui_clk_sync_rst                => ui_clk_sync_rst,
       app_wdf_mask                   => app_wdf_mask,
       -- System Clock Ports
       sys_clk_i                       => clk,
       -- Reference Clock Ports
       clk_ref_i                      => clk_ref_i,
       sys_rst                        => sys_rst
    );
    
    DDR3_cntr : DDR3
        port map(
        clk_ui => ui_clk,
        rst => ui_clk_sync_rst,
        
        init_calib_complete => init_calib_complete,
        
        test_data => test_data,
        test_addr => test_addr,
        rw_cmd => rw_cmd,
        read_data => read_data,
        
        app_rdy => app_rdy,
        app_wdf_rdy => app_wdf_rdy,
        
        app_rd_data => app_rd_data,
        app_rd_data_valid => app_rd_data_valid,
        
        app_addr => app_addr,
        app_cmd  => app_cmd,
        app_en   => app_en,
        
        app_wdf_data => app_wdf_data,
        app_wdf_wren => app_wdf_wren,
        app_wdf_end  => app_wdf_end,
        app_wdf_mask => app_wdf_mask,
        state_dbg    => state_dbg
        
        );
                
        test : vio_0
  PORT MAP (
    clk => ila_clk,
    probe_out0 => test_data,
    probe_out1 => test_addr,
    probe_out2 => rw_cmd,
    probe_out3 => open,
    probe_out4(0) => sys_rst
  );
  
  output : ila_0
PORT MAP (
	clk => ila_clk,

	probe0 => app_rd_data,
	probe1(0) => init_calib_complete,
	probe2(0) => app_rdy,
	probe3(0) => app_wdf_rdy,
	probe4(0) => app_wdf_wren,
	probe5(0) => app_rd_data_valid,
	probe6    => state_dbg, 
	probe7(0) => clk, 
	probe8(0) => ui_clk,
	probe9(0) => ui_clk_sync_rst
);

        clock_0 : clk_wiz_0
   port map ( 
   clkfb_in => clk_fb,
  -- Clock out ports  
   clk_out1 => clk_ref_i,
   clkfb_out => clk_fb,
   -- Clock in ports
   clk_in1 => clk
 );
 
clock_1 : clk_wiz_1
   port map ( 
  -- Clock out ports  
   clk_out1 => ila_clk,
   -- Clock in ports
   clk_in1 => clk
 );
 
 led <= app_rd_data_valid;
 
end rtl;