--
--Written by GowinSynthesis
--Tool Version "V1.9.10 (64-bit)"
--Sun Aug 18 14:57:47 2024

--Source file index table:
--file0 "\C:/Gowin/Gowin_V1.9.10_x64/IDE/ipcore/PSRAM_HS/data/PSRAM_TOP.v"
--file1 "\C:/Gowin/Gowin_V1.9.10_x64/IDE/ipcore/PSRAM_HS/data/psram_code.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library gw1n;
use gw1n.components.all;

entity PSRAM_Memory_Interface_HS_Top is
port(
  clk :  in std_logic;
  memory_clk :  in std_logic;
  pll_lock :  in std_logic;
  rst_n :  in std_logic;
  O_psram_ck :  out std_logic_vector(1 downto 0);
  O_psram_ck_n :  out std_logic_vector(1 downto 0);
  IO_psram_dq :  inout std_logic_vector(15 downto 0);
  IO_psram_rwds :  inout std_logic_vector(1 downto 0);
  O_psram_cs_n :  out std_logic_vector(1 downto 0);
  O_psram_reset_n :  out std_logic_vector(1 downto 0);
  wr_data :  in std_logic_vector(63 downto 0);
  rd_data :  out std_logic_vector(63 downto 0);
  rd_data_valid :  out std_logic;
  addr :  in std_logic_vector(20 downto 0);
  cmd :  in std_logic;
  cmd_en :  in std_logic;
  init_calib :  out std_logic;
  clk_out :  out std_logic;
  data_mask :  in std_logic_vector(7 downto 0));
end PSRAM_Memory_Interface_HS_Top;
architecture beh of PSRAM_Memory_Interface_HS_Top is
  signal u_psram_top_dll_lock : std_logic ;
  signal u_psram_top_clk_x2p : std_logic ;
  signal u_psram_top_u_psram_wd_iodelayn0 : std_logic ;
  signal \u_psram_top_u_psram_wd_ck_delay[0].iodelay\ : std_logic ;
  signal \u_psram_top_u_psram_wd_ck_delay[1].iodelay\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_oser4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_genclkpos.u_ck_gen\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_genclkpos.u_ckn_gen\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_cs_oser4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_genclkneg.u_ck_gen\ : std_logic ;
  signal u_psram_top_rd_data_valid_d : std_logic ;
  signal u_psram_top_u_psram_wd_dll_lock_d : std_logic ;
  signal u_psram_top_u_psram_wd_dll_lock_d0 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_datats\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.TVCS_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.CONFIG_CR\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.WRITE_DATA\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.INIT_CALIB_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\ : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.INIT_CALIB_DONE\ : std_logic ;
  signal u_psram_top_u_psram_init_Tvcs_done : std_logic ;
  signal u_psram_top_u_psram_init_config_done_Z : std_logic ;
  signal u_psram_top_u_psram_init_write_done : std_logic ;
  signal u_psram_top_u_psram_init_cmd_calib : std_logic ;
  signal u_psram_top_u_psram_init_cmd_en_calib : std_logic ;
  signal u_psram_top_u_psram_init_rd_data_valid_d : std_logic ;
  signal u_psram_top_u_psram_init_timer_cnt1_clr : std_logic ;
  signal u_psram_top_u_psram_init_phase_over : std_logic ;
  signal \u_psram_top_u_psram_init_c_state.IDLE\ : std_logic ;
  signal u_psram_top_u_psram_sync_lock_d2 : std_logic ;
  signal u_psram_top_u_psram_sync_stop : std_logic ;
  signal u_psram_top_u_psram_sync_dll_rsti : std_logic ;
  signal u_psram_top_u_psram_sync_uddcntln : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\ : std_logic ;
  signal u_psram_top_u_psram_wd_n372 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_24 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_25 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_26 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_27 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_28 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_29 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_30 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_31 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_32 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_33 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_34 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_35 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_36 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_37 : std_logic ;
  signal u_psram_top_u_psram_wd_n372_38 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_31\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_30\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_29\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_28\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_27\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_26\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_25\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_24\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_23\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_22\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_21\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_20\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_19\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_18\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_17\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_16\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_15\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_14\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_12\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_11\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_9\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_7\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_5\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_3\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_2\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_1\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0_9\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_31\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_30\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_29\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_28\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_27\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_26\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_25\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_24\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_23\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_22\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_21\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_20\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_19\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_18\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_17\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_16\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_15\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_14\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_12\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_11\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_9\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_7\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_5\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_3\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_2\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_1\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_0\ : std_logic ;
  signal u_psram_top_u_psram_wd_n381 : std_logic ;
  signal u_psram_top_u_psram_wd_n381_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n380 : std_logic ;
  signal u_psram_top_u_psram_wd_n380_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n379 : std_logic ;
  signal u_psram_top_u_psram_wd_n379_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n378 : std_logic ;
  signal u_psram_top_u_psram_wd_n378_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n377 : std_logic ;
  signal u_psram_top_u_psram_wd_n377_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n376 : std_logic ;
  signal u_psram_top_u_psram_wd_n376_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n375 : std_logic ;
  signal u_psram_top_u_psram_wd_n375_2 : std_logic ;
  signal u_psram_top_u_psram_wd_n374 : std_logic ;
  signal u_psram_top_u_psram_wd_n374_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1130 : std_logic ;
  signal u_psram_top_u_psram_init_n1130_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1129 : std_logic ;
  signal u_psram_top_u_psram_init_n1129_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1128 : std_logic ;
  signal u_psram_top_u_psram_init_n1128_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1127 : std_logic ;
  signal u_psram_top_u_psram_init_n1127_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1274 : std_logic ;
  signal u_psram_top_u_psram_init_n1274_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1273 : std_logic ;
  signal u_psram_top_u_psram_init_n1273_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1272 : std_logic ;
  signal u_psram_top_u_psram_init_n1272_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1271 : std_logic ;
  signal u_psram_top_u_psram_init_n1271_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1270 : std_logic ;
  signal u_psram_top_u_psram_init_n1270_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1269 : std_logic ;
  signal u_psram_top_u_psram_init_n1269_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1268 : std_logic ;
  signal u_psram_top_u_psram_init_n1268_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1492 : std_logic ;
  signal u_psram_top_u_psram_init_n1492_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1491 : std_logic ;
  signal u_psram_top_u_psram_init_n1491_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1490 : std_logic ;
  signal u_psram_top_u_psram_init_n1490_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1489 : std_logic ;
  signal u_psram_top_u_psram_init_n1489_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1745 : std_logic ;
  signal u_psram_top_u_psram_init_n1745_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1744 : std_logic ;
  signal u_psram_top_u_psram_init_n1744_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1743 : std_logic ;
  signal u_psram_top_u_psram_init_n1743_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1742 : std_logic ;
  signal u_psram_top_u_psram_init_n1742_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1741 : std_logic ;
  signal u_psram_top_u_psram_init_n1741_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1740 : std_logic ;
  signal u_psram_top_u_psram_init_n1740_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1739 : std_logic ;
  signal u_psram_top_u_psram_init_n1739_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1963 : std_logic ;
  signal u_psram_top_u_psram_init_n1963_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1962 : std_logic ;
  signal u_psram_top_u_psram_init_n1962_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1961 : std_logic ;
  signal u_psram_top_u_psram_init_n1961_2 : std_logic ;
  signal u_psram_top_u_psram_init_n1960 : std_logic ;
  signal u_psram_top_u_psram_init_n1960_2 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_en\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n881\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n905\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1323\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1332\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n767\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n771\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1323\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1332\ : std_logic ;
  signal u_psram_top_u_psram_init_n162 : std_logic ;
  signal u_psram_top_u_psram_init_n245 : std_logic ;
  signal u_psram_top_u_psram_init_n583 : std_logic ;
  signal u_psram_top_u_psram_init_n628 : std_logic ;
  signal u_psram_top_u_psram_init_n1212 : std_logic ;
  signal u_psram_top_u_psram_init_n1229 : std_logic ;
  signal u_psram_top_u_psram_init_n1250 : std_logic ;
  signal u_psram_top_u_psram_init_n1265 : std_logic ;
  signal u_psram_top_u_psram_init_n1410 : std_logic ;
  signal u_psram_top_u_psram_init_n1443 : std_logic ;
  signal u_psram_top_u_psram_init_n1444 : std_logic ;
  signal u_psram_top_u_psram_init_n1445 : std_logic ;
  signal u_psram_top_u_psram_init_n1446 : std_logic ;
  signal u_psram_top_u_psram_init_n1447 : std_logic ;
  signal u_psram_top_u_psram_init_n1448 : std_logic ;
  signal u_psram_top_u_psram_init_n1449 : std_logic ;
  signal u_psram_top_u_psram_init_n1450 : std_logic ;
  signal u_psram_top_u_psram_init_n1451 : std_logic ;
  signal u_psram_top_u_psram_init_n1452 : std_logic ;
  signal u_psram_top_u_psram_init_n1453 : std_logic ;
  signal u_psram_top_u_psram_init_n1454 : std_logic ;
  signal u_psram_top_u_psram_init_n1455 : std_logic ;
  signal u_psram_top_u_psram_init_n1456 : std_logic ;
  signal u_psram_top_u_psram_init_n1457 : std_logic ;
  signal u_psram_top_u_psram_init_n1458 : std_logic ;
  signal u_psram_top_u_psram_init_n1459 : std_logic ;
  signal u_psram_top_u_psram_init_n1460 : std_logic ;
  signal u_psram_top_u_psram_init_n1461 : std_logic ;
  signal u_psram_top_u_psram_init_n1462 : std_logic ;
  signal u_psram_top_u_psram_init_n1463 : std_logic ;
  signal u_psram_top_u_psram_init_n1464 : std_logic ;
  signal u_psram_top_u_psram_init_n1465 : std_logic ;
  signal u_psram_top_u_psram_init_n1466 : std_logic ;
  signal u_psram_top_u_psram_init_n1467 : std_logic ;
  signal u_psram_top_u_psram_init_n1468 : std_logic ;
  signal u_psram_top_u_psram_init_n1469 : std_logic ;
  signal u_psram_top_u_psram_init_n1470 : std_logic ;
  signal u_psram_top_u_psram_init_n1471 : std_logic ;
  signal u_psram_top_u_psram_init_n1472 : std_logic ;
  signal u_psram_top_u_psram_init_n1473 : std_logic ;
  signal u_psram_top_u_psram_init_n1474 : std_logic ;
  signal u_psram_top_u_psram_init_n1620 : std_logic ;
  signal u_psram_top_u_psram_init_n1700 : std_logic ;
  signal u_psram_top_u_psram_init_n1721 : std_logic ;
  signal u_psram_top_u_psram_init_n1736 : std_logic ;
  signal u_psram_top_u_psram_init_n1881 : std_logic ;
  signal u_psram_top_u_psram_init_n1914 : std_logic ;
  signal u_psram_top_u_psram_init_n1915 : std_logic ;
  signal u_psram_top_u_psram_init_n1916 : std_logic ;
  signal u_psram_top_u_psram_init_n1917 : std_logic ;
  signal u_psram_top_u_psram_init_n1918 : std_logic ;
  signal u_psram_top_u_psram_init_n1919 : std_logic ;
  signal u_psram_top_u_psram_init_n1920 : std_logic ;
  signal u_psram_top_u_psram_init_n1921 : std_logic ;
  signal u_psram_top_u_psram_init_n1922 : std_logic ;
  signal u_psram_top_u_psram_init_n1923 : std_logic ;
  signal u_psram_top_u_psram_init_n1924 : std_logic ;
  signal u_psram_top_u_psram_init_n1925 : std_logic ;
  signal u_psram_top_u_psram_init_n1926 : std_logic ;
  signal u_psram_top_u_psram_init_n1927 : std_logic ;
  signal u_psram_top_u_psram_init_n1928 : std_logic ;
  signal u_psram_top_u_psram_init_n1929 : std_logic ;
  signal u_psram_top_u_psram_init_n1930 : std_logic ;
  signal u_psram_top_u_psram_init_n1931 : std_logic ;
  signal u_psram_top_u_psram_init_n1932 : std_logic ;
  signal u_psram_top_u_psram_init_n1933 : std_logic ;
  signal u_psram_top_u_psram_init_n1934 : std_logic ;
  signal u_psram_top_u_psram_init_n1935 : std_logic ;
  signal u_psram_top_u_psram_init_n1936 : std_logic ;
  signal u_psram_top_u_psram_init_n1937 : std_logic ;
  signal u_psram_top_u_psram_init_n1938 : std_logic ;
  signal u_psram_top_u_psram_init_n1939 : std_logic ;
  signal u_psram_top_u_psram_init_n1940 : std_logic ;
  signal u_psram_top_u_psram_init_n1941 : std_logic ;
  signal u_psram_top_u_psram_init_n1942 : std_logic ;
  signal u_psram_top_u_psram_init_n1943 : std_logic ;
  signal u_psram_top_u_psram_init_n1944 : std_logic ;
  signal u_psram_top_u_psram_init_n1945 : std_logic ;
  signal u_psram_top_u_psram_init_n2091 : std_logic ;
  signal u_psram_top_u_psram_sync_n13 : std_logic ;
  signal u_psram_top_u_psram_sync_n86 : std_logic ;
  signal u_psram_top_n492 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n919\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538\ : std_logic ;
  signal u_psram_top_u_psram_wd_rd_data_valid_d0 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_valid_d\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_rd_data_valid_d\ : std_logic ;
  signal u_psram_top_u_psram_init_wr_data_63 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2\ : std_logic ;
  signal u_psram_top_u_psram_init_VALUE_0 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].wr_ptr_2\ : std_logic ;
  signal u_psram_top_u_psram_init_VALUE_1 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.IDLE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.TVCS_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.CONFIG_CR\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.WRITE_DATA\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_PHASE_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_PHASE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.INIT_CALIB_DONE\ : std_logic ;
  signal u_psram_top_u_psram_sync_n348 : std_logic ;
  signal u_psram_top_u_psram_sync_n359 : std_logic ;
  signal u_psram_top_u_psram_sync_n282 : std_logic ;
  signal u_psram_top_u_psram_sync_n293 : std_logic ;
  signal u_psram_top_u_psram_sync_n304 : std_logic ;
  signal u_psram_top_u_psram_sync_n315 : std_logic ;
  signal u_psram_top_u_psram_sync_n326 : std_logic ;
  signal u_psram_top_u_psram_sync_n337 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1191\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n786\ : std_logic ;
  signal u_psram_top_u_psram_init_n1857 : std_logic ;
  signal u_psram_top_u_psram_init_n1856 : std_logic ;
  signal u_psram_top_u_psram_init_n1855 : std_logic ;
  signal u_psram_top_u_psram_init_n1854 : std_logic ;
  signal u_psram_top_u_psram_init_n1853 : std_logic ;
  signal u_psram_top_u_psram_init_n1852 : std_logic ;
  signal u_psram_top_u_psram_init_n1671 : std_logic ;
  signal u_psram_top_u_psram_init_n1670 : std_logic ;
  signal u_psram_top_u_psram_init_n1669 : std_logic ;
  signal u_psram_top_u_psram_init_n1386 : std_logic ;
  signal u_psram_top_u_psram_init_n1385 : std_logic ;
  signal u_psram_top_u_psram_init_n1384 : std_logic ;
  signal u_psram_top_u_psram_init_n1383 : std_logic ;
  signal u_psram_top_u_psram_init_n1382 : std_logic ;
  signal u_psram_top_u_psram_init_n1381 : std_logic ;
  signal u_psram_top_u_psram_init_n1200 : std_logic ;
  signal u_psram_top_u_psram_init_n1199 : std_logic ;
  signal u_psram_top_u_psram_init_n1198 : std_logic ;
  signal u_psram_top_u_psram_init_n1166 : std_logic ;
  signal u_psram_top_u_psram_init_n1164 : std_logic ;
  signal u_psram_top_u_psram_init_n1085 : std_logic ;
  signal u_psram_top_u_psram_init_n1084 : std_logic ;
  signal u_psram_top_u_psram_init_n1083 : std_logic ;
  signal u_psram_top_u_psram_init_n1082 : std_logic ;
  signal u_psram_top_u_psram_init_n1081 : std_logic ;
  signal u_psram_top_u_psram_init_n1080 : std_logic ;
  signal u_psram_top_u_psram_init_n1079 : std_logic ;
  signal u_psram_top_u_psram_init_n1078 : std_logic ;
  signal u_psram_top_u_psram_init_n1077 : std_logic ;
  signal u_psram_top_u_psram_init_n901 : std_logic ;
  signal u_psram_top_u_psram_init_n194 : std_logic ;
  signal u_psram_top_u_psram_init_n193 : std_logic ;
  signal u_psram_top_u_psram_init_n191 : std_logic ;
  signal u_psram_top_u_psram_init_n190 : std_logic ;
  signal u_psram_top_u_psram_init_n188 : std_logic ;
  signal u_psram_top_u_psram_init_n187 : std_logic ;
  signal u_psram_top_u_psram_init_n185 : std_logic ;
  signal u_psram_top_u_psram_init_n184 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1306\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1305\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1304\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n136\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1305\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1304\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n136\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1196\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1190\ : std_logic ;
  signal u_psram_top_u_psram_sync_n389 : std_logic ;
  signal u_psram_top_u_psram_sync_n388 : std_logic ;
  signal u_psram_top_u_psram_sync_n387 : std_logic ;
  signal u_psram_top_u_psram_sync_n49 : std_logic ;
  signal u_psram_top_u_psram_sync_n46 : std_logic ;
  signal u_psram_top_u_psram_sync_n44 : std_logic ;
  signal u_psram_top_u_psram_sync_n42 : std_logic ;
  signal u_psram_top_u_psram_sync_n40 : std_logic ;
  signal u_psram_top_u_psram_sync_n39 : std_logic ;
  signal u_psram_top_u_psram_sync_n38 : std_logic ;
  signal u_psram_top_u_psram_sync_n37 : std_logic ;
  signal u_psram_top_u_psram_sync_n36 : std_logic ;
  signal u_psram_top_u_psram_init_n1720 : std_logic ;
  signal u_psram_top_u_psram_init_n1719 : std_logic ;
  signal u_psram_top_u_psram_init_n1249 : std_logic ;
  signal u_psram_top_u_psram_init_n1248 : std_logic ;
  signal u_psram_top_rd_data_valid_calib : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\ : std_logic ;
  signal u_psram_top_u_psram_init_n596 : std_logic ;
  signal u_psram_top_u_psram_init_n594 : std_logic ;
  signal u_psram_top_u_psram_init_n258 : std_logic ;
  signal u_psram_top_u_psram_init_n257 : std_logic ;
  signal u_psram_top_u_psram_init_n256 : std_logic ;
  signal u_psram_top_u_psram_init_n906 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_16\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_12\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_9\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_5\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2_5\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1_5\ : std_logic ;
  signal u_psram_top_u_psram_init_n2437 : std_logic ;
  signal u_psram_top_u_psram_init_n162_4 : std_logic ;
  signal u_psram_top_u_psram_init_n162_5 : std_logic ;
  signal u_psram_top_u_psram_init_n162_6 : std_logic ;
  signal u_psram_top_u_psram_init_n162_7 : std_logic ;
  signal u_psram_top_u_psram_init_out_dq_Z_15 : std_logic ;
  signal u_psram_top_u_psram_init_n628_7 : std_logic ;
  signal u_psram_top_u_psram_init_n628_8 : std_logic ;
  signal u_psram_top_u_psram_init_n1150 : std_logic ;
  signal u_psram_top_u_psram_init_n1229_6 : std_logic ;
  signal u_psram_top_u_psram_init_n1265_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1265_5 : std_logic ;
  signal u_psram_top_u_psram_init_n1265_6 : std_logic ;
  signal u_psram_top_u_psram_init_n1410_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1410_5 : std_logic ;
  signal u_psram_top_u_psram_init_n1444_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1445_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1446_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1447_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1448_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1449_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1450_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1451_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1459_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1467_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1700_6 : std_logic ;
  signal u_psram_top_u_psram_init_n1736_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1736_5 : std_logic ;
  signal u_psram_top_u_psram_init_n1736_6 : std_logic ;
  signal u_psram_top_u_psram_init_n2469 : std_logic ;
  signal u_psram_top_u_psram_init_n1881_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1881_5 : std_logic ;
  signal u_psram_top_u_psram_init_n1922_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1930_4 : std_logic ;
  signal u_psram_top_u_psram_init_n1938_4 : std_logic ;
  signal u_psram_top_u_psram_sync_n86_4 : std_logic ;
  signal u_psram_top_u_psram_sync_n86_5 : std_logic ;
  signal u_psram_top_u_psram_sync_n86_6 : std_logic ;
  signal u_psram_top_u_psram_sync_n86_7 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n919\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4\ : std_logic ;
  signal u_psram_top_u_psram_init_wr_data_63_6 : std_logic ;
  signal u_psram_top_u_psram_init_read_over : std_logic ;
  signal u_psram_top_u_psram_init_read_over_10 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_9\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_10\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_11\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_9\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_10\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_11\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_21\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_22\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE_20\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_20\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_19\ : std_logic ;
  signal u_psram_top_u_psram_sync_n348_12 : std_logic ;
  signal u_psram_top_u_psram_sync_n348_13 : std_logic ;
  signal u_psram_top_u_psram_sync_n359_11 : std_logic ;
  signal u_psram_top_u_psram_sync_n359_12 : std_logic ;
  signal u_psram_top_u_psram_sync_n359_13 : std_logic ;
  signal u_psram_top_u_psram_sync_n282_17 : std_logic ;
  signal u_psram_top_u_psram_sync_n282_18 : std_logic ;
  signal u_psram_top_u_psram_sync_n293_17 : std_logic ;
  signal u_psram_top_u_psram_sync_n293_18 : std_logic ;
  signal u_psram_top_u_psram_sync_n304_17 : std_logic ;
  signal u_psram_top_u_psram_sync_n315_17 : std_logic ;
  signal u_psram_top_u_psram_sync_n315_18 : std_logic ;
  signal u_psram_top_u_psram_sync_n326_17 : std_logic ;
  signal u_psram_top_u_psram_sync_n337_17 : std_logic ;
  signal u_psram_top_u_psram_init_n1854_7 : std_logic ;
  signal u_psram_top_u_psram_init_n1383_7 : std_logic ;
  signal u_psram_top_u_psram_init_n1167 : std_logic ;
  signal u_psram_top_u_psram_init_n1082_7 : std_logic ;
  signal u_psram_top_u_psram_init_n1079_7 : std_logic ;
  signal u_psram_top_u_psram_init_n1077_7 : std_logic ;
  signal u_psram_top_u_psram_init_n901_8 : std_logic ;
  signal u_psram_top_u_psram_init_n192 : std_logic ;
  signal u_psram_top_u_psram_init_n186 : std_logic ;
  signal u_psram_top_u_psram_init_n183 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303_7\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303_7\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_0\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_17\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_21\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_20\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_25\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_24\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_28\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_31\ : std_logic ;
  signal u_psram_top_u_psram_sync_n389_8 : std_logic ;
  signal u_psram_top_u_psram_sync_n387_7 : std_logic ;
  signal u_psram_top_u_psram_sync_n51 : std_logic ;
  signal u_psram_top_u_psram_sync_n48 : std_logic ;
  signal u_psram_top_u_psram_sync_n45 : std_logic ;
  signal u_psram_top_u_psram_sync_n41 : std_logic ;
  signal u_psram_top_u_psram_sync_n39_6 : std_logic ;
  signal u_psram_top_u_psram_init_out_dq_Z_16 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298_7\ : std_logic ;
  signal u_psram_top_u_psram_init_n256_6 : std_logic ;
  signal u_psram_top_u_psram_init_n2437_5 : std_logic ;
  signal u_psram_top_u_psram_init_n2437_6 : std_logic ;
  signal u_psram_top_u_psram_init_n2469_5 : std_logic ;
  signal u_psram_top_u_psram_init_n2469_6 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_12\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_13\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_14\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_15\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_16\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_12\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_13\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_14\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_15\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_16\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_25\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_22\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_23\ : std_logic ;
  signal u_psram_top_u_psram_sync_n348_14 : std_logic ;
  signal u_psram_top_u_psram_sync_n348_15 : std_logic ;
  signal u_psram_top_u_psram_sync_n348_16 : std_logic ;
  signal u_psram_top_u_psram_init_n189 : std_logic ;
  signal u_psram_top_u_psram_init_n183_8 : std_logic ;
  signal u_psram_top_u_psram_init_n183_9 : std_logic ;
  signal u_psram_top_u_psram_sync_n43 : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_17\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_18\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_19\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_20\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_21\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_22\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_23\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_24\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_25\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_26\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_17\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_18\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_19\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_20\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_21\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_22\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_23\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_24\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_25\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_26\ : std_logic ;
  signal u_psram_top_u_psram_sync_ddr_rsti : std_logic ;
  signal u_psram_top_u_psram_init_n1382_9 : std_logic ;
  signal u_psram_top_u_psram_init_n181 : std_logic ;
  signal u_psram_top_u_psram_init_n182 : std_logic ;
  signal u_psram_top_u_psram_init_n1853_9 : std_logic ;
  signal u_psram_top_u_psram_init_n189_10 : std_logic ;
  signal u_psram_top_u_psram_init_n245_11 : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_27\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_29\ : std_logic ;
  signal u_psram_top_u_psram_sync_n348_19 : std_logic ;
  signal u_psram_top_u_psram_sync_n348_21 : std_logic ;
  signal u_psram_top_u_psram_sync_n38_8 : std_logic ;
  signal u_psram_top_u_psram_sync_n43_9 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg_10\ : std_logic ;
  signal \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2_11\ : std_logic ;
  signal u_psram_top_u_psram_init_read_cnt_8 : std_logic ;
  signal u_psram_top_u_psram_init_n1915_6 : std_logic ;
  signal u_psram_top_u_psram_init_n1444_7 : std_logic ;
  signal u_psram_top_u_psram_init_n1150_12 : std_logic ;
  signal u_psram_top_u_psram_init_n1165 : std_logic ;
  signal u_psram_top_u_psram_init_n1167_9 : std_logic ;
  signal u_psram_top_u_psram_init_n902 : std_logic ;
  signal u_psram_top_u_psram_init_n904 : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_31\ : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_25\ : std_logic ;
  signal u_psram_top_u_psram_sync_n47 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_mem_data\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_mem_data\ : std_logic ;
  signal u_psram_top_u_psram_init_SDTAP_1 : std_logic ;
  signal u_psram_top_u_psram_init_SDTAP_0 : std_logic ;
  signal u_psram_top_u_psram_sync_n348_23 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg_12\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg_10\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n137\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n138\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n137\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n138\ : std_logic ;
  signal u_psram_top_u_psram_init_wr_data_63_9 : std_logic ;
  signal u_psram_top_u_psram_init_n583_10 : std_logic ;
  signal u_psram_top_u_psram_init_n595 : std_logic ;
  signal u_psram_top_u_psram_sync_n389_11 : std_logic ;
  signal u_psram_top_u_psram_init_n259 : std_logic ;
  signal u_psram_top_u_psram_init_n597 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1_13\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0_14\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n764\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n765\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n768\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n769\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n772\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n773\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n776\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n777\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n780\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n781\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n784\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n785\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n788\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n789\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n792\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n793\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n791\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790_6\ : std_logic ;
  signal u_psram_top_u_psram_init_n1532 : std_logic ;
  signal u_psram_top_u_psram_init_n1533 : std_logic ;
  signal u_psram_top_u_psram_init_n1534 : std_logic ;
  signal u_psram_top_u_psram_init_n1535 : std_logic ;
  signal u_psram_top_u_psram_init_n1536 : std_logic ;
  signal u_psram_top_u_psram_init_n1537 : std_logic ;
  signal u_psram_top_u_psram_init_n1538 : std_logic ;
  signal u_psram_top_u_psram_init_n1539 : std_logic ;
  signal u_psram_top_u_psram_init_n1540 : std_logic ;
  signal u_psram_top_u_psram_init_n1541 : std_logic ;
  signal u_psram_top_u_psram_init_n1542 : std_logic ;
  signal u_psram_top_u_psram_init_n1543 : std_logic ;
  signal u_psram_top_u_psram_init_n1544 : std_logic ;
  signal u_psram_top_u_psram_init_n1545 : std_logic ;
  signal u_psram_top_u_psram_init_n1546 : std_logic ;
  signal u_psram_top_u_psram_init_n1547 : std_logic ;
  signal u_psram_top_u_psram_init_n1548 : std_logic ;
  signal u_psram_top_u_psram_init_n1549 : std_logic ;
  signal u_psram_top_u_psram_init_n1550 : std_logic ;
  signal u_psram_top_u_psram_init_n1551 : std_logic ;
  signal u_psram_top_u_psram_init_n1552 : std_logic ;
  signal u_psram_top_u_psram_init_n1553 : std_logic ;
  signal u_psram_top_u_psram_init_n1554 : std_logic ;
  signal u_psram_top_u_psram_init_n1555 : std_logic ;
  signal u_psram_top_u_psram_init_n1556 : std_logic ;
  signal u_psram_top_u_psram_init_n1557 : std_logic ;
  signal u_psram_top_u_psram_init_n1558 : std_logic ;
  signal u_psram_top_u_psram_init_n1559 : std_logic ;
  signal u_psram_top_u_psram_init_n1560 : std_logic ;
  signal u_psram_top_u_psram_init_n1561 : std_logic ;
  signal u_psram_top_u_psram_init_n1562 : std_logic ;
  signal u_psram_top_u_psram_init_n1643 : std_logic ;
  signal u_psram_top_u_psram_init_n2003 : std_logic ;
  signal u_psram_top_u_psram_init_n2004 : std_logic ;
  signal u_psram_top_u_psram_init_n2005 : std_logic ;
  signal u_psram_top_u_psram_init_n2006 : std_logic ;
  signal u_psram_top_u_psram_init_n2007 : std_logic ;
  signal u_psram_top_u_psram_init_n2008 : std_logic ;
  signal u_psram_top_u_psram_init_n2009 : std_logic ;
  signal u_psram_top_u_psram_init_n2010 : std_logic ;
  signal u_psram_top_u_psram_init_n2011 : std_logic ;
  signal u_psram_top_u_psram_init_n2012 : std_logic ;
  signal u_psram_top_u_psram_init_n2013 : std_logic ;
  signal u_psram_top_u_psram_init_n2014 : std_logic ;
  signal u_psram_top_u_psram_init_n2015 : std_logic ;
  signal u_psram_top_u_psram_init_n2016 : std_logic ;
  signal u_psram_top_u_psram_init_n2017 : std_logic ;
  signal u_psram_top_u_psram_init_n2018 : std_logic ;
  signal u_psram_top_u_psram_init_n2019 : std_logic ;
  signal u_psram_top_u_psram_init_n2020 : std_logic ;
  signal u_psram_top_u_psram_init_n2021 : std_logic ;
  signal u_psram_top_u_psram_init_n2022 : std_logic ;
  signal u_psram_top_u_psram_init_n2023 : std_logic ;
  signal u_psram_top_u_psram_init_n2024 : std_logic ;
  signal u_psram_top_u_psram_init_n2025 : std_logic ;
  signal u_psram_top_u_psram_init_n2026 : std_logic ;
  signal u_psram_top_u_psram_init_n2027 : std_logic ;
  signal u_psram_top_u_psram_init_n2028 : std_logic ;
  signal u_psram_top_u_psram_init_n2029 : std_logic ;
  signal u_psram_top_u_psram_init_n2030 : std_logic ;
  signal u_psram_top_u_psram_init_n2031 : std_logic ;
  signal u_psram_top_u_psram_init_n2032 : std_logic ;
  signal u_psram_top_u_psram_init_n2033 : std_logic ;
  signal u_psram_top_u_psram_init_n2114 : std_logic ;
  signal u_psram_top_n298 : std_logic ;
  signal u_psram_top_n297 : std_logic ;
  signal u_psram_top_n296 : std_logic ;
  signal u_psram_top_n295 : std_logic ;
  signal u_psram_top_n294 : std_logic ;
  signal u_psram_top_n293 : std_logic ;
  signal u_psram_top_n292 : std_logic ;
  signal u_psram_top_n291 : std_logic ;
  signal u_psram_top_n290 : std_logic ;
  signal u_psram_top_n289 : std_logic ;
  signal u_psram_top_n288 : std_logic ;
  signal u_psram_top_n287 : std_logic ;
  signal u_psram_top_n286 : std_logic ;
  signal u_psram_top_n285 : std_logic ;
  signal u_psram_top_n284 : std_logic ;
  signal u_psram_top_n283 : std_logic ;
  signal u_psram_top_n282 : std_logic ;
  signal u_psram_top_n281 : std_logic ;
  signal u_psram_top_n280 : std_logic ;
  signal u_psram_top_n279 : std_logic ;
  signal u_psram_top_n278 : std_logic ;
  signal u_psram_top_n277 : std_logic ;
  signal u_psram_top_n276 : std_logic ;
  signal u_psram_top_n275 : std_logic ;
  signal u_psram_top_n274 : std_logic ;
  signal u_psram_top_n273 : std_logic ;
  signal u_psram_top_n272 : std_logic ;
  signal u_psram_top_n271 : std_logic ;
  signal u_psram_top_n270 : std_logic ;
  signal u_psram_top_n269 : std_logic ;
  signal u_psram_top_n268 : std_logic ;
  signal u_psram_top_n267 : std_logic ;
  signal u_psram_top_n266 : std_logic ;
  signal u_psram_top_n265 : std_logic ;
  signal u_psram_top_n264 : std_logic ;
  signal u_psram_top_n263 : std_logic ;
  signal u_psram_top_n262 : std_logic ;
  signal u_psram_top_n261 : std_logic ;
  signal u_psram_top_n260 : std_logic ;
  signal u_psram_top_n259 : std_logic ;
  signal u_psram_top_n258 : std_logic ;
  signal u_psram_top_n257 : std_logic ;
  signal u_psram_top_n256 : std_logic ;
  signal u_psram_top_n255 : std_logic ;
  signal u_psram_top_n254 : std_logic ;
  signal u_psram_top_n253 : std_logic ;
  signal u_psram_top_n252 : std_logic ;
  signal u_psram_top_n251 : std_logic ;
  signal u_psram_top_n250 : std_logic ;
  signal u_psram_top_n249 : std_logic ;
  signal u_psram_top_n248 : std_logic ;
  signal u_psram_top_n247 : std_logic ;
  signal u_psram_top_n246 : std_logic ;
  signal u_psram_top_n245 : std_logic ;
  signal u_psram_top_n244 : std_logic ;
  signal u_psram_top_n243 : std_logic ;
  signal u_psram_top_n242 : std_logic ;
  signal u_psram_top_n241 : std_logic ;
  signal u_psram_top_n240 : std_logic ;
  signal u_psram_top_n239 : std_logic ;
  signal u_psram_top_n238 : std_logic ;
  signal u_psram_top_n237 : std_logic ;
  signal u_psram_top_n236 : std_logic ;
  signal u_psram_top_n235 : std_logic ;
  signal u_psram_top_u_psram_init_read_over_12 : std_logic ;
  signal u_psram_top_u_psram_wd_n382 : std_logic ;
  signal u_psram_top_u_psram_wd_n444 : std_logic ;
  signal u_psram_top_u_psram_init_n1131 : std_logic ;
  signal u_psram_top_u_psram_init_n1125 : std_logic ;
  signal u_psram_top_u_psram_init_n1275 : std_logic ;
  signal u_psram_top_u_psram_init_n2431 : std_logic ;
  signal u_psram_top_u_psram_init_n1493 : std_logic ;
  signal u_psram_top_u_psram_init_n2437_8 : std_logic ;
  signal u_psram_top_u_psram_init_n1746 : std_logic ;
  signal u_psram_top_u_psram_init_n2445 : std_logic ;
  signal u_psram_top_u_psram_init_n1964 : std_logic ;
  signal u_psram_top_u_psram_init_n2469_8 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n139\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_16\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n140\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n172\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n173\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1306\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4_14\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1307\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n139\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_15\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n140\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1307\ : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\ : std_logic ;
  signal u_psram_top_u_psram_init_n183_12 : std_logic ;
  signal u_psram_top_u_psram_init_tvcs_cnt_15 : std_logic ;
  signal u_psram_top_u_psram_init_n186_10 : std_logic ;
  signal u_psram_top_u_psram_init_n189_13 : std_logic ;
  signal u_psram_top_u_psram_init_n192_10 : std_logic ;
  signal u_psram_top_u_psram_init_n195 : std_logic ;
  signal u_psram_top_u_psram_init_n196 : std_logic ;
  signal u_psram_top_u_psram_init_n254 : std_logic ;
  signal u_psram_top_u_psram_init_timer_cnt_5 : std_logic ;
  signal u_psram_top_u_psram_init_n255 : std_logic ;
  signal u_psram_top_u_psram_init_n592 : std_logic ;
  signal u_psram_top_u_psram_init_timer_cnt0_5 : std_logic ;
  signal u_psram_top_u_psram_init_n593 : std_logic ;
  signal u_psram_top_u_psram_init_n1113 : std_logic ;
  signal u_psram_top_u_psram_init_n1165_12 : std_logic ;
  signal u_psram_top_u_psram_init_timer_cnt1_5 : std_logic ;
  signal u_psram_top_u_psram_init_n1168 : std_logic ;
  signal u_psram_top_u_psram_init_n1169 : std_logic ;
  signal u_psram_top_u_psram_sync_n41_11 : std_logic ;
  signal u_psram_top_u_psram_sync_lock_cnt_15 : std_logic ;
  signal u_psram_top_u_psram_sync_n43_14 : std_logic ;
  signal u_psram_top_u_psram_sync_n45_11 : std_logic ;
  signal u_psram_top_u_psram_sync_n47_13 : std_logic ;
  signal u_psram_top_u_psram_sync_n48_11 : std_logic ;
  signal u_psram_top_u_psram_sync_n50 : std_logic ;
  signal u_psram_top_u_psram_sync_n51_11 : std_logic ;
  signal u_psram_top_u_psram_sync_n37_8 : std_logic ;
  signal \u_psram_top_u_psram_init_n_state.IDLE_21\ : std_logic ;
  signal u_psram_top_n797 : std_logic ;
  signal u_psram_top_n804 : std_logic ;
  signal \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\ : std_logic ;
  signal u_psram_top_u_psram_init_calib_0 : std_logic ;
  signal u_psram_top_u_psram_init_calib_1 : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
  signal \u_psram_top/u_psram_wd/in_dq\ : std_logic_vector(15 downto 0);
  signal \u_psram_top/u_psram_wd/in_rwds\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/dll_step\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_wd/in_dq_p\ : std_logic_vector(15 downto 0);
  signal \u_psram_top/u_psram_wd/DF_d\ : std_logic_vector(15 downto 0);
  signal \u_psram_top/u_psram_wd/clkn_out_d\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/clk_out_d\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/out_rwds\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rwds_ts_Z\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_cs\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\ : std_logic_vector(31 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clk_out\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clkn_out\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/out_rwds\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rwds_ts_Z\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_cs\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\ : std_logic_vector(15 downto 8);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\ : std_logic_vector(15 downto 8);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\ : std_logic_vector(63 downto 32);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/clk_out\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/rd_data_d\ : std_logic_vector(63 downto 0);
  signal \u_psram_top/u_psram_wd/step\ : std_logic_vector(8 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\ : std_logic_vector(14 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\ : std_logic_vector(18 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\ : std_logic_vector(63 downto 16);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q0_d\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q1_d\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q2_d\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q7_d\ : std_logic_vector(3 downto 3);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\ : std_logic_vector(3 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\ : std_logic_vector(3 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\ : std_logic_vector(3 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi7\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi0\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0\ : std_logic_vector(2 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di1\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\ : std_logic_vector(3 downto 3);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_Z\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\ : std_logic_vector(15 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\ : std_logic_vector(17 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\ : std_logic_vector(3 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q2\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q1\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q0\ : std_logic_vector(2 downto 2);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_init_delay_all\ : std_logic_vector(3 downto 3);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\ : std_logic_vector(2 downto 1);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_Z\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_init/phase_cnt\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].add_cnt\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_init/adjust_over\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].times_reg\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_init/delay_wait_over\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/calib_done\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/calib_Z\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].add_cnt\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].times_reg\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_sync/lock_syn\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_sync/cs_memsync\ : std_logic_vector(5 downto 2);
  signal \u_psram_top/u_psram_sync/flag\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_sync/count\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\ : std_logic_vector(0 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\ : std_logic_vector(4 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\ : std_logic_vector(1 downto 1);
  signal \u_psram_top/u_psram_init/tvcs_cnt\ : std_logic_vector(15 downto 0);
  signal \u_psram_top/u_psram_init/timer_cnt\ : std_logic_vector(5 downto 0);
  signal \u_psram_top/u_psram_init/timer_cnt0\ : std_logic_vector(5 downto 0);
  signal \u_psram_top/u_psram_init/wr_data_calib\ : std_logic_vector(63 downto 58);
  signal \u_psram_top/u_psram_init/read_cnt\ : std_logic_vector(8 downto 0);
  signal \u_psram_top/u_psram_init/timer_cnt1\ : std_logic_vector(5 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_init/SDTAP_Z\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/VALUE_Z\ : std_logic_vector(1 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].check_cnt\ : std_logic_vector(5 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[0].id_reg\ : std_logic_vector(31 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\ : std_logic_vector(2 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].check_cnt\ : std_logic_vector(5 downto 0);
  signal \u_psram_top/u_psram_init/read_calibration[1].id_reg\ : std_logic_vector(31 downto 0);
  signal \u_psram_top/u_psram_sync/lock_cnt\ : std_logic_vector(15 downto 0);
  signal \u_psram_top/wr_data_d\ : std_logic_vector(63 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\ : std_logic_vector(31 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\ : std_logic_vector(31 downto 0);
  signal \u_psram_top/u_psram_init/out_dq_Z\ : std_logic_vector(62 downto 15);
  signal \u_psram_top/addr_d\ : std_logic_vector(20 downto 0);
  signal \u_psram_top/data_mask_d\ : std_logic_vector(7 downto 0);
  signal \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\ : std_logic_vector(1 downto 0);
  signal NN : std_logic;
  signal NN_0 : std_logic;
  signal NN_1 : std_logic;
begin
\u_psram_top/u_psram_wd/dq_iobuf_gen[0].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(0),
  IO => IO_psram_dq(0),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(0),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(0));
\u_psram_top/u_psram_wd/dq_iobuf_gen[1].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(1),
  IO => IO_psram_dq(1),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(1),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(1));
\u_psram_top/u_psram_wd/dq_iobuf_gen[2].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(2),
  IO => IO_psram_dq(2),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(2),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(2));
\u_psram_top/u_psram_wd/dq_iobuf_gen[3].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(3),
  IO => IO_psram_dq(3),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(3),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(3));
\u_psram_top/u_psram_wd/dq_iobuf_gen[4].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(4),
  IO => IO_psram_dq(4),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(4),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(4));
\u_psram_top/u_psram_wd/dq_iobuf_gen[5].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(5),
  IO => IO_psram_dq(5),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(5),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(5));
\u_psram_top/u_psram_wd/dq_iobuf_gen[6].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(6),
  IO => IO_psram_dq(6),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(6),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(6));
\u_psram_top/u_psram_wd/dq_iobuf_gen[7].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(7),
  IO => IO_psram_dq(7),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(7),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(7));
\u_psram_top/u_psram_wd/dq_iobuf_gen[8].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(8),
  IO => IO_psram_dq(8),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(8),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(8));
\u_psram_top/u_psram_wd/dq_iobuf_gen[9].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(9),
  IO => IO_psram_dq(9),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(9),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(9));
\u_psram_top/u_psram_wd/dq_iobuf_gen[10].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(10),
  IO => IO_psram_dq(10),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(10),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(10));
\u_psram_top/u_psram_wd/dq_iobuf_gen[11].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(11),
  IO => IO_psram_dq(11),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(11),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(11));
\u_psram_top/u_psram_wd/dq_iobuf_gen[12].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(12),
  IO => IO_psram_dq(12),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(12),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(12));
\u_psram_top/u_psram_wd/dq_iobuf_gen[13].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(13),
  IO => IO_psram_dq(13),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(13),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(13));
\u_psram_top/u_psram_wd/dq_iobuf_gen[14].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(14),
  IO => IO_psram_dq(14),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(14),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(14));
\u_psram_top/u_psram_wd/dq_iobuf_gen[15].dq_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_dq\(15),
  IO => IO_psram_dq(15),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(15),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(15));
\u_psram_top/u_psram_wd/u_clk_gen0\: OBUF
port map (
  O => O_psram_ck(0),
  I => \u_psram_top/u_psram_wd/clk_out_d\(0));
\u_psram_top/u_psram_wd/u_clkn_gen_n0\: OBUF
port map (
  O => O_psram_ck_n(0),
  I => \u_psram_top/u_psram_wd/clkn_out_d\(0));
\u_psram_top/u_psram_wd/u_clk_gen1\: ELVDS_OBUF
port map (
  O => O_psram_ck(1),
  OB => O_psram_ck_n(1),
  I => \u_psram_top/u_psram_wd/clk_out_d\(1));
\u_psram_top/u_psram_wd/rwds_iobuf_gen[0].rwds_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_rwds\(0),
  IO => IO_psram_rwds(0),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/out_rwds\(0),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rwds_ts_Z\(0));
\u_psram_top/u_psram_wd/rwds_iobuf_gen[1].rwds_iobuf\: IOBUF
port map (
  O => \u_psram_top/u_psram_wd/in_rwds\(1),
  IO => IO_psram_rwds(1),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/out_rwds\(1),
  OEN => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rwds_ts_Z\(1));
\u_psram_top/u_psram_wd/cs_iobuf_gen[0].cs_obuf\: OBUF
port map (
  O => O_psram_cs_n(0),
  I => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_cs\(0));
\u_psram_top/u_psram_wd/cs_iobuf_gen[1].cs_obuf\: OBUF
port map (
  O => O_psram_cs_n(1),
  I => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_cs\(1));
\u_psram_top/u_dll\: DLL
generic map (
  CODESCAL => "101",
  DIV_SEL => '1',
  DLL_FORCE => 0,
  SCAL_EN => "false"
)
port map (
  STEP(7 downto 0) => \u_psram_top/dll_step\(7 downto 0),
  LOCK => u_psram_top_dll_lock,
  UPDNCNTL => u_psram_top_u_psram_sync_uddcntln,
  STOP => u_psram_top_n804,
  CLKIN => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_dll_rsti);
\u_psram_top/u_dqce_clk_x2p\: DHCEN
port map (
  CLKOUT => u_psram_top_clk_x2p,
  CLKIN => memory_clk,
  CE => u_psram_top_u_psram_sync_stop);
\u_psram_top/clkdiv\: CLKDIV
generic map (
  DIV_MODE => "2",
  GSREN => "false"
)
port map (
  CLKOUT => NN_0,
  CALIB => GND_0,
  HCLKIN => u_psram_top_clk_x2p,
  RESETN => u_psram_top_n492);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[0].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(0),
  DF => \u_psram_top/u_psram_wd/DF_d\(0),
  DI => \u_psram_top/u_psram_wd/in_dq\(0),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[1].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(1),
  DF => \u_psram_top/u_psram_wd/DF_d\(1),
  DI => \u_psram_top/u_psram_wd/in_dq\(1),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[2].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(2),
  DF => \u_psram_top/u_psram_wd/DF_d\(2),
  DI => \u_psram_top/u_psram_wd/in_dq\(2),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[3].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(3),
  DF => \u_psram_top/u_psram_wd/DF_d\(3),
  DI => \u_psram_top/u_psram_wd/in_dq\(3),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[4].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(4),
  DF => \u_psram_top/u_psram_wd/DF_d\(4),
  DI => \u_psram_top/u_psram_wd/in_dq\(4),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[5].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(5),
  DF => \u_psram_top/u_psram_wd/DF_d\(5),
  DI => \u_psram_top/u_psram_wd/in_dq\(5),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[6].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(6),
  DF => \u_psram_top/u_psram_wd/DF_d\(6),
  DI => \u_psram_top/u_psram_wd/in_dq\(6),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[0].[7].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(7),
  DF => \u_psram_top/u_psram_wd/DF_d\(7),
  DI => \u_psram_top/u_psram_wd/in_dq\(7),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[0].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(8),
  DF => \u_psram_top/u_psram_wd/DF_d\(8),
  DI => \u_psram_top/u_psram_wd/in_dq\(8),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[1].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(9),
  DF => \u_psram_top/u_psram_wd/DF_d\(9),
  DI => \u_psram_top/u_psram_wd/in_dq\(9),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[2].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(10),
  DF => \u_psram_top/u_psram_wd/DF_d\(10),
  DI => \u_psram_top/u_psram_wd/in_dq\(10),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[3].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(11),
  DF => \u_psram_top/u_psram_wd/DF_d\(11),
  DI => \u_psram_top/u_psram_wd/in_dq\(11),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[4].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(12),
  DF => \u_psram_top/u_psram_wd/DF_d\(12),
  DI => \u_psram_top/u_psram_wd/in_dq\(12),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[5].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(13),
  DF => \u_psram_top/u_psram_wd/DF_d\(13),
  DI => \u_psram_top/u_psram_wd/in_dq\(13),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[6].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(14),
  DF => \u_psram_top/u_psram_wd/DF_d\(14),
  DI => \u_psram_top/u_psram_wd/in_dq\(14),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/dq_iodelay_gen0[1].[7].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/in_dq_p\(15),
  DF => \u_psram_top/u_psram_wd/DF_d\(15),
  DI => \u_psram_top/u_psram_wd/in_dq\(15),
  SDTAP => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  VALUE => \u_psram_top/u_psram_init/VALUE_Z\(1),
  SETN => GND_0);
\u_psram_top/u_psram_wd/iodelayn0\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/clkn_out_d\(0),
  DF => u_psram_top_u_psram_wd_iodelayn0,
  DI => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clkn_out\(0),
  SDTAP => u_psram_top_u_psram_wd_dll_lock_d,
  VALUE => \u_psram_top/u_psram_wd/step\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/ck_delay[0].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/clk_out_d\(0),
  DF => \u_psram_top_u_psram_wd_ck_delay[0].iodelay\,
  DI => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clk_out\(0),
  SDTAP => u_psram_top_u_psram_wd_dll_lock_d,
  VALUE => \u_psram_top/u_psram_wd/step\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/ck_delay[1].iodelay\: IODELAY
generic map (
  C_STATIC_DLY => 0
)
port map (
  DO => \u_psram_top/u_psram_wd/clk_out_d\(1),
  DF => \u_psram_top_u_psram_wd_ck_delay[1].iodelay\,
  DI => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/clk_out\(1),
  SDTAP => u_psram_top_u_psram_wd_dll_lock_d,
  VALUE => \u_psram_top/u_psram_wd/step\(0),
  SETN => GND_0);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/mask_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/out_rwds\(0),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rwds_ts_Z\(0),
  D3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0_14\,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1_13\,
  D1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2_13\,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3_13\,
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/cs_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_cs\(0),
  Q1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_oser4\,
  D3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n919\,
  TX1 => GND_0,
  TX0 => GND_0,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[0].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(0),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(0),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(0),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(1),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(2),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(3),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[1].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(1),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(1),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(4),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(5),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(6),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(7),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[2].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(2),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(2),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(8),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(9),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(10),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(11),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[3].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(3),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(3),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(12),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(13),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(14),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(15),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[4].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(4),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(4),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(16),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(17),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(18),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(19),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[5].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(5),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(5),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(20),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(21),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(22),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(23),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[6].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(6),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(6),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(24),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(25),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(26),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(27),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oserdes_data_gen[7].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dq\(7),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/oser4_dqts\(7),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(28),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(29),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(30),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(31),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[0].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(24),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(16),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(8),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(0),
  D => \u_psram_top/u_psram_wd/in_dq_p\(0),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[1].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(25),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(17),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(9),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(1),
  D => \u_psram_top/u_psram_wd/in_dq_p\(1),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[2].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(26),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(18),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(10),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(2),
  D => \u_psram_top/u_psram_wd/in_dq_p\(2),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[3].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(27),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(19),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(11),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(3),
  D => \u_psram_top/u_psram_wd/in_dq_p\(3),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[4].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(28),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(20),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(12),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(4),
  D => \u_psram_top/u_psram_wd/in_dq_p\(4),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[5].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(29),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(21),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(13),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(5),
  D => \u_psram_top/u_psram_wd/in_dq_p\(5),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[6].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(30),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(22),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(14),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(6),
  D => \u_psram_top/u_psram_wd/in_dq_p\(6),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/iserdes_gen[7].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(31),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(23),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(15),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(7),
  D => \u_psram_top/u_psram_wd/in_dq_p\(7),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(0),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/genclkpos.u_ck_gen\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clk_out\(0),
  Q1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_genclkpos.u_ck_gen\,
  D3 => GND_0,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538\,
  D1 => GND_0,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538\,
  TX1 => GND_0,
  TX0 => GND_0,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/genclkpos.u_ckn_gen\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clkn_out\(0),
  Q1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_genclkpos.u_ckn_gen\,
  D3 => VCC_0,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\,
  D1 => VCC_0,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\,
  TX1 => GND_0,
  TX0 => GND_0,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/mask_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/out_rwds\(1),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rwds_ts_Z\(1),
  D3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0_13\,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1_13\,
  D1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2_13\,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3_13\,
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/cs_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_cs\(1),
  Q1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_cs_oser4\,
  D3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n919\,
  TX1 => GND_0,
  TX0 => GND_0,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[0].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(8),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(8),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(0),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(1),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(2),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(3),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[1].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(9),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(9),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(4),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(5),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(6),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(7),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[2].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(10),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(10),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(8),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(9),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(10),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(11),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[3].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(11),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(11),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(12),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(13),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(14),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(15),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[4].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(12),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(12),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(16),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(17),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(18),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(19),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[5].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(13),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(13),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(20),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(21),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(22),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(23),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[6].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(14),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(14),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(24),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(25),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(26),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(27),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oserdes_data_gen[7].dq_oser4\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dq\(15),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/oser4_dqts\(15),
  D3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(28),
  D2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(29),
  D1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(30),
  D0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(31),
  TX1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  TX0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[0].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(56),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(48),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(40),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(32),
  D => \u_psram_top/u_psram_wd/in_dq_p\(8),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[1].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(57),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(49),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(41),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(33),
  D => \u_psram_top/u_psram_wd/in_dq_p\(9),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[2].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(58),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(50),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(42),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(34),
  D => \u_psram_top/u_psram_wd/in_dq_p\(10),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[3].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(59),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(51),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(43),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(35),
  D => \u_psram_top/u_psram_wd/in_dq_p\(11),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[4].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(60),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(52),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(44),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(36),
  D => \u_psram_top/u_psram_wd/in_dq_p\(12),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[5].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(61),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(53),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(45),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(37),
  D => \u_psram_top/u_psram_wd/in_dq_p\(13),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[6].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(62),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(54),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(46),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(38),
  D => \u_psram_top/u_psram_wd/in_dq_p\(14),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/iserdes_gen[7].u_ides4\: IDES4
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(63),
  Q1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(55),
  Q2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(47),
  Q3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(39),
  D => \u_psram_top/u_psram_wd/in_dq_p\(15),
  CALIB => \u_psram_top/u_psram_init/calib_Z\(1),
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/genclkneg.u_ck_gen\: OSER4
generic map (
  HWL => "true",
  TXCLK_POL => '0'
)
port map (
  Q0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/clk_out\(1),
  Q1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_genclkneg.u_ck_gen\,
  D3 => VCC_0,
  D2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\,
  D1 => VCC_0,
  D0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\,
  TX1 => GND_0,
  TX0 => GND_0,
  PCLK => NN_0,
  FCLK => u_psram_top_clk_x2p,
  RESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_63_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(63),
  D => u_psram_top_n235,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_62_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(62),
  D => u_psram_top_n236,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_61_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(61),
  D => u_psram_top_n237,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_60_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(60),
  D => u_psram_top_n238,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_59_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(59),
  D => u_psram_top_n239,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_58_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(58),
  D => u_psram_top_n240,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_57_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(57),
  D => u_psram_top_n241,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_56_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(56),
  D => u_psram_top_n242,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_55_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(55),
  D => u_psram_top_n243,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_54_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(54),
  D => u_psram_top_n244,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_53_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(53),
  D => u_psram_top_n245,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_52_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(52),
  D => u_psram_top_n246,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_51_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(51),
  D => u_psram_top_n247,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_50_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(50),
  D => u_psram_top_n248,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_49_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(49),
  D => u_psram_top_n249,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_48_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(48),
  D => u_psram_top_n250,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_47_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(47),
  D => u_psram_top_n251,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_46_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(46),
  D => u_psram_top_n252,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_45_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(45),
  D => u_psram_top_n253,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_44_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(44),
  D => u_psram_top_n254,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_43_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(43),
  D => u_psram_top_n255,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_42_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(42),
  D => u_psram_top_n256,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_41_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(41),
  D => u_psram_top_n257,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_40_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(40),
  D => u_psram_top_n258,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_39_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(39),
  D => u_psram_top_n259,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_38_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(38),
  D => u_psram_top_n260,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_37_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(37),
  D => u_psram_top_n261,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_36_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(36),
  D => u_psram_top_n262,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_35_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(35),
  D => u_psram_top_n263,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_34_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(34),
  D => u_psram_top_n264,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_33_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(33),
  D => u_psram_top_n265,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_32_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(32),
  D => u_psram_top_n266,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_31_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(31),
  D => u_psram_top_n267,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_30_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(30),
  D => u_psram_top_n268,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_29_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(29),
  D => u_psram_top_n269,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_28_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(28),
  D => u_psram_top_n270,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_27_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(27),
  D => u_psram_top_n271,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_26_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(26),
  D => u_psram_top_n272,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_25_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(25),
  D => u_psram_top_n273,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_24_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(24),
  D => u_psram_top_n274,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_23_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(23),
  D => u_psram_top_n275,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_22_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(22),
  D => u_psram_top_n276,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_21_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(21),
  D => u_psram_top_n277,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_20_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(20),
  D => u_psram_top_n278,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_19_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(19),
  D => u_psram_top_n279,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_18_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(18),
  D => u_psram_top_n280,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_17_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(17),
  D => u_psram_top_n281,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_16_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(16),
  D => u_psram_top_n282,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_15_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(15),
  D => u_psram_top_n283,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_14_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(14),
  D => u_psram_top_n284,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_13_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(13),
  D => u_psram_top_n285,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_12_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(12),
  D => u_psram_top_n286,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_11_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(11),
  D => u_psram_top_n287,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_10_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(10),
  D => u_psram_top_n288,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_9_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(9),
  D => u_psram_top_n289,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_8_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(8),
  D => u_psram_top_n290,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_7_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(7),
  D => u_psram_top_n291,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_6_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(6),
  D => u_psram_top_n292,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_5_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(5),
  D => u_psram_top_n293,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_4_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(4),
  D => u_psram_top_n294,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_3_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(3),
  D => u_psram_top_n295,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_2_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(2),
  D => u_psram_top_n296,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_1_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(1),
  D => u_psram_top_n297,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_d_0_s0\: DFFC
port map (
  Q => \u_psram_top/rd_data_d\(0),
  D => u_psram_top_n298,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/rd_data_valid_d_s0\: DFFC
port map (
  Q => u_psram_top_rd_data_valid_d,
  D => u_psram_top_u_psram_wd_rd_data_valid_d0,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/dll_lock_d_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_wd_dll_lock_d,
  D => u_psram_top_u_psram_wd_dll_lock_d0,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_8_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(8),
  D => u_psram_top_u_psram_wd_n374,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_7_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(7),
  D => u_psram_top_u_psram_wd_n375,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_6_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(6),
  D => u_psram_top_u_psram_wd_n376,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_5_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(5),
  D => u_psram_top_u_psram_wd_n377,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(4),
  D => u_psram_top_u_psram_wd_n378,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(3),
  D => u_psram_top_u_psram_wd_n379,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(2),
  D => u_psram_top_u_psram_wd_n380,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/step_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/step\(1),
  D => u_psram_top_u_psram_wd_n381,
  CLK => NN_0,
  CE => u_psram_top_u_psram_wd_n444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/dll_lock_d0_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_wd_dll_lock_d0,
  D => u_psram_top_dll_lock,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_14_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(14),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(13),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_12_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(12),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(11),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_10_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(10),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(9),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_8_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(8),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(7),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_6_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(6),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(5),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_4_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(4),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(3),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_18_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(18),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(17),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_16_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(16),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(15),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_14_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(14),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_12_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(12),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(11),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_10_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(10),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(9),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_8_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(8),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(7),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_6_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(6),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(5),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_4_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(4),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(3),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_en\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_60_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(60),
  D => VCC_0,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_49_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(49),
  D => \u_psram_top/addr_d\(20),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_48_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(48),
  D => \u_psram_top/addr_d\(19),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_47_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(47),
  D => \u_psram_top/addr_d\(18),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_46_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(46),
  D => \u_psram_top/addr_d\(17),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_45_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(45),
  D => \u_psram_top/addr_d\(16),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_44_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(44),
  D => \u_psram_top/addr_d\(15),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_43_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(43),
  D => \u_psram_top/addr_d\(14),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_42_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(42),
  D => \u_psram_top/addr_d\(13),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_41_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(41),
  D => \u_psram_top/addr_d\(12),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_40_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(40),
  D => \u_psram_top/addr_d\(11),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_39_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(39),
  D => \u_psram_top/addr_d\(10),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_38_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(38),
  D => \u_psram_top/addr_d\(9),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_37_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(37),
  D => \u_psram_top/addr_d\(8),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_36_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(36),
  D => \u_psram_top/addr_d\(7),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_35_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(35),
  D => \u_psram_top/addr_d\(6),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_34_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(34),
  D => \u_psram_top/addr_d\(5),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_33_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(33),
  D => \u_psram_top/addr_d\(4),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_32_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(32),
  D => \u_psram_top/addr_d\(3),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_18_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(18),
  D => \u_psram_top/addr_d\(2),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_17_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(17),
  D => \u_psram_top/addr_d\(1),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_16_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(16),
  D => \u_psram_top/addr_d\(0),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  D => \u_psram_top/u_psram_init/out_dq_Z\(62),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q0_d_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q0_d\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q0\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q1_d_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q1_d\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q1\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q2_d_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q2_d\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q2\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q7_d_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q7_d\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n791\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n764\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n765\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n767\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n768\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n769\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n771\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n772\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n773\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n776\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n777\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n780\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n781\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n786\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n784\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n785\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n788\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n789\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790_6\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n792\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n793\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi7_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi7\(1),
  D => \u_psram_top/u_psram_init/out_dq_Z\(15),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi0_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi0\(2),
  D => \u_psram_top/u_psram_init/out_dq_Z\(16),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1190\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1191\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di1_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di1\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1196\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_Z\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1323\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_15_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(15),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(14),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_13_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(13),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(12),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_11_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(11),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(10),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_9_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(9),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(8),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_7_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(7),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(6),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_5_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(5),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(4),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_17_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(17),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(16),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_15_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(15),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(14),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_13_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(12),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_11_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(11),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(10),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_9_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(9),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(8),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_7_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(7),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(6),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_5_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(5),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(4),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(0),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(63),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(47),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(39),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(46),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(38),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(45),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(37),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(44),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(36),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(43),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(35),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(42),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(34),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(49),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(41),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(33),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(48),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(40),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(0),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(32),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(60),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q2_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q2\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(18),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q1_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q1\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(17),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q0_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q0\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(16),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_init_delay_all_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_init_delay_all\(3),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\(2),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi0\(2),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\(1),
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/qi7\(1),
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_Z\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1323\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_datats_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_datats\,
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.TVCS_WAITE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  D => \u_psram_top_u_psram_init_n_state.TVCS_WAITE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.CONFIG_CR_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.CONFIG_CR\,
  D => \u_psram_top_u_psram_init_n_state.CONFIG_CR\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.WRITE_DATA_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.WRITE_DATA\,
  D => \u_psram_top_u_psram_init_n_state.WRITE_DATA\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.READ_CHECK_DATA_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  D => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.ADJUST_PHASE_WAITE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\,
  D => \u_psram_top_u_psram_init_n_state.ADJUST_PHASE_WAITE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.ADJUST_PHASE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\,
  D => \u_psram_top_u_psram_init_n_state.ADJUST_PHASE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.INIT_CALIB_WAITE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.INIT_CALIB_WAITE\,
  D => \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.ADJUST_DELAY_WAITE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  D => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.ADJUST_DELAY_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  D => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.INIT_CALIB_DONE_s0\: DFFC
port map (
  Q => \u_psram_top_u_psram_init_c_state.INIT_CALIB_DONE\,
  D => \u_psram_top_u_psram_init_n_state.INIT_CALIB_DONE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/Tvcs_done_s0\: DFFCE
port map (
  Q => u_psram_top_u_psram_init_Tvcs_done,
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n162,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/config_done_s0\: DFFCE
port map (
  Q => u_psram_top_u_psram_init_config_done_Z,
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n245,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/write_done_s0\: DFFCE
port map (
  Q => u_psram_top_u_psram_init_write_done,
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n583,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/cmd_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_init_cmd_calib,
  D => u_psram_top_u_psram_init_n628,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/cmd_en_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_init_cmd_en_calib,
  D => u_psram_top_u_psram_init_n906,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/rd_data_valid_d_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_init_rd_data_valid_d,
  D => u_psram_top_rd_data_valid_calib,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_clr_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_init_timer_cnt1_clr,
  D => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_cnt_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/phase_cnt\(4),
  D => u_psram_top_u_psram_init_n1127,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1125,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_cnt_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/phase_cnt\(3),
  D => u_psram_top_u_psram_init_n1128,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1125,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_cnt_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/phase_cnt\(2),
  D => u_psram_top_u_psram_init_n1129,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1125,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_cnt_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/phase_cnt\(1),
  D => u_psram_top_u_psram_init_n1130,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1125,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_over_s0\: DFFCE
port map (
  Q => u_psram_top_u_psram_init_phase_over,
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1150_12,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(2),
  D => u_psram_top_u_psram_init_n1248,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(1),
  D => u_psram_top_u_psram_init_n1249,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(0),
  D => u_psram_top_u_psram_init_n1250,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_7_s0\: DFFPE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(7),
  D => u_psram_top_u_psram_init_n1268,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  PRESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_6_s0\: DFFPE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(6),
  D => u_psram_top_u_psram_init_n1269,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  PRESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_5_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(5),
  D => u_psram_top_u_psram_init_n1270,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(4),
  D => u_psram_top_u_psram_init_n1271,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(3),
  D => u_psram_top_u_psram_init_n1272,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(2),
  D => u_psram_top_u_psram_init_n1273,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(1),
  D => u_psram_top_u_psram_init_n1274,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2431,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/adjust_over_0_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/adjust_over\(0),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1265,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].times_reg_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(4),
  D => u_psram_top_u_psram_init_n1489,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2437_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].times_reg_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(3),
  D => u_psram_top_u_psram_init_n1490,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2437_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].times_reg_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(2),
  D => u_psram_top_u_psram_init_n1491,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2437_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].times_reg_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(1),
  D => u_psram_top_u_psram_init_n1492,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2437_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/delay_wait_over_0_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/delay_wait_over\(0),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1620,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/calib_done_0_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/calib_done\(0),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1643,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/calib_0_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/calib_Z\(0),
  D => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_calib_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(2),
  D => u_psram_top_u_psram_init_n1719,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(1),
  D => u_psram_top_u_psram_init_n1720,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(0),
  D => u_psram_top_u_psram_init_n1721,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_7_s0\: DFFPE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(7),
  D => u_psram_top_u_psram_init_n1739,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  PRESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_6_s0\: DFFPE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(6),
  D => u_psram_top_u_psram_init_n1740,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  PRESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_5_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(5),
  D => u_psram_top_u_psram_init_n1741,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(4),
  D => u_psram_top_u_psram_init_n1742,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(3),
  D => u_psram_top_u_psram_init_n1743,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(2),
  D => u_psram_top_u_psram_init_n1744,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(1),
  D => u_psram_top_u_psram_init_n1745,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/adjust_over_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/adjust_over\(1),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1736,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].times_reg_4_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(4),
  D => u_psram_top_u_psram_init_n1960,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2469_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].times_reg_3_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(3),
  D => u_psram_top_u_psram_init_n1961,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2469_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].times_reg_2_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(2),
  D => u_psram_top_u_psram_init_n1962,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2469_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].times_reg_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(1),
  D => u_psram_top_u_psram_init_n1963,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2469_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/delay_wait_over_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/delay_wait_over\(1),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2091,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/calib_done_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/calib_done\(1),
  D => VCC_0,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n2114,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/calib_1_s0\: DFFCE
port map (
  Q => \u_psram_top/u_psram_init/calib_Z\(1),
  D => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_calib_1,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/init_calib_s0\: DFFCE
port map (
  Q => NN_1,
  D => VCC_0,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_c_state.INIT_CALIB_DONE\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/c_state.IDLE_s0\: DFFP
port map (
  Q => \u_psram_top_u_psram_init_c_state.IDLE\,
  D => \u_psram_top_u_psram_init_n_state.IDLE\,
  CLK => NN_0,
  PRESET => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_sync/lock_syn_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/lock_syn\(0),
  D => u_psram_top_u_psram_sync_n13,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_d2_s0\: DFFCE
port map (
  Q => u_psram_top_u_psram_sync_lock_d2,
  D => VCC_0,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_n86,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_5_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/cs_memsync\(5),
  D => u_psram_top_u_psram_sync_n282,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_4_s0\: DFFC
port map (
  Q => u_psram_top_u_psram_sync_stop,
  D => u_psram_top_u_psram_sync_n293,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_3_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/cs_memsync\(3),
  D => u_psram_top_u_psram_sync_n304,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/cs_memsync\(2),
  D => u_psram_top_u_psram_sync_n315,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_0_s0\: DFFC
port map (
  Q => NN,
  D => u_psram_top_u_psram_sync_n337,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/dll_rst_s0\: DFFP
port map (
  Q => u_psram_top_u_psram_sync_dll_rsti,
  D => GND_0,
  CLK => clk,
  PRESET => u_psram_top_n797);
\u_psram_top/u_psram_sync/flag_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/flag\(1),
  D => u_psram_top_u_psram_sync_n348,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/flag_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/flag\(0),
  D => u_psram_top_u_psram_sync_n359,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/count_2_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/count\(2),
  D => u_psram_top_u_psram_sync_n387,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/count_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/count\(1),
  D => u_psram_top_u_psram_sync_n388,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/count_0_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/count\(0),
  D => u_psram_top_u_psram_sync_n389,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_syn_1_s0\: DFFC
port map (
  Q => \u_psram_top/u_psram_sync/lock_syn\(1),
  D => \u_psram_top/u_psram_sync/lock_syn\(0),
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/cs_memsync_1_s0\: DFFP
port map (
  Q => u_psram_top_u_psram_sync_uddcntln,
  D => u_psram_top_u_psram_sync_n326,
  CLK => clk,
  PRESET => u_psram_top_n797);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_data_ctrl_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg\,
  D => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg_8\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_ctrl_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\,
  D => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(7),
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg_8\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(4),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n136\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_16\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n137\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_16\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n138\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_16\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA_63_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/CA\(63),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/cs_d0_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg\,
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n881\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg_10\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/cs_d1_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg\,
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n881\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg_12\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_en_delay_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n905\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg_10\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(4),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4_14\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1304\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4_14\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1305\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4_14\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1332\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_valid_d\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(4),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n136\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_15\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n137\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_15\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n138\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_15\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(4),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1304\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(2),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1305\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1306\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1332\,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_rd_data_valid_d\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(15),
  D => u_psram_top_u_psram_init_n181,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(14),
  D => u_psram_top_u_psram_init_n182,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(12),
  D => u_psram_top_u_psram_init_n184,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(11),
  D => u_psram_top_u_psram_init_n185,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(9),
  D => u_psram_top_u_psram_init_n187,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(8),
  D => u_psram_top_u_psram_init_n188,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(6),
  D => u_psram_top_u_psram_init_n190,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(5),
  D => u_psram_top_u_psram_init_n191,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(3),
  D => u_psram_top_u_psram_init_n193,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(2),
  D => u_psram_top_u_psram_init_n194,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_tvcs_cnt_15,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(3),
  D => u_psram_top_u_psram_init_n256,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(2),
  D => u_psram_top_u_psram_init_n257,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(1),
  D => u_psram_top_u_psram_init_n258,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(0),
  D => u_psram_top_u_psram_init_n259,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(3),
  D => u_psram_top_u_psram_init_n594,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt0_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(2),
  D => u_psram_top_u_psram_init_n595,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt0_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(1),
  D => u_psram_top_u_psram_init_n596,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt0_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(0),
  D => u_psram_top_u_psram_init_n597,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt0_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/wr_data_63_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/wr_data_calib\(63),
  D => u_psram_top_u_psram_init_n904,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_wr_data_63,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/wr_data_62_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/wr_data_calib\(62),
  D => u_psram_top_u_psram_init_n902,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_wr_data_63,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/wr_data_58_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/wr_data_calib\(58),
  D => u_psram_top_u_psram_init_n901,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_wr_data_63,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(8),
  D => u_psram_top_u_psram_init_n1077,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(7),
  D => u_psram_top_u_psram_init_n1078,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(6),
  D => u_psram_top_u_psram_init_n1079,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(5),
  D => u_psram_top_u_psram_init_n1080,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(4),
  D => u_psram_top_u_psram_init_n1081,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(3),
  D => u_psram_top_u_psram_init_n1082,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(2),
  D => u_psram_top_u_psram_init_n1083,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(1),
  D => u_psram_top_u_psram_init_n1084,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_cnt_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_cnt\(0),
  D => u_psram_top_u_psram_init_n1085,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_read_cnt_8,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(5),
  D => u_psram_top_u_psram_init_n1164,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt1_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(3),
  D => u_psram_top_u_psram_init_n1166,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt1_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(2),
  D => u_psram_top_u_psram_init_n1167_9,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_timer_cnt1_5,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].wr_ptr_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  D => u_psram_top_u_psram_init_n1198,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].wr_ptr_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  D => u_psram_top_u_psram_init_n1199,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].wr_ptr_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  D => u_psram_top_u_psram_init_n1200,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/SDTAP_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/SDTAP_Z\(0),
  D => u_psram_top_u_psram_init_n1212,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_SDTAP_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/VALUE_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/VALUE_Z\(0),
  D => u_psram_top_u_psram_init_n1229,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_VALUE_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(5),
  D => u_psram_top_u_psram_init_n1381,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(4),
  D => u_psram_top_u_psram_init_n1382,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(3),
  D => u_psram_top_u_psram_init_n1383,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(2),
  D => u_psram_top_u_psram_init_n1384,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1),
  D => u_psram_top_u_psram_init_n1385,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  D => u_psram_top_u_psram_init_n1386,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_31_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(31),
  D => u_psram_top_u_psram_init_n1410,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1443,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_30_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(30),
  D => u_psram_top_u_psram_init_n1532,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1444,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_29_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(29),
  D => u_psram_top_u_psram_init_n1533,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1445,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_28_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(28),
  D => u_psram_top_u_psram_init_n1534,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1446,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_27_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(27),
  D => u_psram_top_u_psram_init_n1535,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1447,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_26_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(26),
  D => u_psram_top_u_psram_init_n1536,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1448,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_25_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(25),
  D => u_psram_top_u_psram_init_n1537,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1449,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_24_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(24),
  D => u_psram_top_u_psram_init_n1538,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1450,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_23_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(23),
  D => u_psram_top_u_psram_init_n1539,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1451,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_22_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(22),
  D => u_psram_top_u_psram_init_n1540,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1452,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_21_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(21),
  D => u_psram_top_u_psram_init_n1541,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1453,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_20_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(20),
  D => u_psram_top_u_psram_init_n1542,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1454,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_19_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(19),
  D => u_psram_top_u_psram_init_n1543,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1455,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_18_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(18),
  D => u_psram_top_u_psram_init_n1544,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1456,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_17_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(17),
  D => u_psram_top_u_psram_init_n1545,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1457,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_16_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(16),
  D => u_psram_top_u_psram_init_n1546,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1458,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(15),
  D => u_psram_top_u_psram_init_n1547,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1459,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(14),
  D => u_psram_top_u_psram_init_n1548,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1460,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(13),
  D => u_psram_top_u_psram_init_n1549,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1461,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(12),
  D => u_psram_top_u_psram_init_n1550,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1462,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(11),
  D => u_psram_top_u_psram_init_n1551,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1463,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(10),
  D => u_psram_top_u_psram_init_n1552,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1464,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(9),
  D => u_psram_top_u_psram_init_n1553,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1465,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(8),
  D => u_psram_top_u_psram_init_n1554,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1466,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(7),
  D => u_psram_top_u_psram_init_n1555,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1467,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(6),
  D => u_psram_top_u_psram_init_n1556,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1468,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(5),
  D => u_psram_top_u_psram_init_n1557,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1469,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(4),
  D => u_psram_top_u_psram_init_n1558,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1470,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(3),
  D => u_psram_top_u_psram_init_n1559,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1471,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(2),
  D => u_psram_top_u_psram_init_n1560,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1472,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(1),
  D => u_psram_top_u_psram_init_n1561,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1473,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].id_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(0),
  D => u_psram_top_u_psram_init_n1562,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1474,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].wr_ptr_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  D => u_psram_top_u_psram_init_n1669,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].wr_ptr_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  D => u_psram_top_u_psram_init_n1670,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].wr_ptr_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  D => u_psram_top_u_psram_init_n1671,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].wr_ptr_2\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/SDTAP_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/SDTAP_Z\(1),
  D => u_psram_top_u_psram_init_n1212,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_SDTAP_1,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/VALUE_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/VALUE_Z\(1),
  D => u_psram_top_u_psram_init_n1700,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_VALUE_1,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(5),
  D => u_psram_top_u_psram_init_n1852,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(4),
  D => u_psram_top_u_psram_init_n1853,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(3),
  D => u_psram_top_u_psram_init_n1854,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(2),
  D => u_psram_top_u_psram_init_n1855,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  D => u_psram_top_u_psram_init_n1856,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  D => u_psram_top_u_psram_init_n1857,
  CLK => NN_0,
  CE => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_31_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(31),
  D => u_psram_top_u_psram_init_n1881,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1914,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_30_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(30),
  D => u_psram_top_u_psram_init_n2003,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1915,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_29_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(29),
  D => u_psram_top_u_psram_init_n2004,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1916,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_28_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(28),
  D => u_psram_top_u_psram_init_n2005,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1917,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_27_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(27),
  D => u_psram_top_u_psram_init_n2006,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1918,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_26_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(26),
  D => u_psram_top_u_psram_init_n2007,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1919,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_25_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(25),
  D => u_psram_top_u_psram_init_n2008,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1920,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_24_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(24),
  D => u_psram_top_u_psram_init_n2009,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1921,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_23_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(23),
  D => u_psram_top_u_psram_init_n2010,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1922,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_22_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(22),
  D => u_psram_top_u_psram_init_n2011,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1923,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_21_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(21),
  D => u_psram_top_u_psram_init_n2012,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1924,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_20_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(20),
  D => u_psram_top_u_psram_init_n2013,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1925,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_19_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(19),
  D => u_psram_top_u_psram_init_n2014,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1926,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_18_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(18),
  D => u_psram_top_u_psram_init_n2015,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1927,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_17_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(17),
  D => u_psram_top_u_psram_init_n2016,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1928,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_16_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(16),
  D => u_psram_top_u_psram_init_n2017,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1929,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(15),
  D => u_psram_top_u_psram_init_n2018,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1930,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(14),
  D => u_psram_top_u_psram_init_n2019,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1931,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(13),
  D => u_psram_top_u_psram_init_n2020,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1932,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(12),
  D => u_psram_top_u_psram_init_n2021,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1933,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(11),
  D => u_psram_top_u_psram_init_n2022,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1934,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(10),
  D => u_psram_top_u_psram_init_n2023,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1935,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(9),
  D => u_psram_top_u_psram_init_n2024,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1936,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(8),
  D => u_psram_top_u_psram_init_n2025,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1937,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(7),
  D => u_psram_top_u_psram_init_n2026,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1938,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(6),
  D => u_psram_top_u_psram_init_n2027,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1939,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(5),
  D => u_psram_top_u_psram_init_n2028,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1940,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(4),
  D => u_psram_top_u_psram_init_n2029,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1941,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(3),
  D => u_psram_top_u_psram_init_n2030,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1942,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(2),
  D => u_psram_top_u_psram_init_n2031,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1943,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(1),
  D => u_psram_top_u_psram_init_n2032,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1944,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].id_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(0),
  D => u_psram_top_u_psram_init_n2033,
  CLK => NN_0,
  CE => u_psram_top_u_psram_init_n1945,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_sync/lock_cnt_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(15),
  D => u_psram_top_u_psram_sync_n36,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(14),
  D => u_psram_top_u_psram_sync_n37,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(13),
  D => u_psram_top_u_psram_sync_n38,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(12),
  D => u_psram_top_u_psram_sync_n39,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(11),
  D => u_psram_top_u_psram_sync_n40,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(9),
  D => u_psram_top_u_psram_sync_n42,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(7),
  D => u_psram_top_u_psram_sync_n44,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(5),
  D => u_psram_top_u_psram_sync_n46,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(2),
  D => u_psram_top_u_psram_sync_n49,
  CLK => clk,
  CE => u_psram_top_u_psram_sync_lock_cnt_15,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_wd/n372_s19\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372,
  COUT => u_psram_top_u_psram_wd_n372_24,
  I0 => VCC_0,
  I1 => \u_psram_top/dll_step\(0),
  I3 => GND_0,
  CIN => \u_psram_top/u_psram_wd/step\(1));
\u_psram_top/u_psram_wd/n372_s20\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_25,
  COUT => u_psram_top_u_psram_wd_n372_26,
  I0 => \u_psram_top/u_psram_wd/step\(2),
  I1 => \u_psram_top/dll_step\(1),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_24);
\u_psram_top/u_psram_wd/n372_s21\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_27,
  COUT => u_psram_top_u_psram_wd_n372_28,
  I0 => \u_psram_top/u_psram_wd/step\(3),
  I1 => \u_psram_top/dll_step\(2),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_26);
\u_psram_top/u_psram_wd/n372_s22\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_29,
  COUT => u_psram_top_u_psram_wd_n372_30,
  I0 => \u_psram_top/u_psram_wd/step\(4),
  I1 => \u_psram_top/dll_step\(3),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_28);
\u_psram_top/u_psram_wd/n372_s23\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_31,
  COUT => u_psram_top_u_psram_wd_n372_32,
  I0 => \u_psram_top/u_psram_wd/step\(5),
  I1 => \u_psram_top/dll_step\(4),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_30);
\u_psram_top/u_psram_wd/n372_s24\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_33,
  COUT => u_psram_top_u_psram_wd_n372_34,
  I0 => \u_psram_top/u_psram_wd/step\(6),
  I1 => \u_psram_top/dll_step\(5),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_32);
\u_psram_top/u_psram_wd/n372_s25\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_35,
  COUT => u_psram_top_u_psram_wd_n372_36,
  I0 => \u_psram_top/u_psram_wd/step\(7),
  I1 => \u_psram_top/dll_step\(6),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_34);
\u_psram_top/u_psram_wd/n372_s26\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_psram_top_u_psram_wd_n372_37,
  COUT => u_psram_top_u_psram_wd_n372_38,
  I0 => \u_psram_top/u_psram_wd/step\(8),
  I1 => \u_psram_top/dll_step\(7),
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n372_36);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_data_d_0_s2\: DFFC
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  D => VCC_0,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n218_s0\: DFF
port map (
  Q => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\,
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\,
  CLK => NN_0);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/mem_data_mem_data_0_0_s\: SDPX9B
generic map (
  BIT_WIDTH_0 => 36,
  BIT_WIDTH_1 => 36,
  READ_MODE => '0',
  RESET_MODE => "SYNC",
  BLK_SEL_0 => "000",
  BLK_SEL_1 => "000"
)
port map (
  DO(35) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3\,
  DO(34) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2\,
  DO(33) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1\,
  DO(32) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0\,
  DO(31) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_31\,
  DO(30) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_30\,
  DO(29) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_29\,
  DO(28) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_28\,
  DO(27) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_27\,
  DO(26) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_26\,
  DO(25) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_25\,
  DO(24) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_24\,
  DO(23) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_23\,
  DO(22) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_22\,
  DO(21) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_21\,
  DO(20) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_20\,
  DO(19) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_19\,
  DO(18) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_18\,
  DO(17) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_17\,
  DO(16) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_16\,
  DO(15) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_15\,
  DO(14) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_14\,
  DO(13) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_13\,
  DO(12) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_12\,
  DO(11) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_11\,
  DO(10) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_10\,
  DO(9) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_9\,
  DO(8) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_8\,
  DO(7) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_7\,
  DO(6) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_6\,
  DO(5) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_5\,
  DO(4) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_4\,
  DO(3) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_3\,
  DO(2) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_2\,
  DO(1) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_1\,
  DO(0) => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0_9\,
  DI(35 downto 32) => \u_psram_top/data_mask_d\(3 downto 0),
  DI(31) => \u_psram_top/wr_data_d\(55),
  DI(30) => \u_psram_top/wr_data_d\(39),
  DI(29) => \u_psram_top/wr_data_d\(23),
  DI(28) => \u_psram_top/wr_data_d\(7),
  DI(27) => \u_psram_top/wr_data_d\(54),
  DI(26) => \u_psram_top/wr_data_d\(38),
  DI(25) => \u_psram_top/wr_data_d\(22),
  DI(24) => \u_psram_top/wr_data_d\(6),
  DI(23) => \u_psram_top/wr_data_d\(53),
  DI(22) => \u_psram_top/wr_data_d\(37),
  DI(21) => \u_psram_top/wr_data_d\(21),
  DI(20) => \u_psram_top/wr_data_d\(5),
  DI(19) => \u_psram_top/wr_data_d\(52),
  DI(18) => \u_psram_top/wr_data_d\(36),
  DI(17) => \u_psram_top/wr_data_d\(20),
  DI(16) => \u_psram_top/wr_data_d\(4),
  DI(15) => \u_psram_top/wr_data_d\(51),
  DI(14) => \u_psram_top/wr_data_d\(35),
  DI(13) => \u_psram_top/wr_data_d\(19),
  DI(12) => \u_psram_top/wr_data_d\(3),
  DI(11) => \u_psram_top/wr_data_d\(50),
  DI(10) => \u_psram_top/wr_data_d\(34),
  DI(9) => \u_psram_top/wr_data_d\(18),
  DI(8) => \u_psram_top/wr_data_d\(2),
  DI(7) => \u_psram_top/wr_data_d\(49),
  DI(6) => \u_psram_top/wr_data_d\(33),
  DI(5) => \u_psram_top/wr_data_d\(17),
  DI(4) => \u_psram_top/wr_data_d\(1),
  DI(3) => \u_psram_top/wr_data_d\(48),
  DI(2) => \u_psram_top/wr_data_d\(32),
  DI(1) => \u_psram_top/wr_data_d\(16),
  DI(0) => \u_psram_top/wr_data_d\(0),
  BLKSELA(2) => GND_0,
  BLKSELA(1) => GND_0,
  BLKSELA(0) => GND_0,
  BLKSELB(2) => GND_0,
  BLKSELB(1) => GND_0,
  BLKSELB(0) => GND_0,
  ADA(13) => GND_0,
  ADA(12) => GND_0,
  ADA(11) => GND_0,
  ADA(10) => GND_0,
  ADA(9) => GND_0,
  ADA(8) => GND_0,
  ADA(7) => GND_0,
  ADA(6 downto 5) => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1 downto 0),
  ADA(4) => GND_0,
  ADA(3) => VCC_0,
  ADA(2) => VCC_0,
  ADA(1) => VCC_0,
  ADA(0) => VCC_0,
  ADB(13) => GND_0,
  ADB(12) => GND_0,
  ADB(11) => GND_0,
  ADB(10) => GND_0,
  ADB(9) => GND_0,
  ADB(8) => GND_0,
  ADB(7) => GND_0,
  ADB(6 downto 5) => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(1 downto 0),
  ADB(4) => GND_0,
  ADB(3) => GND_0,
  ADB(2) => GND_0,
  ADB(1) => GND_0,
  ADB(0) => GND_0,
  CLKA => NN_0,
  CLKB => NN_0,
  CEA => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_mem_data\,
  CEB => VCC_0,
  OCE => GND_0,
  RESETA => GND_0,
  RESETB => GND_0);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/mem_data_mem_data_0_0_s\: SDPX9B
generic map (
  BIT_WIDTH_0 => 36,
  BIT_WIDTH_1 => 36,
  READ_MODE => '0',
  RESET_MODE => "SYNC",
  BLK_SEL_0 => "000",
  BLK_SEL_1 => "000"
)
port map (
  DO(35) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3\,
  DO(34) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2\,
  DO(33) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1\,
  DO(32) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0\,
  DO(31) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_31\,
  DO(30) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_30\,
  DO(29) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_29\,
  DO(28) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_28\,
  DO(27) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_27\,
  DO(26) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_26\,
  DO(25) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_25\,
  DO(24) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_24\,
  DO(23) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_23\,
  DO(22) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_22\,
  DO(21) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_21\,
  DO(20) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_20\,
  DO(19) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_19\,
  DO(18) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_18\,
  DO(17) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_17\,
  DO(16) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_16\,
  DO(15) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_15\,
  DO(14) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_14\,
  DO(13) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_13\,
  DO(12) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_12\,
  DO(11) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_11\,
  DO(10) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_10\,
  DO(9) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_9\,
  DO(8) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_8\,
  DO(7) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_7\,
  DO(6) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_6\,
  DO(5) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_5\,
  DO(4) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_4\,
  DO(3) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_3\,
  DO(2) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_2\,
  DO(1) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_1\,
  DO(0) => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_0\,
  DI(35 downto 32) => \u_psram_top/data_mask_d\(7 downto 4),
  DI(31) => \u_psram_top/wr_data_d\(63),
  DI(30) => \u_psram_top/wr_data_d\(47),
  DI(29) => \u_psram_top/wr_data_d\(31),
  DI(28) => \u_psram_top/wr_data_d\(15),
  DI(27) => \u_psram_top/wr_data_d\(62),
  DI(26) => \u_psram_top/wr_data_d\(46),
  DI(25) => \u_psram_top/wr_data_d\(30),
  DI(24) => \u_psram_top/wr_data_d\(14),
  DI(23) => \u_psram_top/wr_data_d\(61),
  DI(22) => \u_psram_top/wr_data_d\(45),
  DI(21) => \u_psram_top/wr_data_d\(29),
  DI(20) => \u_psram_top/wr_data_d\(13),
  DI(19) => \u_psram_top/wr_data_d\(60),
  DI(18) => \u_psram_top/wr_data_d\(44),
  DI(17) => \u_psram_top/wr_data_d\(28),
  DI(16) => \u_psram_top/wr_data_d\(12),
  DI(15) => \u_psram_top/wr_data_d\(59),
  DI(14) => \u_psram_top/wr_data_d\(43),
  DI(13) => \u_psram_top/wr_data_d\(27),
  DI(12) => \u_psram_top/wr_data_d\(11),
  DI(11) => \u_psram_top/wr_data_d\(58),
  DI(10) => \u_psram_top/wr_data_d\(42),
  DI(9) => \u_psram_top/wr_data_d\(26),
  DI(8) => \u_psram_top/wr_data_d\(10),
  DI(7) => \u_psram_top/wr_data_d\(57),
  DI(6) => \u_psram_top/wr_data_d\(41),
  DI(5) => \u_psram_top/wr_data_d\(25),
  DI(4) => \u_psram_top/wr_data_d\(9),
  DI(3) => \u_psram_top/wr_data_d\(56),
  DI(2) => \u_psram_top/wr_data_d\(40),
  DI(1) => \u_psram_top/wr_data_d\(24),
  DI(0) => \u_psram_top/wr_data_d\(8),
  BLKSELA(2) => GND_0,
  BLKSELA(1) => GND_0,
  BLKSELA(0) => GND_0,
  BLKSELB(2) => GND_0,
  BLKSELB(1) => GND_0,
  BLKSELB(0) => GND_0,
  ADA(13) => GND_0,
  ADA(12) => GND_0,
  ADA(11) => GND_0,
  ADA(10) => GND_0,
  ADA(9) => GND_0,
  ADA(8) => GND_0,
  ADA(7) => GND_0,
  ADA(6 downto 5) => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1 downto 0),
  ADA(4) => GND_0,
  ADA(3) => VCC_0,
  ADA(2) => VCC_0,
  ADA(1) => VCC_0,
  ADA(0) => VCC_0,
  ADB(13) => GND_0,
  ADB(12) => GND_0,
  ADB(11) => GND_0,
  ADB(10) => GND_0,
  ADB(9) => GND_0,
  ADB(8) => GND_0,
  ADB(7) => GND_0,
  ADB(6 downto 5) => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(1 downto 0),
  ADB(4) => GND_0,
  ADB(3) => GND_0,
  ADB(2) => GND_0,
  ADB(1) => GND_0,
  ADB(0) => GND_0,
  CLKA => NN_0,
  CLKB => NN_0,
  CEA => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_mem_data\,
  CEB => VCC_0,
  OCE => GND_0,
  RESETA => GND_0,
  RESETB => GND_0);
\u_psram_top/u_psram_wd/n381_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n381,
  COUT => u_psram_top_u_psram_wd_n381_2,
  I0 => \u_psram_top/u_psram_wd/step\(1),
  I1 => \u_psram_top/u_psram_wd/step\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_wd/n380_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n380,
  COUT => u_psram_top_u_psram_wd_n380_2,
  I0 => \u_psram_top/u_psram_wd/step\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n381_2);
\u_psram_top/u_psram_wd/n379_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n379,
  COUT => u_psram_top_u_psram_wd_n379_2,
  I0 => \u_psram_top/u_psram_wd/step\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n380_2);
\u_psram_top/u_psram_wd/n378_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n378,
  COUT => u_psram_top_u_psram_wd_n378_2,
  I0 => \u_psram_top/u_psram_wd/step\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n379_2);
\u_psram_top/u_psram_wd/n377_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n377,
  COUT => u_psram_top_u_psram_wd_n377_2,
  I0 => \u_psram_top/u_psram_wd/step\(5),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n378_2);
\u_psram_top/u_psram_wd/n376_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n376,
  COUT => u_psram_top_u_psram_wd_n376_2,
  I0 => \u_psram_top/u_psram_wd/step\(6),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n377_2);
\u_psram_top/u_psram_wd/n375_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n375,
  COUT => u_psram_top_u_psram_wd_n375_2,
  I0 => \u_psram_top/u_psram_wd/step\(7),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n376_2);
\u_psram_top/u_psram_wd/n374_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_wd_n374,
  COUT => u_psram_top_u_psram_wd_n374_2,
  I0 => \u_psram_top/u_psram_wd/step\(8),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_wd_n375_2);
\u_psram_top/u_psram_init/n1130_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1130,
  COUT => u_psram_top_u_psram_init_n1130_2,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_init/n1129_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1129,
  COUT => u_psram_top_u_psram_init_n1129_2,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1130_2);
\u_psram_top/u_psram_init/n1128_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1128,
  COUT => u_psram_top_u_psram_init_n1128_2,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1129_2);
\u_psram_top/u_psram_init/n1127_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1127,
  COUT => u_psram_top_u_psram_init_n1127_2,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1128_2);
\u_psram_top/u_psram_init/n1274_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1274,
  COUT => u_psram_top_u_psram_init_n1274_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_init/n1273_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1273,
  COUT => u_psram_top_u_psram_init_n1273_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1274_2);
\u_psram_top/u_psram_init/n1272_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1272,
  COUT => u_psram_top_u_psram_init_n1272_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1273_2);
\u_psram_top/u_psram_init/n1271_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1271,
  COUT => u_psram_top_u_psram_init_n1271_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1272_2);
\u_psram_top/u_psram_init/n1270_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1270,
  COUT => u_psram_top_u_psram_init_n1270_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(5),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1271_2);
\u_psram_top/u_psram_init/n1269_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1269,
  COUT => u_psram_top_u_psram_init_n1269_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(6),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1270_2);
\u_psram_top/u_psram_init/n1268_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1268,
  COUT => u_psram_top_u_psram_init_n1268_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(7),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1269_2);
\u_psram_top/u_psram_init/n1492_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1492,
  COUT => u_psram_top_u_psram_init_n1492_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_init/n1491_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1491,
  COUT => u_psram_top_u_psram_init_n1491_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1492_2);
\u_psram_top/u_psram_init/n1490_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1490,
  COUT => u_psram_top_u_psram_init_n1490_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1491_2);
\u_psram_top/u_psram_init/n1489_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1489,
  COUT => u_psram_top_u_psram_init_n1489_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1490_2);
\u_psram_top/u_psram_init/n1745_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1745,
  COUT => u_psram_top_u_psram_init_n1745_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_init/n1744_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1744,
  COUT => u_psram_top_u_psram_init_n1744_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1745_2);
\u_psram_top/u_psram_init/n1743_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1743,
  COUT => u_psram_top_u_psram_init_n1743_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1744_2);
\u_psram_top/u_psram_init/n1742_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1742,
  COUT => u_psram_top_u_psram_init_n1742_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1743_2);
\u_psram_top/u_psram_init/n1741_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1741,
  COUT => u_psram_top_u_psram_init_n1741_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(5),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1742_2);
\u_psram_top/u_psram_init/n1740_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1740,
  COUT => u_psram_top_u_psram_init_n1740_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(6),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1741_2);
\u_psram_top/u_psram_init/n1739_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1739,
  COUT => u_psram_top_u_psram_init_n1739_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(7),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1740_2);
\u_psram_top/u_psram_init/n1963_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1963,
  COUT => u_psram_top_u_psram_init_n1963_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(0),
  I3 => GND_0,
  CIN => GND_0);
\u_psram_top/u_psram_init/n1962_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1962,
  COUT => u_psram_top_u_psram_init_n1962_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(2),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1963_2);
\u_psram_top/u_psram_init/n1961_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1961,
  COUT => u_psram_top_u_psram_init_n1961_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(3),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1962_2);
\u_psram_top/u_psram_init/n1960_s\: ALU
generic map (
  ALU_MODE => 0
)
port map (
  SUM => u_psram_top_u_psram_init_n1960,
  COUT => u_psram_top_u_psram_init_n1960_2,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(4),
  I1 => GND_0,
  I3 => GND_0,
  CIN => u_psram_top_u_psram_init_n1961_2);
\u_psram_top/wr_data_d_63_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(63),
  I0 => wr_data(63),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_62_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(62),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(62),
  I2 => NN_1);
\u_psram_top/wr_data_d_61_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(61),
  I0 => wr_data(61),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_60_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(60),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(60),
  I2 => NN_1);
\u_psram_top/wr_data_d_59_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(59),
  I0 => wr_data(59),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_58_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(58),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(58),
  I2 => NN_1);
\u_psram_top/wr_data_d_56_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(56),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(56),
  I2 => NN_1);
\u_psram_top/wr_data_d_55_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(55),
  I0 => wr_data(55),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_54_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(54),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(54),
  I2 => NN_1);
\u_psram_top/wr_data_d_53_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(53),
  I0 => wr_data(53),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_52_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(52),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(52),
  I2 => NN_1);
\u_psram_top/wr_data_d_51_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(51),
  I0 => wr_data(51),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_50_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(50),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(50),
  I2 => NN_1);
\u_psram_top/wr_data_d_48_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(48),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(48),
  I2 => NN_1);
\u_psram_top/wr_data_d_47_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(47),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(47),
  I2 => NN_1);
\u_psram_top/wr_data_d_46_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(46),
  I0 => wr_data(46),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_45_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(45),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(45),
  I2 => NN_1);
\u_psram_top/wr_data_d_44_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(44),
  I0 => wr_data(44),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_43_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(43),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(43),
  I2 => NN_1);
\u_psram_top/wr_data_d_42_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(42),
  I0 => wr_data(42),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_41_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(41),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(41),
  I2 => NN_1);
\u_psram_top/wr_data_d_39_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(39),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(39),
  I2 => NN_1);
\u_psram_top/wr_data_d_38_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(38),
  I0 => wr_data(38),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_37_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(37),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(37),
  I2 => NN_1);
\u_psram_top/wr_data_d_36_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(36),
  I0 => wr_data(36),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_35_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(35),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(35),
  I2 => NN_1);
\u_psram_top/wr_data_d_34_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(34),
  I0 => wr_data(34),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_33_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(33),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(33),
  I2 => NN_1);
\u_psram_top/wr_data_d_31_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(31),
  I0 => wr_data(31),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_30_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(30),
  I0 => wr_data(30),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_29_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(29),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(29),
  I2 => NN_1);
\u_psram_top/wr_data_d_28_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(28),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(28),
  I2 => NN_1);
\u_psram_top/wr_data_d_25_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(25),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(25),
  I2 => NN_1);
\u_psram_top/wr_data_d_24_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(24),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(24),
  I2 => NN_1);
\u_psram_top/wr_data_d_23_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(23),
  I0 => wr_data(23),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_22_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(22),
  I0 => wr_data(22),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_21_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(21),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(21),
  I2 => NN_1);
\u_psram_top/wr_data_d_20_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(20),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(20),
  I2 => NN_1);
\u_psram_top/wr_data_d_17_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(17),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(17),
  I2 => NN_1);
\u_psram_top/wr_data_d_16_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(16),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(16),
  I2 => NN_1);
\u_psram_top/wr_data_d_15_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(15),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(15),
  I2 => NN_1);
\u_psram_top/wr_data_d_14_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(14),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(14),
  I2 => NN_1);
\u_psram_top/wr_data_d_12_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(12),
  I0 => wr_data(12),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_11_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(11),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(11),
  I2 => NN_1);
\u_psram_top/wr_data_d_10_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(10),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(10),
  I2 => NN_1);
\u_psram_top/wr_data_d_8_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(8),
  I0 => wr_data(8),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_7_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(7),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(7),
  I2 => NN_1);
\u_psram_top/wr_data_d_6_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(6),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(6),
  I2 => NN_1);
\u_psram_top/wr_data_d_4_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(4),
  I0 => wr_data(4),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/wr_data_d_3_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(3),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(58),
  I1 => wr_data(3),
  I2 => NN_1);
\u_psram_top/wr_data_d_2_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top/wr_data_d\(2),
  I0 => \u_psram_top/u_psram_init/wr_data_calib\(62),
  I1 => wr_data(2),
  I2 => NN_1);
\u_psram_top/wr_data_d_0_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top/wr_data_d\(0),
  I0 => wr_data(0),
  I1 => \u_psram_top/u_psram_init/wr_data_calib\(63),
  I2 => NN_1);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_en_s0\: LUT4
generic map (
  INIT => X"3500"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_en\,
  I0 => u_psram_top_u_psram_init_cmd_calib,
  I1 => cmd,
  I2 => NN_1,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n2024_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_CA_63\,
  I0 => u_psram_top_u_psram_init_cmd_en_calib,
  I1 => cmd_en,
  I2 => NN_1);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n881_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n881\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n905_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n905\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(6),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(6));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1323_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1323\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1332_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1332\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(14),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_29_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(29),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_29\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_27_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(27),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_27\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_23_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(23),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_23\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_16_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(16),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_16\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_16\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_13_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(13),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_13\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_13\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_12_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(12),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_12\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_12\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_9_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(9),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_9\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_9\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_8_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(8),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_8\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_5_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(5),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_5\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_5\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_4_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(4),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_4\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_4\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_2_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(2),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_2\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2_5\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_1_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(1),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_1\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1_5\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n763_s0\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q0_d\(2),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(2));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n767_s0\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n767\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q1_d\(2),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(2));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n771_s0\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n771\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q2_d\(2),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3\(2));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1323_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1323\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(4));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1332_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1332\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(14),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_29_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(29),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_29\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_27_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(27),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_27\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_23_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(23),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_23\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_16_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(16),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_16\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_16\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_13_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(13),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_13\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_13\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_12_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(12),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_12\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_12\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_9_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(9),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_9\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_9\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_8_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(8),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_8\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_5_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(5),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_5\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_5\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_4_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(4),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_4\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_4\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_2_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(2),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_2\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2_5\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_1_s0\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(1),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_1\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1_5\);
\u_psram_top/u_psram_init/n162_s0\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n162,
  I0 => u_psram_top_u_psram_init_n162_4,
  I1 => u_psram_top_u_psram_init_n162_5,
  I2 => u_psram_top_u_psram_init_n162_6,
  I3 => u_psram_top_u_psram_init_n162_7);
\u_psram_top/u_psram_init/n245_s5\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n245,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I2 => u_psram_top_u_psram_init_n245_11);
\u_psram_top/u_psram_init/out_dq_Z_15_s\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top/u_psram_init/out_dq_Z\(15),
  I0 => \u_psram_top/u_psram_init/timer_cnt\(3),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(2),
  I2 => u_psram_top_u_psram_init_out_dq_Z_15);
\u_psram_top/u_psram_init/n583_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n583,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I2 => u_psram_top_u_psram_init_n583_10);
\u_psram_top/u_psram_init/n628_s3\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_init_n628,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I2 => u_psram_top_u_psram_init_n628_7,
  I3 => u_psram_top_u_psram_init_n628_8);
\u_psram_top/u_psram_init/n1212_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_init_n1212,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\);
\u_psram_top/u_psram_init/n1229_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_u_psram_init_n1229,
  I0 => \u_psram_top/u_psram_init/adjust_over\(0),
  I1 => u_psram_top_u_psram_init_n1229_6);
\u_psram_top/u_psram_init/n1250_s0\: LUT4
generic map (
  INIT => X"00FE"
)
port map (
  F => u_psram_top_u_psram_init_n1250,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_Z\(0),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(0));
\u_psram_top/u_psram_init/n1265_s0\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_init_n1265,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(0),
  I1 => u_psram_top_u_psram_init_n1265_4,
  I2 => u_psram_top_u_psram_init_n1265_5,
  I3 => u_psram_top_u_psram_init_n1265_6);
\u_psram_top/u_psram_init/n1410_s0\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1410,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I1 => u_psram_top_u_psram_init_n1410_4,
  I2 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1443_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1443,
  I0 => u_psram_top_u_psram_init_n1410,
  I1 => u_psram_top_u_psram_init_n1150_12,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1444_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1444,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1444_7,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1445_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1445,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1445_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1446_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1446,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1446_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1447_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1447,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1447_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1448_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1448,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1448_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1449_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1449,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1449_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1450_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1450,
  I0 => u_psram_top_u_psram_init_n1444_7,
  I1 => u_psram_top_u_psram_init_n1450_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1451_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1451,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1452_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1452,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1453_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1453,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1454_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1454,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1455_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1455,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1456_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1456,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1457_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1457,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1458_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1458,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1451_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1459_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1459,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1460_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1460,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1461_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1461,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1462_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1462,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1463_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1463,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1464_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1464,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1465_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1465,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1466_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1466,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1459_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1467_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1467,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1468_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1468,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1469_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1469,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1470_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1470,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1471_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1471,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1472_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1472,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1473_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1473,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1474_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1474,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1467_4,
  I2 => u_psram_top_u_psram_init_n2437_8);
\u_psram_top/u_psram_init/n1620_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n1620,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I1 => u_psram_top_u_psram_init_n2437);
\u_psram_top/u_psram_init/n1700_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_u_psram_init_n1700,
  I0 => \u_psram_top/u_psram_init/adjust_over\(1),
  I1 => u_psram_top_u_psram_init_n1700_6);
\u_psram_top/u_psram_init/n1721_s0\: LUT4
generic map (
  INIT => X"00FE"
)
port map (
  F => u_psram_top_u_psram_init_n1721,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_Z\(1),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(0));
\u_psram_top/u_psram_init/n1736_s0\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_init_n1736,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(0),
  I1 => u_psram_top_u_psram_init_n1736_4,
  I2 => u_psram_top_u_psram_init_n1736_5,
  I3 => u_psram_top_u_psram_init_n1736_6);
\u_psram_top/u_psram_init/n1881_s0\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1881,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I1 => u_psram_top_u_psram_init_n1881_4,
  I2 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n1914_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1914,
  I0 => u_psram_top_u_psram_init_n1881,
  I1 => u_psram_top_u_psram_init_n1150_12,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1915_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1915,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1916_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1916,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1917_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1917,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1918_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1918,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1919_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1919,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1920_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1920,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1921_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1921,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1915_6,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1922_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1922,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1923_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1923,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1924_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1924,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1925_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1925,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1926_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1926,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1927_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1927,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1928_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1928,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1929_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1929,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1922_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1930_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1930,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1931_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1931,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1932_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1932,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1933_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1933,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1934_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1934,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1935_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1935,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1936_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1936,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1937_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1937,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1930_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1938_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1938,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1939_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1939,
  I0 => u_psram_top_u_psram_init_n1444_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1940_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1940,
  I0 => u_psram_top_u_psram_init_n1445_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1941_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1941,
  I0 => u_psram_top_u_psram_init_n1446_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1942_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1942,
  I0 => u_psram_top_u_psram_init_n1447_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1943_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1943,
  I0 => u_psram_top_u_psram_init_n1448_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1944_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1944,
  I0 => u_psram_top_u_psram_init_n1449_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n1945_s0\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_psram_top_u_psram_init_n1945,
  I0 => u_psram_top_u_psram_init_n1450_4,
  I1 => u_psram_top_u_psram_init_n1938_4,
  I2 => u_psram_top_u_psram_init_n2469_8);
\u_psram_top/u_psram_init/n2091_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n2091,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I1 => u_psram_top_u_psram_init_n2469);
\u_psram_top/u_psram_sync/n13_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_sync_n13,
  I0 => pll_lock,
  I1 => u_psram_top_dll_lock);
\u_psram_top/u_psram_sync/n86_s0\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n86,
  I0 => u_psram_top_u_psram_sync_n86_4,
  I1 => u_psram_top_u_psram_sync_n86_5,
  I2 => u_psram_top_u_psram_sync_n86_6,
  I3 => u_psram_top_u_psram_sync_n86_7);
\u_psram_top/n492_s1\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_n492,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => u_psram_top_u_psram_sync_dll_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n919_s1\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n919\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\(2),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n919\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n920_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n920\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\(2),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1421_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421_6\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1422_s1\: LUT4
generic map (
  INIT => X"0F11"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_init_delay_all\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422_6\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1538_s1\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_init/out_dq_Z\(62),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538_6\);
\u_psram_top/u_psram_wd/rd_data_valid_d0_s\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_wd_rd_data_valid_d0,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_data_ctrl_reg_s3\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg_8\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_ctrl_reg_s3\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg_8\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(11),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(7));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d_s3\: LUT4
generic map (
  INIT => X"FCFA"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_valid_d\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(17),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(18),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1332\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d_s3\: LUT4
generic map (
  INIT => X"FAFC"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_rd_data_valid_d\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(18),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(17),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1332\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3));
\u_psram_top/u_psram_init/wr_data_63_s3\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_psram_top_u_psram_init_wr_data_63,
  I0 => u_psram_top_u_psram_init_n628,
  I1 => u_psram_top_u_psram_init_wr_data_63_6);
\u_psram_top/u_psram_init/read_calibration[0].wr_ptr_2_s3\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2\,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I3 => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2_11\);
\u_psram_top/u_psram_init/VALUE_0_s3\: LUT3
generic map (
  INIT => X"FE"
)
port map (
  F => u_psram_top_u_psram_init_VALUE_0,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I2 => \u_psram_top/u_psram_init/adjust_over\(0));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s3\: LUT4
generic map (
  INIT => X"FFE0"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5\,
  I0 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_9\,
  I1 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_10\,
  I2 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_11\,
  I3 => u_psram_top_u_psram_init_read_over_12);
\u_psram_top/u_psram_init/read_calibration[1].wr_ptr_2_s3\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].wr_ptr_2\,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I3 => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2_11\);
\u_psram_top/u_psram_init/VALUE_1_s3\: LUT3
generic map (
  INIT => X"FE"
)
port map (
  F => u_psram_top_u_psram_init_VALUE_1,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I2 => \u_psram_top/u_psram_init/adjust_over\(1));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s3\: LUT4
generic map (
  INIT => X"FFE0"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5\,
  I0 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_9\,
  I1 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_10\,
  I2 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_11\,
  I3 => u_psram_top_u_psram_init_read_over_12);
\u_psram_top/u_psram_init/n_state.IDLE_s14\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.IDLE\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => \u_psram_top_u_psram_init_c_state.IDLE\);
\u_psram_top/u_psram_init/n_state.TVCS_WAITE_s15\: LUT3
generic map (
  INIT => X"F4"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.TVCS_WAITE\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I2 => \u_psram_top_u_psram_init_c_state.IDLE\);
\u_psram_top/u_psram_init/n_state.CONFIG_CR_s14\: LUT4
generic map (
  INIT => X"F444"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.CONFIG_CR\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\,
  I2 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I3 => u_psram_top_u_psram_init_Tvcs_done);
\u_psram_top/u_psram_init/n_state.WRITE_DATA_s14\: LUT4
generic map (
  INIT => X"F5C0"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.WRITE_DATA\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => u_psram_top_u_psram_init_config_done_Z,
  I2 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\,
  I3 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\);
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s15\: LUT4
generic map (
  INIT => X"B0FF"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA\,
  I0 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_29\,
  I1 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_21\,
  I2 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I3 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_22\);
\u_psram_top/u_psram_init/n_state.ADJUST_PHASE_WAITE_s14\: LUT4
generic map (
  INIT => X"F444"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_PHASE_WAITE\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\,
  I2 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I3 => u_psram_top_u_psram_init_read_over_12);
\u_psram_top/u_psram_init/n_state.ADJUST_PHASE_s15\: LUT3
generic map (
  INIT => X"F4"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_PHASE\,
  I0 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\);
\u_psram_top/u_psram_init/n_state.INIT_CALIB_WAITE_s15\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE\,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\,
  I1 => \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE_20\,
  I2 => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I3 => \u_psram_top_u_psram_init_c_state.INIT_CALIB_WAITE\);
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_WAITE_s15\: LUT4
generic map (
  INIT => X"FFF4"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE\,
  I0 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_20\,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I2 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_29\,
  I3 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_25\);
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_s14\: LUT4
generic map (
  INIT => X"FA30"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY\,
  I0 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_19\,
  I1 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_20\,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\);
\u_psram_top/u_psram_init/n_state.INIT_CALIB_DONE_s15\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.INIT_CALIB_DONE\,
  I0 => \u_psram_top_u_psram_init_c_state.INIT_CALIB_WAITE\,
  I1 => \u_psram_top_u_psram_init_c_state.INIT_CALIB_DONE\);
\u_psram_top/u_psram_sync/n348_s5\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_psram_top_u_psram_sync_n348,
  I0 => u_psram_top_u_psram_sync_n348_21,
  I1 => u_psram_top_u_psram_sync_n348_23,
  I2 => u_psram_top_u_psram_sync_n348_12,
  I3 => u_psram_top_u_psram_sync_n348_13);
\u_psram_top/u_psram_sync/n359_s6\: LUT3
generic map (
  INIT => X"0B"
)
port map (
  F => u_psram_top_u_psram_sync_n359,
  I0 => u_psram_top_u_psram_sync_n359_11,
  I1 => u_psram_top_u_psram_sync_n359_12,
  I2 => u_psram_top_u_psram_sync_n359_13);
\u_psram_top/u_psram_sync/n282_s12\: LUT4
generic map (
  INIT => X"3FA0"
)
port map (
  F => u_psram_top_u_psram_sync_n282,
  I0 => u_psram_top_u_psram_sync_n348_21,
  I1 => u_psram_top_u_psram_sync_n282_17,
  I2 => u_psram_top_u_psram_sync_n282_18,
  I3 => \u_psram_top/u_psram_sync/cs_memsync\(5));
\u_psram_top/u_psram_sync/n293_s12\: LUT4
generic map (
  INIT => X"5CCC"
)
port map (
  F => u_psram_top_u_psram_sync_n293,
  I0 => \u_psram_top/u_psram_sync/flag\(0),
  I1 => u_psram_top_u_psram_sync_stop,
  I2 => u_psram_top_u_psram_sync_n293_17,
  I3 => u_psram_top_u_psram_sync_n293_18);
\u_psram_top/u_psram_sync/n304_s12\: LUT4
generic map (
  INIT => X"3F40"
)
port map (
  F => u_psram_top_u_psram_sync_n304,
  I0 => \u_psram_top/u_psram_sync/flag\(0),
  I1 => u_psram_top_u_psram_sync_n304_17,
  I2 => u_psram_top_u_psram_sync_n293_17,
  I3 => \u_psram_top/u_psram_sync/cs_memsync\(3));
\u_psram_top/u_psram_sync/n315_s12\: LUT4
generic map (
  INIT => X"FF80"
)
port map (
  F => u_psram_top_u_psram_sync_n315,
  I0 => u_psram_top_u_psram_sync_n348_23,
  I1 => u_psram_top_u_psram_sync_n315_17,
  I2 => u_psram_top_u_psram_sync_lock_d2,
  I3 => u_psram_top_u_psram_sync_n315_18);
\u_psram_top/u_psram_sync/n326_s12\: LUT3
generic map (
  INIT => X"BC"
)
port map (
  F => u_psram_top_u_psram_sync_n326,
  I0 => \u_psram_top/u_psram_sync/flag\(0),
  I1 => u_psram_top_u_psram_sync_uddcntln,
  I2 => u_psram_top_u_psram_sync_n326_17);
\u_psram_top/u_psram_sync/n337_s12\: LUT4
generic map (
  INIT => X"FFB0"
)
port map (
  F => u_psram_top_u_psram_sync_n337,
  I0 => u_psram_top_u_psram_sync_lock_d2,
  I1 => u_psram_top_u_psram_sync_n359_13,
  I2 => NN,
  I3 => u_psram_top_u_psram_sync_n337_17);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1191_s1\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1191\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0));
\u_psram_top/wr_data_d_57_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(57),
  I0 => NN_1,
  I1 => wr_data(57));
\u_psram_top/wr_data_d_49_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(49),
  I0 => NN_1,
  I1 => wr_data(49));
\u_psram_top/wr_data_d_40_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(40),
  I0 => NN_1,
  I1 => wr_data(40));
\u_psram_top/wr_data_d_32_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(32),
  I0 => NN_1,
  I1 => wr_data(32));
\u_psram_top/wr_data_d_27_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(27),
  I0 => NN_1,
  I1 => wr_data(27));
\u_psram_top/wr_data_d_26_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(26),
  I0 => NN_1,
  I1 => wr_data(26));
\u_psram_top/wr_data_d_19_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(19),
  I0 => NN_1,
  I1 => wr_data(19));
\u_psram_top/wr_data_d_18_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(18),
  I0 => NN_1,
  I1 => wr_data(18));
\u_psram_top/wr_data_d_13_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(13),
  I0 => NN_1,
  I1 => wr_data(13));
\u_psram_top/wr_data_d_9_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(9),
  I0 => NN_1,
  I1 => wr_data(9));
\u_psram_top/wr_data_d_5_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(5),
  I0 => NN_1,
  I1 => wr_data(5));
\u_psram_top/wr_data_d_1_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/wr_data_d\(1),
  I0 => NN_1,
  I1 => wr_data(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n786_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n786\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/q7_d\(3),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\);
\u_psram_top/u_psram_init/n1857_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_u_psram_init_n1857,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I1 => u_psram_top_u_psram_init_read_over_12);
\u_psram_top/u_psram_init/n1856_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1856,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1));
\u_psram_top/u_psram_init/n1855_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1855,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_read_over_12,
  I3 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(2));
\u_psram_top/u_psram_init/n1854_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1854,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(3),
  I2 => u_psram_top_u_psram_init_n1854_7);
\u_psram_top/u_psram_init/n1853_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1853,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1853_9);
\u_psram_top/u_psram_init/n1852_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1852,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(4),
  I1 => u_psram_top_u_psram_init_n1853_9,
  I2 => u_psram_top_u_psram_init_read_over_12,
  I3 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(5));
\u_psram_top/u_psram_init/n1671_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_psram_top_u_psram_init_n1671,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I3 => u_psram_top_u_psram_init_cmd_en_calib);
\u_psram_top/u_psram_init/n1670_s3\: LUT4
generic map (
  INIT => X"0B0C"
)
port map (
  F => u_psram_top_u_psram_init_n1670,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I2 => u_psram_top_u_psram_init_cmd_en_calib,
  I3 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1));
\u_psram_top/u_psram_init/n1669_s4\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_psram_top_u_psram_init_n1669,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I3 => u_psram_top_u_psram_init_cmd_en_calib);
\u_psram_top/u_psram_init/n1386_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_u_psram_init_n1386,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I1 => u_psram_top_u_psram_init_read_over_12);
\u_psram_top/u_psram_init/n1385_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1385,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1));
\u_psram_top/u_psram_init/n1384_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1384,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_read_over_12,
  I3 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(2));
\u_psram_top/u_psram_init/n1383_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1383,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(3),
  I2 => u_psram_top_u_psram_init_n1383_7);
\u_psram_top/u_psram_init/n1382_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1382,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1382_9);
\u_psram_top/u_psram_init/n1381_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1381,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(4),
  I1 => u_psram_top_u_psram_init_n1382_9,
  I2 => u_psram_top_u_psram_init_read_over_12,
  I3 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(5));
\u_psram_top/u_psram_init/n1200_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_psram_top_u_psram_init_n1200,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I3 => u_psram_top_u_psram_init_cmd_en_calib);
\u_psram_top/u_psram_init/n1199_s3\: LUT4
generic map (
  INIT => X"0B0C"
)
port map (
  F => u_psram_top_u_psram_init_n1199,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I2 => u_psram_top_u_psram_init_cmd_en_calib,
  I3 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1));
\u_psram_top/u_psram_init/n1198_s4\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_psram_top_u_psram_init_n1198,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I3 => u_psram_top_u_psram_init_cmd_en_calib);
\u_psram_top/u_psram_init/n1166_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1166,
  I0 => \u_psram_top/u_psram_init/timer_cnt1\(2),
  I1 => u_psram_top_u_psram_init_n1167,
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/timer_cnt1\(3));
\u_psram_top/u_psram_init/n1164_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1164,
  I0 => \u_psram_top/u_psram_init/timer_cnt1\(4),
  I1 => u_psram_top_u_psram_init_n1165,
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/timer_cnt1\(5));
\u_psram_top/u_psram_init/n1085_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_psram_top_u_psram_init_n1085,
  I0 => \u_psram_top/u_psram_init/read_cnt\(0),
  I1 => u_psram_top_u_psram_init_timer_cnt1_clr);
\u_psram_top/u_psram_init/n1084_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1084,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/read_cnt\(0),
  I2 => \u_psram_top/u_psram_init/read_cnt\(1));
\u_psram_top/u_psram_init/n1083_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1083,
  I0 => \u_psram_top/u_psram_init/read_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_cnt\(1),
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/read_cnt\(2));
\u_psram_top/u_psram_init/n1082_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1082,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/read_cnt\(3),
  I2 => u_psram_top_u_psram_init_n1082_7);
\u_psram_top/u_psram_init/n1081_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1081,
  I0 => \u_psram_top/u_psram_init/read_cnt\(3),
  I1 => u_psram_top_u_psram_init_n1082_7,
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/read_cnt\(4));
\u_psram_top/u_psram_init/n1080_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1080,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/read_cnt\(5),
  I2 => u_psram_top_u_psram_init_read_over);
\u_psram_top/u_psram_init/n1079_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1079,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/read_cnt\(6),
  I2 => u_psram_top_u_psram_init_n1079_7);
\u_psram_top/u_psram_init/n1078_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1078,
  I0 => \u_psram_top/u_psram_init/read_cnt\(6),
  I1 => u_psram_top_u_psram_init_n1079_7,
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/read_cnt\(7));
\u_psram_top/u_psram_init/n1077_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_psram_top_u_psram_init_n1077,
  I0 => u_psram_top_u_psram_init_n1079_7,
  I1 => u_psram_top_u_psram_init_n1077_7,
  I2 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I3 => \u_psram_top/u_psram_init/read_cnt\(8));
\u_psram_top/u_psram_init/n901_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_init_n901,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I1 => u_psram_top_u_psram_init_n901_8);
\u_psram_top/u_psram_init/n194_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n194,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(0),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(2));
\u_psram_top/u_psram_init/n193_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_psram_top_u_psram_init_n193,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(0),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(2),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(3));
\u_psram_top/u_psram_init/n191_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n191,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I1 => u_psram_top_u_psram_init_n192,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(5));
\u_psram_top/u_psram_init/n190_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_psram_top_u_psram_init_n190,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(5),
  I2 => u_psram_top_u_psram_init_n192,
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(6));
\u_psram_top/u_psram_init/n188_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n188,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  I1 => u_psram_top_u_psram_init_n189_10,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(8));
\u_psram_top/u_psram_init/n187_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_psram_top_u_psram_init_n187,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(8),
  I2 => u_psram_top_u_psram_init_n189_10,
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(9));
\u_psram_top/u_psram_init/n185_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n185,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  I1 => u_psram_top_u_psram_init_n186,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(11));
\u_psram_top/u_psram_init/n184_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_psram_top_u_psram_init_n184,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(11),
  I2 => u_psram_top_u_psram_init_n186,
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(12));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1306_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1306\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1305_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1305\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(2));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1304_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1304\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(2),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1303_s2\: LUT4
generic map (
  INIT => X"35C0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303_7\,
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(4));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n136_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n136\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(3),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_10\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1305_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1305\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1304_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1304\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(2),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1303_s2\: LUT4
generic map (
  INIT => X"35C0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303_7\,
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n136_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n136\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(3),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4\,
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_0_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(0),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0_9\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_0\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_17_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(17),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_17\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_17\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_21_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(21),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_21\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_21\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_20_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(20),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_20\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_20\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_25_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(25),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_25\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_25\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_24_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(24),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_24\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_24\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_28_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(28),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_28\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_28\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_0_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(0),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_0\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_0\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_17_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(17),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_17\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_17\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_21_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(21),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_21\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_21\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_20_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(20),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_20\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_20\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_25_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(25),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_25\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_25\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_24_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(24),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_24\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_24\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_28_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(28),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_28\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_28\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_3_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(3),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_3\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_7_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(7),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_7\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_6_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(6),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_6\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_6\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_11_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(11),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_11\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_10_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(10),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_10\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_10\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_15_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(15),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_15\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_14_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(14),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_14\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_19_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(19),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_19\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_18_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(18),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_18\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_22_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(22),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_22\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_26_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(26),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_26\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_31_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(31),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_31\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_31\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_30_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq\(30),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_30\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_3_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(3),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_3\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_7_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(7),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_7\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_6_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(6),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_6\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_6\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_11_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(11),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_11\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_10_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(10),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_10\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_10\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_15_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(15),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_15\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_14_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(14),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_14\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_19_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(19),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_19\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_18_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(18),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_18\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_22_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(22),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_22\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_26_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(26),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_26\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_31_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(31),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_31\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_31\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq_30_s1\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_dq\(30),
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_data_d_30\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1196_s2\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1196\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1190_s2\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1190\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/qi0_d\(2));
\u_psram_top/addr_d_20_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(20),
  I0 => NN_1,
  I1 => addr(20));
\u_psram_top/addr_d_19_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(19),
  I0 => NN_1,
  I1 => addr(19));
\u_psram_top/addr_d_18_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(18),
  I0 => NN_1,
  I1 => addr(18));
\u_psram_top/addr_d_17_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(17),
  I0 => NN_1,
  I1 => addr(17));
\u_psram_top/addr_d_16_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(16),
  I0 => NN_1,
  I1 => addr(16));
\u_psram_top/addr_d_15_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(15),
  I0 => NN_1,
  I1 => addr(15));
\u_psram_top/addr_d_14_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(14),
  I0 => NN_1,
  I1 => addr(14));
\u_psram_top/addr_d_13_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(13),
  I0 => NN_1,
  I1 => addr(13));
\u_psram_top/addr_d_12_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(12),
  I0 => NN_1,
  I1 => addr(12));
\u_psram_top/addr_d_11_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(11),
  I0 => NN_1,
  I1 => addr(11));
\u_psram_top/addr_d_10_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(10),
  I0 => NN_1,
  I1 => addr(10));
\u_psram_top/addr_d_9_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(9),
  I0 => NN_1,
  I1 => addr(9));
\u_psram_top/addr_d_8_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(8),
  I0 => NN_1,
  I1 => addr(8));
\u_psram_top/addr_d_7_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(7),
  I0 => NN_1,
  I1 => addr(7));
\u_psram_top/addr_d_6_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(6),
  I0 => NN_1,
  I1 => addr(6));
\u_psram_top/addr_d_5_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(5),
  I0 => NN_1,
  I1 => addr(5));
\u_psram_top/addr_d_4_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(4),
  I0 => NN_1,
  I1 => addr(4));
\u_psram_top/addr_d_3_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(3),
  I0 => NN_1,
  I1 => addr(3));
\u_psram_top/addr_d_2_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(2),
  I0 => NN_1,
  I1 => addr(2));
\u_psram_top/addr_d_1_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(1),
  I0 => NN_1,
  I1 => addr(1));
\u_psram_top/addr_d_0_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/addr_d\(0),
  I0 => NN_1,
  I1 => addr(0));
\u_psram_top/u_psram_sync/n389_s3\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_sync_n389,
  I0 => \u_psram_top/u_psram_sync/count\(0),
  I1 => u_psram_top_u_psram_sync_n359_13,
  I2 => u_psram_top_u_psram_sync_n389_8);
\u_psram_top/u_psram_sync/n388_s2\: LUT4
generic map (
  INIT => X"1400"
)
port map (
  F => u_psram_top_u_psram_sync_n388,
  I0 => u_psram_top_u_psram_sync_n359_13,
  I1 => \u_psram_top/u_psram_sync/count\(0),
  I2 => \u_psram_top/u_psram_sync/count\(1),
  I3 => u_psram_top_u_psram_sync_n389_8);
\u_psram_top/u_psram_sync/n387_s2\: LUT4
generic map (
  INIT => X"1400"
)
port map (
  F => u_psram_top_u_psram_sync_n387,
  I0 => u_psram_top_u_psram_sync_n359_13,
  I1 => \u_psram_top/u_psram_sync/count\(2),
  I2 => u_psram_top_u_psram_sync_n387_7,
  I3 => u_psram_top_u_psram_sync_n389_8);
\u_psram_top/u_psram_sync/n49_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n49,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(0),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(2),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n46_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n46,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(4),
  I1 => u_psram_top_u_psram_sync_n47,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(5),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n44_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n44,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(6),
  I1 => u_psram_top_u_psram_sync_n45,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(7),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n42_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n42,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(8),
  I1 => u_psram_top_u_psram_sync_n43_9,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(9),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n40_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n40,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(10),
  I1 => u_psram_top_u_psram_sync_n41,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(11),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n39_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n39,
  I0 => u_psram_top_u_psram_sync_n41,
  I1 => u_psram_top_u_psram_sync_n39_6,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(12),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n38_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n38,
  I0 => u_psram_top_u_psram_sync_n41,
  I1 => u_psram_top_u_psram_sync_n38_8,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(13),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n37_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_psram_top_u_psram_sync_n37,
  I0 => u_psram_top_u_psram_sync_n41,
  I1 => u_psram_top_u_psram_sync_n37_8,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(14),
  I3 => u_psram_top_u_psram_sync_n51);
\u_psram_top/u_psram_sync/n36_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n36,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(14),
  I1 => u_psram_top_u_psram_sync_n51,
  I2 => u_psram_top_u_psram_sync_n41,
  I3 => u_psram_top_u_psram_sync_n37_8);
\u_psram_top/u_psram_init/n1720_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_psram_top_u_psram_init_n1720,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(1));
\u_psram_top/u_psram_init/n1719_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n1719,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(2));
\u_psram_top/u_psram_init/n1249_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_psram_top_u_psram_init_n1249,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(1));
\u_psram_top/u_psram_init/n1248_s2\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => u_psram_top_u_psram_init_n1248,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(2));
\u_psram_top/u_psram_init/out_dq_Z_16_s\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top/u_psram_init/out_dq_Z\(16),
  I0 => \u_psram_top/u_psram_init/timer_cnt\(2),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(3),
  I2 => u_psram_top_u_psram_init_out_dq_Z_16);
\u_psram_top/rd_data_e_63_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(63),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(63));
\u_psram_top/rd_data_e_62_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(62),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(62));
\u_psram_top/rd_data_e_61_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(61),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(61));
\u_psram_top/rd_data_e_60_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(60),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(60));
\u_psram_top/rd_data_e_59_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(59),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(59));
\u_psram_top/rd_data_e_58_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(58),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(58));
\u_psram_top/rd_data_e_57_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(57),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(57));
\u_psram_top/rd_data_e_56_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(56),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(56));
\u_psram_top/rd_data_e_55_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(55),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(55));
\u_psram_top/rd_data_e_54_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(54),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(54));
\u_psram_top/rd_data_e_53_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(53),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(53));
\u_psram_top/rd_data_e_52_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(52),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(52));
\u_psram_top/rd_data_e_51_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(51),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(51));
\u_psram_top/rd_data_e_50_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(50),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(50));
\u_psram_top/rd_data_e_49_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(49),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(49));
\u_psram_top/rd_data_e_48_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(48),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(48));
\u_psram_top/rd_data_e_47_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(47),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(47));
\u_psram_top/rd_data_e_46_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(46),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(46));
\u_psram_top/rd_data_e_45_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(45),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(45));
\u_psram_top/rd_data_e_44_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(44),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(44));
\u_psram_top/rd_data_e_43_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(43),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(43));
\u_psram_top/rd_data_e_42_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(42),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(42));
\u_psram_top/rd_data_e_41_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(41),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(41));
\u_psram_top/rd_data_e_40_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(40),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(40));
\u_psram_top/rd_data_e_39_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(39),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(39));
\u_psram_top/rd_data_e_38_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(38),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(38));
\u_psram_top/rd_data_e_37_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(37),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(37));
\u_psram_top/rd_data_e_36_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(36),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(36));
\u_psram_top/rd_data_e_35_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(35),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(35));
\u_psram_top/rd_data_e_34_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(34),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(34));
\u_psram_top/rd_data_e_33_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(33),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(33));
\u_psram_top/rd_data_e_32_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(32),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(32));
\u_psram_top/rd_data_e_31_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(31),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(31));
\u_psram_top/rd_data_e_30_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(30),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(30));
\u_psram_top/rd_data_e_29_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(29),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(29));
\u_psram_top/rd_data_e_28_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(28),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(28));
\u_psram_top/rd_data_e_27_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(27),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(27));
\u_psram_top/rd_data_e_26_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(26),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(26));
\u_psram_top/rd_data_e_25_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(25),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(25));
\u_psram_top/rd_data_e_24_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(24),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(24));
\u_psram_top/rd_data_e_23_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(23),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(23));
\u_psram_top/rd_data_e_22_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(22),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(22));
\u_psram_top/rd_data_e_21_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(21),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(21));
\u_psram_top/rd_data_e_20_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(20),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(20));
\u_psram_top/rd_data_e_19_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(19),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(19));
\u_psram_top/rd_data_e_18_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(18),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(18));
\u_psram_top/rd_data_e_17_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(17),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(17));
\u_psram_top/rd_data_e_16_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(16),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(16));
\u_psram_top/rd_data_e_15_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(15),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(15));
\u_psram_top/rd_data_e_14_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(14),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(14));
\u_psram_top/rd_data_e_13_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(13),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(13));
\u_psram_top/rd_data_e_12_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(12),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(12));
\u_psram_top/rd_data_e_11_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(11),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(11));
\u_psram_top/rd_data_e_10_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(10),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(10));
\u_psram_top/rd_data_e_9_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(9),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(9));
\u_psram_top/rd_data_e_8_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(8),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(8));
\u_psram_top/rd_data_e_7_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(7),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(7));
\u_psram_top/rd_data_e_6_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(6),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(6));
\u_psram_top/rd_data_e_5_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(5),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(5));
\u_psram_top/rd_data_e_4_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(4),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(4));
\u_psram_top/rd_data_e_3_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(3),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(3));
\u_psram_top/rd_data_e_2_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(2),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(2));
\u_psram_top/rd_data_e_1_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(1),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(1));
\u_psram_top/rd_data_e_0_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data(0),
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(0));
\u_psram_top/rd_data_valid_d_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => rd_data_valid,
  I0 => NN_1,
  I1 => u_psram_top_rd_data_valid_d);
\u_psram_top/rd_data_valid_calib_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_rd_data_valid_calib,
  I0 => NN_1,
  I1 => u_psram_top_rd_data_valid_d);
\u_psram_top/data_mask_d_7_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(7),
  I0 => NN_1,
  I1 => data_mask(7));
\u_psram_top/data_mask_d_6_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(6),
  I0 => NN_1,
  I1 => data_mask(6));
\u_psram_top/data_mask_d_5_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(5),
  I0 => NN_1,
  I1 => data_mask(5));
\u_psram_top/data_mask_d_4_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(4),
  I0 => NN_1,
  I1 => data_mask(4));
\u_psram_top/data_mask_d_3_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(3),
  I0 => NN_1,
  I1 => data_mask(3));
\u_psram_top/data_mask_d_2_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(2),
  I0 => NN_1,
  I1 => data_mask(2));
\u_psram_top/data_mask_d_1_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(1),
  I0 => NN_1,
  I1 => data_mask(1));
\u_psram_top/data_mask_d_0_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top/data_mask_d\(0),
  I0 => NN_1,
  I1 => data_mask(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n298_s2\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\,
  I0 => NN_1,
  I1 => u_psram_top_u_psram_init_cmd_en_calib,
  I2 => u_psram_top_u_psram_init_cmd_calib,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298_7\);
\u_psram_top/u_psram_init/n596_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_psram_top_u_psram_init_n596,
  I0 => u_psram_top_u_psram_init_n583,
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(1),
  I2 => \u_psram_top/u_psram_init/timer_cnt0\(0));
\u_psram_top/u_psram_init/n594_s1\: LUT4
generic map (
  INIT => X"F7F8"
)
port map (
  F => u_psram_top_u_psram_init_n594,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(2),
  I1 => u_psram_top_u_psram_init_n628_7,
  I2 => u_psram_top_u_psram_init_n583,
  I3 => \u_psram_top/u_psram_init/timer_cnt0\(3));
\u_psram_top/u_psram_init/n258_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_psram_top_u_psram_init_n258,
  I0 => u_psram_top_u_psram_init_n245,
  I1 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I2 => \u_psram_top/u_psram_init/timer_cnt\(0));
\u_psram_top/u_psram_init/n257_s1\: LUT4
generic map (
  INIT => X"F7F8"
)
port map (
  F => u_psram_top_u_psram_init_n257,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I2 => u_psram_top_u_psram_init_n245,
  I3 => \u_psram_top/u_psram_init/timer_cnt\(2));
\u_psram_top/u_psram_init/n256_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_psram_top_u_psram_init_n256,
  I0 => u_psram_top_u_psram_init_n245,
  I1 => u_psram_top_u_psram_init_n256_6,
  I2 => \u_psram_top/u_psram_init/timer_cnt\(3));
\u_psram_top/u_psram_init/n906_s1\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_init_n906,
  I0 => u_psram_top_u_psram_init_n628,
  I1 => u_psram_top_u_psram_init_wr_data_63_6);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n790_s1\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_29_s2\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(1),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_29_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di1\(1),
  I1 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_27_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(3),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_27_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_27_5\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di5\(3),
  I1 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_16_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_16\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_13_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_13\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3\(1),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_12_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_12\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d3\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_9_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_9\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(1),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_8_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_8\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_5_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_5\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(1),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_4_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_4\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_2_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(2),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_2_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_2_5\,
  I0 => u_psram_top_u_psram_init_config_done_Z,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_1_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(1),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I2 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_1_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_1_5\,
  I0 => u_psram_top_u_psram_init_config_done_Z,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/di0\(1));
\u_psram_top/u_psram_init/n2437_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2437,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(1),
  I2 => u_psram_top_u_psram_init_n2437_5,
  I3 => u_psram_top_u_psram_init_n2437_6);
\u_psram_top/u_psram_init/n162_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_init_n162_4,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(0),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(2),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(3));
\u_psram_top/u_psram_init/n162_s2\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_init_n162_5,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(8),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(9),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(11));
\u_psram_top/u_psram_init/n162_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_psram_top_u_psram_init_n162_6,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(12),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(13),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(14),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(15));
\u_psram_top/u_psram_init/n162_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_init_n162_7,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(5),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(6),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(7));
\u_psram_top/u_psram_init/out_dq_Z_15_s0\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_psram_top_u_psram_init_out_dq_Z_15,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I2 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I3 => \u_psram_top/u_psram_init/timer_cnt\(4));
\u_psram_top/u_psram_init/n628_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n628_7,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(1));
\u_psram_top/u_psram_init/n628_s5\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_init_n628_8,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(2),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(3));
\u_psram_top/u_psram_init/n1150_s6\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1150,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(2));
\u_psram_top/u_psram_init/n1229_s3\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_psram_top_u_psram_init_n1229_6,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt\(0),
  I3 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\);
\u_psram_top/u_psram_init/n1265_s1\: LUT4
generic map (
  INIT => X"9009"
)
port map (
  F => u_psram_top_u_psram_init_n1265_4,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(4),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(1));
\u_psram_top/u_psram_init/n1265_s2\: LUT4
generic map (
  INIT => X"1001"
)
port map (
  F => u_psram_top_u_psram_init_n1265_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(7),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(4));
\u_psram_top/u_psram_init/n1265_s3\: LUT4
generic map (
  INIT => X"9009"
)
port map (
  F => u_psram_top_u_psram_init_n1265_6,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(5),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(6),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(3));
\u_psram_top/u_psram_init/n1410_s1\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_init_n1410_4,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(4),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(5));
\u_psram_top/u_psram_init/n1410_s2\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_init_n1410_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(2),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(3));
\u_psram_top/u_psram_init/n1444_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1444_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(2));
\u_psram_top/u_psram_init/n1445_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1445_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(2));
\u_psram_top/u_psram_init/n1446_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n1446_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(2));
\u_psram_top/u_psram_init/n1447_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1447_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(2),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(0));
\u_psram_top/u_psram_init/n1448_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n1448_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(2),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(1));
\u_psram_top/u_psram_init/n1449_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n1449_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(2),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(0));
\u_psram_top/u_psram_init/n1450_s1\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_psram_top_u_psram_init_n1450_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(1),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(2));
\u_psram_top/u_psram_init/n1451_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1451_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1410);
\u_psram_top/u_psram_init/n1459_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1459_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I2 => u_psram_top_u_psram_init_n1410);
\u_psram_top/u_psram_init/n1467_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n1467_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1410);
\u_psram_top/u_psram_init/n1700_s3\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_psram_top_u_psram_init_n1700_6,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt\(0),
  I3 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\);
\u_psram_top/u_psram_init/n1736_s1\: LUT4
generic map (
  INIT => X"9009"
)
port map (
  F => u_psram_top_u_psram_init_n1736_4,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(4),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(1));
\u_psram_top/u_psram_init/n1736_s2\: LUT4
generic map (
  INIT => X"1001"
)
port map (
  F => u_psram_top_u_psram_init_n1736_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(7),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(4));
\u_psram_top/u_psram_init/n1736_s3\: LUT4
generic map (
  INIT => X"9009"
)
port map (
  F => u_psram_top_u_psram_init_n1736_6,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(5),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(6),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(3));
\u_psram_top/u_psram_init/n2469_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2469,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(1),
  I2 => u_psram_top_u_psram_init_n2469_5,
  I3 => u_psram_top_u_psram_init_n2469_6);
\u_psram_top/u_psram_init/n1881_s1\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_init_n1881_4,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(2),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(5));
\u_psram_top/u_psram_init/n1881_s2\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_init_n1881_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(3),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(4));
\u_psram_top/u_psram_init/n1922_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1922_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1881);
\u_psram_top/u_psram_init/n1930_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_psram_top_u_psram_init_n1930_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I2 => u_psram_top_u_psram_init_n1881);
\u_psram_top/u_psram_init/n1938_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n1938_4,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1881);
\u_psram_top/u_psram_sync/n86_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_sync_n86_4,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(0),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(1),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(2));
\u_psram_top/u_psram_sync/n86_s2\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_sync_n86_5,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(7),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(8),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(9),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(10));
\u_psram_top/u_psram_sync/n86_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_psram_top_u_psram_sync_n86_6,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(11),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(12),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(13),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(14));
\u_psram_top/u_psram_sync/n86_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_sync_n86_7,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(3),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(4),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(5),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(6));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n919_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n919\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_init_delay_all\(3),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1421_s2\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1421_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(3),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(3),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I3 => u_psram_top_u_psram_init_config_done_Z);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1422_s2\: LUT4
generic map (
  INIT => X"F0EE"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1422_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(2),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_datats\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1538_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(13),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_4_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_4_s5\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_4_s6\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_ctrl_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_4_s4\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(3),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_4_s5\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_10\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_4_s4\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3));
\u_psram_top/u_psram_init/wr_data_63_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_psram_top_u_psram_init_wr_data_63_6,
  I0 => \u_psram_top/u_psram_init/timer_cnt1\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt1\(5),
  I2 => u_psram_top_u_psram_init_wr_data_63_9,
  I3 => u_psram_top_u_psram_init_n1165);
\u_psram_top/u_psram_init/read_over_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_read_over,
  I0 => \u_psram_top/u_psram_init/read_cnt\(3),
  I1 => \u_psram_top/u_psram_init/read_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1082_7);
\u_psram_top/u_psram_init/read_over_s5\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_psram_top_u_psram_init_read_over_10,
  I0 => \u_psram_top/u_psram_init/read_cnt\(5),
  I1 => \u_psram_top/u_psram_init/read_cnt\(6),
  I2 => \u_psram_top/u_psram_init/read_cnt\(7),
  I3 => \u_psram_top/u_psram_init/read_cnt\(8));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s4\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_9\,
  I0 => \u_psram_top/rd_data_d\(2),
  I1 => \u_psram_top/rd_data_d\(4),
  I2 => \u_psram_top/rd_data_d\(0),
  I3 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_12\);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s5\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_10\,
  I0 => \u_psram_top/rd_data_d\(4),
  I1 => \u_psram_top/rd_data_d\(0),
  I2 => \u_psram_top/rd_data_d\(2),
  I3 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_13\);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s6\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_11\,
  I0 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_14\,
  I1 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_15\,
  I2 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_16\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s4\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_9\,
  I0 => \u_psram_top/rd_data_d\(10),
  I1 => \u_psram_top/rd_data_d\(12),
  I2 => \u_psram_top/rd_data_d\(8),
  I3 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_12\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s5\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_10\,
  I0 => \u_psram_top/rd_data_d\(12),
  I1 => \u_psram_top/rd_data_d\(8),
  I2 => \u_psram_top/rd_data_d\(10),
  I3 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_13\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s6\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_11\,
  I0 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_14\,
  I1 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_15\,
  I2 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_16\);
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s17\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_21\,
  I0 => u_psram_top_u_psram_init_Tvcs_done,
  I1 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I2 => u_psram_top_u_psram_init_config_done_Z,
  I3 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\);
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s18\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_22\,
  I0 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_27\,
  I1 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_31\,
  I2 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_25\);
\u_psram_top/u_psram_init/n_state.INIT_CALIB_WAITE_s16\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.INIT_CALIB_WAITE_20\,
  I0 => \u_psram_top/u_psram_init/calib_done\(0),
  I1 => \u_psram_top/u_psram_init/calib_done\(1));
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_WAITE_s16\: LUT4
generic map (
  INIT => X"B000"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_20\,
  I0 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_22\,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I2 => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_21\,
  I3 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_23\);
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_s15\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_19\,
  I0 => \u_psram_top/u_psram_init/delay_wait_over\(0),
  I1 => \u_psram_top/u_psram_init/delay_wait_over\(1));
\u_psram_top/u_psram_sync/n348_s8\: LUT4
generic map (
  INIT => X"00D7"
)
port map (
  F => u_psram_top_u_psram_sync_n348_12,
  I0 => u_psram_top_u_psram_sync_n348_16,
  I1 => u_psram_top_u_psram_sync_uddcntln,
  I2 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I3 => u_psram_top_u_psram_sync_n348_19);
\u_psram_top/u_psram_sync/n348_s9\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_psram_top_u_psram_sync_n348_13,
  I0 => NN,
  I1 => \u_psram_top/u_psram_sync/flag\(0),
  I2 => u_psram_top_u_psram_sync_n326_17,
  I3 => \u_psram_top/u_psram_sync/flag\(1));
\u_psram_top/u_psram_sync/n359_s7\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => u_psram_top_u_psram_sync_n359_11,
  I0 => u_psram_top_u_psram_sync_n326_17,
  I1 => NN,
  I2 => \u_psram_top/u_psram_sync/flag\(0));
\u_psram_top/u_psram_sync/n359_s8\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_psram_top_u_psram_sync_n359_12,
  I0 => u_psram_top_u_psram_sync_uddcntln,
  I1 => u_psram_top_u_psram_sync_n348_16,
  I2 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I3 => u_psram_top_u_psram_sync_n348_19);
\u_psram_top/u_psram_sync/n359_s9\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_sync_n359_13,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I1 => u_psram_top_u_psram_sync_uddcntln,
  I2 => NN,
  I3 => u_psram_top_u_psram_sync_n348_16);
\u_psram_top/u_psram_sync/n282_s13\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_sync_n282_17,
  I0 => \u_psram_top/u_psram_sync/count\(2),
  I1 => \u_psram_top/u_psram_sync/count\(1),
  I2 => \u_psram_top/u_psram_sync/count\(0),
  I3 => \u_psram_top/u_psram_sync/flag\(0));
\u_psram_top/u_psram_sync/n282_s14\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_sync_n282_18,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => u_psram_top_u_psram_sync_stop,
  I2 => u_psram_top_u_psram_sync_n348_15);
\u_psram_top/u_psram_sync/n293_s13\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_sync_n293_17,
  I0 => \u_psram_top/u_psram_sync/count\(2),
  I1 => \u_psram_top/u_psram_sync/count\(1),
  I2 => \u_psram_top/u_psram_sync/count\(0),
  I3 => u_psram_top_u_psram_sync_n348_15);
\u_psram_top/u_psram_sync/n293_s14\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_sync_n293_18,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => \u_psram_top/u_psram_sync/cs_memsync\(5));
\u_psram_top/u_psram_sync/n304_s13\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_sync_n304_17,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(5),
  I1 => u_psram_top_u_psram_sync_stop);
\u_psram_top/u_psram_sync/n315_s13\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_sync_n315_17,
  I0 => \u_psram_top/u_psram_sync/count\(1),
  I1 => \u_psram_top/u_psram_sync/flag\(1),
  I2 => \u_psram_top/u_psram_sync/count\(0),
  I3 => u_psram_top_u_psram_sync_n348_14);
\u_psram_top/u_psram_sync/n315_s14\: LUT4
generic map (
  INIT => X"7F00"
)
port map (
  F => u_psram_top_u_psram_sync_n315_18,
  I0 => u_psram_top_u_psram_sync_uddcntln,
  I1 => u_psram_top_u_psram_sync_n348_16,
  I2 => u_psram_top_u_psram_sync_n282_17,
  I3 => \u_psram_top/u_psram_sync/cs_memsync\(2));
\u_psram_top/u_psram_sync/n326_s13\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_psram_top_u_psram_sync_n326_17,
  I0 => \u_psram_top/u_psram_sync/count\(2),
  I1 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I2 => u_psram_top_u_psram_sync_n387_7,
  I3 => u_psram_top_u_psram_sync_n348_16);
\u_psram_top/u_psram_sync/n337_s13\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n337_17,
  I0 => \u_psram_top/u_psram_sync/count\(2),
  I1 => \u_psram_top/u_psram_sync/flag\(0),
  I2 => u_psram_top_u_psram_sync_n387_7,
  I3 => u_psram_top_u_psram_sync_n348_23);
\u_psram_top/u_psram_init/n1854_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1854_7,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(2));
\u_psram_top/u_psram_init/n1383_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1383_7,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(2));
\u_psram_top/u_psram_init/n1167_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n1167,
  I0 => \u_psram_top/u_psram_init/timer_cnt1\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt1\(1));
\u_psram_top/u_psram_init/n1082_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1082_7,
  I0 => \u_psram_top/u_psram_init/read_cnt\(0),
  I1 => \u_psram_top/u_psram_init/read_cnt\(1),
  I2 => \u_psram_top/u_psram_init/read_cnt\(2));
\u_psram_top/u_psram_init/n1079_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n1079_7,
  I0 => \u_psram_top/u_psram_init/read_cnt\(3),
  I1 => \u_psram_top/u_psram_init/read_cnt\(4),
  I2 => \u_psram_top/u_psram_init/read_cnt\(5),
  I3 => u_psram_top_u_psram_init_n1082_7);
\u_psram_top/u_psram_init/n1077_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n1077_7,
  I0 => \u_psram_top/u_psram_init/read_cnt\(6),
  I1 => \u_psram_top/u_psram_init/read_cnt\(7));
\u_psram_top/u_psram_init/n901_s4\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_init_n901_8,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I2 => \u_psram_top/u_psram_init/timer_cnt0\(2),
  I3 => \u_psram_top/u_psram_init/timer_cnt0\(3));
\u_psram_top/u_psram_init/n192_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n192,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(0),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(2),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(3));
\u_psram_top/u_psram_init/n186_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n186,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(8),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(9),
  I3 => u_psram_top_u_psram_init_n189_10);
\u_psram_top/u_psram_init/n183_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n183,
  I0 => u_psram_top_u_psram_init_n192,
  I1 => u_psram_top_u_psram_init_n189,
  I2 => u_psram_top_u_psram_init_n183_8,
  I3 => u_psram_top_u_psram_init_n183_9);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1303_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1303_7\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1303_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1303_7\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_0_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_0\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_17_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_17\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d4\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_21_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_21\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_20_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_20\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d5\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_25_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_25\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_24_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_24\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d6\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_28_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_28\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_3_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_3\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d0\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_6_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_6\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d1\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_10_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_10\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d2\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_31_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_31\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/d7\(3));
\u_psram_top/u_psram_sync/n389_s4\: LUT4
generic map (
  INIT => X"000D"
)
port map (
  F => u_psram_top_u_psram_sync_n389_8,
  I0 => u_psram_top_u_psram_sync_n348_23,
  I1 => u_psram_top_u_psram_sync_lock_d2,
  I2 => u_psram_top_u_psram_sync_n315_17,
  I3 => u_psram_top_u_psram_sync_n389_11);
\u_psram_top/u_psram_sync/n387_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_sync_n387_7,
  I0 => \u_psram_top/u_psram_sync/count\(0),
  I1 => \u_psram_top/u_psram_sync/count\(1));
\u_psram_top/u_psram_sync/n51_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_sync_n51,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1));
\u_psram_top/u_psram_sync/n48_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_sync_n48,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(0),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(2));
\u_psram_top/u_psram_sync/n45_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n45,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(3),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(4),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(5),
  I3 => u_psram_top_u_psram_sync_n48);
\u_psram_top/u_psram_sync/n41_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n41,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(8),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(9),
  I2 => u_psram_top_u_psram_sync_n45,
  I3 => u_psram_top_u_psram_sync_n43);
\u_psram_top/u_psram_sync/n39_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_sync_n39_6,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(10),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(11));
\u_psram_top/u_psram_init/out_dq_Z_16_s0\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_psram_top_u_psram_init_out_dq_Z_16,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I2 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I3 => \u_psram_top/u_psram_init/timer_cnt\(5));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n298_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298_7\,
  I0 => NN_1,
  I1 => cmd,
  I2 => cmd_en);
\u_psram_top/u_psram_init/n256_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n256_6,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I2 => \u_psram_top/u_psram_init/timer_cnt\(2));
\u_psram_top/u_psram_init/n2437_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2437_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(6),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(7),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(8),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(9));
\u_psram_top/u_psram_init/n2437_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2437_6,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(3),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(4),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(5));
\u_psram_top/u_psram_init/n2469_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2469_5,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(6),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(7),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(8),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(9));
\u_psram_top/u_psram_init/n2469_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2469_6,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(3),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(4),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(5));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_12\,
  I0 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_17\,
  I1 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_18\,
  I2 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_19\,
  I3 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_20\);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s8\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_13\,
  I0 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_21\,
  I1 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_22\,
  I2 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_23\,
  I3 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_24\);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s9\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_14\,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I1 => \u_psram_top/rd_data_d\(32),
  I2 => \u_psram_top/rd_data_d\(1),
  I3 => \u_psram_top/rd_data_d\(3));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s10\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_15\,
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(50),
  I2 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_25\);
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s11\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_16\,
  I0 => \u_psram_top/rd_data_d\(5),
  I1 => \u_psram_top/rd_data_d\(6),
  I2 => \u_psram_top/rd_data_d\(7),
  I3 => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_26\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_12\,
  I0 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_17\,
  I1 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_18\,
  I2 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_19\,
  I3 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_20\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s8\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_13\,
  I0 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_21\,
  I1 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_22\,
  I2 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_23\,
  I3 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_24\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s9\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_14\,
  I0 => \u_psram_top/rd_data_d\(13),
  I1 => \u_psram_top/rd_data_d\(14),
  I2 => \u_psram_top/rd_data_d\(15),
  I3 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_25\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s10\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_15\,
  I0 => NN_1,
  I1 => \u_psram_top/rd_data_d\(58),
  I2 => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_26\);
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s11\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_16\,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(2),
  I1 => \u_psram_top/rd_data_d\(40),
  I2 => \u_psram_top/rd_data_d\(9),
  I3 => \u_psram_top/rd_data_d\(11));
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s21\: LUT4
generic map (
  INIT => X"05CF"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_25\,
  I0 => u_psram_top_u_psram_init_write_done,
  I1 => u_psram_top_u_psram_init_read_over_12,
  I2 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I3 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\);
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_WAITE_s18\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_22\,
  I0 => \u_psram_top/u_psram_init/adjust_over\(0),
  I1 => \u_psram_top/u_psram_init/adjust_over\(1));
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_WAITE_s19\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_23\,
  I0 => u_psram_top_u_psram_init_write_done,
  I1 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\,
  I2 => u_psram_top_u_psram_init_read_over_12,
  I3 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\);
\u_psram_top/u_psram_sync/n348_s10\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_sync_n348_14,
  I0 => \u_psram_top/u_psram_sync/flag\(0),
  I1 => \u_psram_top/u_psram_sync/count\(2));
\u_psram_top/u_psram_sync/n348_s11\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_sync_n348_15,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I1 => NN,
  I2 => u_psram_top_u_psram_sync_uddcntln);
\u_psram_top/u_psram_sync/n348_s12\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_psram_top_u_psram_sync_n348_16,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => \u_psram_top/u_psram_sync/cs_memsync\(5),
  I2 => u_psram_top_u_psram_sync_stop);
\u_psram_top/u_psram_init/n189_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n189,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(5),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(6));
\u_psram_top/u_psram_init/n183_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n183_8,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(8),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(11));
\u_psram_top/u_psram_init/n183_s5\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_init_n183_9,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(9),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(12));
\u_psram_top/u_psram_sync/n43_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_psram_top_u_psram_sync_n43,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(6),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(7));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s12\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_17\,
  I0 => \u_psram_top/rd_data_d\(54),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I2 => \u_psram_top/rd_data_d\(55),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s13\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_18\,
  I0 => \u_psram_top/rd_data_d\(20),
  I1 => \u_psram_top/rd_data_d\(23),
  I2 => \u_psram_top/rd_data_d\(22),
  I3 => \u_psram_top/rd_data_d\(34));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s14\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_19\,
  I0 => \u_psram_top/rd_data_d\(37),
  I1 => \u_psram_top/rd_data_d\(35),
  I2 => \u_psram_top/rd_data_d\(36),
  I3 => \u_psram_top/rd_data_d\(38));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s15\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_20\,
  I0 => \u_psram_top/rd_data_d\(52),
  I1 => \u_psram_top/rd_data_d\(48),
  I2 => \u_psram_top/rd_data_d\(51),
  I3 => \u_psram_top/rd_data_d\(53));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s16\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_21\,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(1),
  I1 => \u_psram_top/rd_data_d\(55),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(0),
  I3 => \u_psram_top/rd_data_d\(54));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s17\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_22\,
  I0 => \u_psram_top/rd_data_d\(34),
  I1 => \u_psram_top/rd_data_d\(23),
  I2 => \u_psram_top/rd_data_d\(22),
  I3 => \u_psram_top/rd_data_d\(20));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s18\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_23\,
  I0 => \u_psram_top/rd_data_d\(38),
  I1 => \u_psram_top/rd_data_d\(36),
  I2 => \u_psram_top/rd_data_d\(37),
  I3 => \u_psram_top/rd_data_d\(35));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s19\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_24\,
  I0 => \u_psram_top/rd_data_d\(53),
  I1 => \u_psram_top/rd_data_d\(51),
  I2 => \u_psram_top/rd_data_d\(52),
  I3 => \u_psram_top/rd_data_d\(48));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s20\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_25\,
  I0 => \u_psram_top/rd_data_d\(49),
  I1 => \u_psram_top/rd_data_d\(39),
  I2 => \u_psram_top/rd_data_d\(33),
  I3 => \u_psram_top/rd_data_d\(21));
\u_psram_top/u_psram_init/read_calibration[0].check_cnt_5_s21\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].check_cnt_5_26\,
  I0 => \u_psram_top/rd_data_d\(19),
  I1 => \u_psram_top/rd_data_d\(18),
  I2 => \u_psram_top/rd_data_d\(17),
  I3 => \u_psram_top/rd_data_d\(16));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s12\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_17\,
  I0 => \u_psram_top/rd_data_d\(62),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I2 => \u_psram_top/rd_data_d\(63),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s13\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_18\,
  I0 => \u_psram_top/rd_data_d\(45),
  I1 => \u_psram_top/rd_data_d\(43),
  I2 => \u_psram_top/rd_data_d\(44),
  I3 => \u_psram_top/rd_data_d\(46));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s14\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_19\,
  I0 => \u_psram_top/rd_data_d\(28),
  I1 => \u_psram_top/rd_data_d\(31),
  I2 => \u_psram_top/rd_data_d\(30),
  I3 => \u_psram_top/rd_data_d\(42));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s15\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_20\,
  I0 => \u_psram_top/rd_data_d\(60),
  I1 => \u_psram_top/rd_data_d\(56),
  I2 => \u_psram_top/rd_data_d\(59),
  I3 => \u_psram_top/rd_data_d\(61));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s16\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_21\,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(1),
  I1 => \u_psram_top/rd_data_d\(63),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].wr_ptr\(0),
  I3 => \u_psram_top/rd_data_d\(62));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s17\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_22\,
  I0 => \u_psram_top/rd_data_d\(46),
  I1 => \u_psram_top/rd_data_d\(44),
  I2 => \u_psram_top/rd_data_d\(45),
  I3 => \u_psram_top/rd_data_d\(43));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s18\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_23\,
  I0 => \u_psram_top/rd_data_d\(42),
  I1 => \u_psram_top/rd_data_d\(31),
  I2 => \u_psram_top/rd_data_d\(30),
  I3 => \u_psram_top/rd_data_d\(28));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s19\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_24\,
  I0 => \u_psram_top/rd_data_d\(61),
  I1 => \u_psram_top/rd_data_d\(59),
  I2 => \u_psram_top/rd_data_d\(60),
  I3 => \u_psram_top/rd_data_d\(56));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s20\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_25\,
  I0 => \u_psram_top/rd_data_d\(27),
  I1 => \u_psram_top/rd_data_d\(26),
  I2 => \u_psram_top/rd_data_d\(25),
  I3 => \u_psram_top/rd_data_d\(24));
\u_psram_top/u_psram_init/read_calibration[1].check_cnt_5_s21\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[1].check_cnt_5_26\,
  I0 => \u_psram_top/rd_data_d\(57),
  I1 => \u_psram_top/rd_data_d\(47),
  I2 => \u_psram_top/rd_data_d\(41),
  I3 => \u_psram_top/rd_data_d\(29));
\u_psram_top/u_psram_sync/ddr_rsti_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_sync_ddr_rsti,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => u_psram_top_u_psram_sync_dll_rsti);
\u_psram_top/u_psram_init/n1382_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n1382_9,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(1),
  I3 => \u_psram_top/u_psram_init/read_calibration[0].check_cnt\(2));
\u_psram_top/u_psram_init/n181_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_psram_top_u_psram_init_n181,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(14),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(13),
  I2 => u_psram_top_u_psram_init_n183,
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(15));
\u_psram_top/u_psram_init/n182_s4\: LUT3
generic map (
  INIT => X"6A"
)
port map (
  F => u_psram_top_u_psram_init_n182,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(14),
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(13),
  I2 => u_psram_top_u_psram_init_n183);
\u_psram_top/u_psram_init/n1853_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n1853_9,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(0),
  I2 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I3 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(2));
\u_psram_top/u_psram_init/n189_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n189_10,
  I0 => u_psram_top_u_psram_init_n192,
  I1 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(5),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(6));
\u_psram_top/u_psram_init/n245_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n245_11,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(3),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(0),
  I2 => \u_psram_top/u_psram_init/timer_cnt\(1),
  I3 => \u_psram_top/u_psram_init/timer_cnt\(2));
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s22\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_27\,
  I0 => \u_psram_top/u_psram_init/adjust_over\(0),
  I1 => \u_psram_top/u_psram_init/adjust_over\(1),
  I2 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\);
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s23\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_29\,
  I0 => \u_psram_top/u_psram_init/delay_wait_over\(0),
  I1 => \u_psram_top/u_psram_init/delay_wait_over\(1),
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\);
\u_psram_top/u_psram_init/out_dq_Z_62_s0\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => \u_psram_top/u_psram_init/out_dq_Z\(62),
  I0 => \u_psram_top/u_psram_init/timer_cnt\(3),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(2),
  I2 => u_psram_top_u_psram_init_out_dq_Z_15,
  I3 => \u_psram_top/u_psram_init/out_dq_Z\(16));
\u_psram_top/u_psram_sync/n348_s14\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n348_19,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(3),
  I1 => u_psram_top_u_psram_sync_n348_15,
  I2 => \u_psram_top/u_psram_sync/cs_memsync\(5),
  I3 => u_psram_top_u_psram_sync_stop);
\u_psram_top/u_psram_sync/n348_s15\: LUT4
generic map (
  INIT => X"0800"
)
port map (
  F => u_psram_top_u_psram_sync_n348_21,
  I0 => \u_psram_top/u_psram_sync/flag\(1),
  I1 => u_psram_top_u_psram_sync_n387_7,
  I2 => \u_psram_top/u_psram_sync/flag\(0),
  I3 => \u_psram_top/u_psram_sync/count\(2));
\u_psram_top/u_psram_sync/n38_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_sync_n38_8,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(12),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(10),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(11));
\u_psram_top/u_psram_sync/n43_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_sync_n43_9,
  I0 => u_psram_top_u_psram_sync_n45,
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(6),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(7));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_4_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(3),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(4));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_en_delay_reg_s4\: LUT4
generic map (
  INIT => X"FFFE"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg_10\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(15),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(15),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(6),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(6));
\u_psram_top/u_psram_init/read_calibration[0].wr_ptr_2_s5\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => \u_psram_top_u_psram_init_read_calibration[0].wr_ptr_2_11\,
  I0 => NN_1,
  I1 => u_psram_top_rd_data_valid_d,
  I2 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I3 => u_psram_top_u_psram_init_cmd_en_calib);
\u_psram_top/u_psram_init/read_cnt_8_s4\: LUT4
generic map (
  INIT => X"FFB0"
)
port map (
  F => u_psram_top_u_psram_init_read_cnt_8,
  I0 => NN_1,
  I1 => u_psram_top_rd_data_valid_d,
  I2 => u_psram_top_u_psram_init_rd_data_valid_d,
  I3 => u_psram_top_u_psram_init_timer_cnt1_clr);
\u_psram_top/u_psram_init/n1915_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1915_6,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I1 => \u_psram_top/u_psram_init/phase_cnt\(4),
  I2 => u_psram_top_u_psram_init_n1881);
\u_psram_top/u_psram_init/n1444_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1444_7,
  I0 => u_psram_top_u_psram_init_n1410,
  I1 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(4));
\u_psram_top/u_psram_init/n1150_s8\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_psram_top_u_psram_init_n1150_12,
  I0 => u_psram_top_u_psram_init_n1150,
  I1 => \u_psram_top/u_psram_init/phase_cnt\(3),
  I2 => \u_psram_top/u_psram_init/phase_cnt\(4));
\u_psram_top/u_psram_init/n1165_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n1165,
  I0 => \u_psram_top/u_psram_init/timer_cnt1\(2),
  I1 => \u_psram_top/u_psram_init/timer_cnt1\(3),
  I2 => \u_psram_top/u_psram_init/timer_cnt1\(0),
  I3 => \u_psram_top/u_psram_init/timer_cnt1\(1));
\u_psram_top/u_psram_init/n1167_s4\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => u_psram_top_u_psram_init_n1167_9,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/timer_cnt1\(2),
  I2 => \u_psram_top/u_psram_init/timer_cnt1\(0),
  I3 => \u_psram_top/u_psram_init/timer_cnt1\(1));
\u_psram_top/u_psram_init/n902_s4\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n902,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I2 => u_psram_top_u_psram_init_n901_8);
\u_psram_top/u_psram_init/n904_s4\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_psram_top_u_psram_init_n904,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(1),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I2 => u_psram_top_u_psram_init_n901_8);
\u_psram_top/u_psram_init/n_state.READ_CHECK_DATA_s24\: LUT4
generic map (
  INIT => X"1500"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.READ_CHECK_DATA_31\,
  I0 => u_psram_top_u_psram_init_phase_over,
  I1 => \u_psram_top/u_psram_init/calib_done\(0),
  I2 => \u_psram_top/u_psram_init/calib_done\(1),
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\);
\u_psram_top/u_psram_init/n_state.ADJUST_DELAY_WAITE_s20\: LUT4
generic map (
  INIT => X"7000"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_25\,
  I0 => \u_psram_top/u_psram_init/calib_done\(0),
  I1 => \u_psram_top/u_psram_init/calib_done\(1),
  I2 => u_psram_top_u_psram_init_phase_over,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE\);
\u_psram_top/u_psram_sync/n47_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n47,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(3),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(0),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(1),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(2));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/clk_d0_s1\: LUT4
generic map (
  INIT => X"EFFF"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_clk_d0\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/reg_wren\(0),
  I1 => \u_psram_top/u_psram_init/out_dq_Z\(62),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1538_6\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/mem_data_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_mem_data\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(3),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/mem_data_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_mem_data\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(3),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(4));
\u_psram_top/u_psram_init/SDTAP_1_s4\: LUT4
generic map (
  INIT => X"FFF4"
)
port map (
  F => u_psram_top_u_psram_init_SDTAP_1,
  I0 => \u_psram_top/u_psram_init/adjust_over\(1),
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\);
\u_psram_top/u_psram_init/SDTAP_0_s4\: LUT4
generic map (
  INIT => X"FFF4"
)
port map (
  F => u_psram_top_u_psram_init_SDTAP_0,
  I0 => \u_psram_top/u_psram_init/adjust_over\(0),
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_PHASE_WAITE\);
\u_psram_top/u_psram_sync/n348_s16\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_psram_top_u_psram_sync_n348_23,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I1 => NN,
  I2 => u_psram_top_u_psram_sync_uddcntln,
  I3 => u_psram_top_u_psram_sync_n348_16);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/cs_d1_reg_s5\: LUT4
generic map (
  INIT => X"FFFE"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d1_reg_12\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(13),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(13));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/cs_d0_reg_s4\: LUT4
generic map (
  INIT => X"FFFE"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_cs_d0_reg_10\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(12),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(12),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(0),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n137_s3\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n137\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(3));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n138_s3\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n138\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n137_s3\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n137\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(3));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n138_s3\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n138\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1));
\u_psram_top/u_psram_init/wr_data_63_s6\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_psram_top_u_psram_init_wr_data_63_9,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(1),
  I2 => u_psram_top_u_psram_init_n901_8);
\u_psram_top/u_psram_init/n583_s6\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n583_10,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(2),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(3),
  I2 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I3 => \u_psram_top/u_psram_init/timer_cnt0\(1));
\u_psram_top/u_psram_init/n595_s2\: LUT4
generic map (
  INIT => X"BFEA"
)
port map (
  F => u_psram_top_u_psram_init_n595,
  I0 => u_psram_top_u_psram_init_n583,
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(0),
  I2 => \u_psram_top/u_psram_init/timer_cnt0\(1),
  I3 => \u_psram_top/u_psram_init/timer_cnt0\(2));
\u_psram_top/u_psram_sync/n389_s6\: LUT4
generic map (
  INIT => X"E000"
)
port map (
  F => u_psram_top_u_psram_sync_n389_11,
  I0 => \u_psram_top/u_psram_sync/cs_memsync\(2),
  I1 => \u_psram_top/u_psram_sync/cs_memsync\(5),
  I2 => \u_psram_top/u_psram_sync/count\(0),
  I3 => \u_psram_top/u_psram_sync/count\(1));
\u_psram_top/u_psram_init/n259_s3\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => u_psram_top_u_psram_init_n259,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I2 => u_psram_top_u_psram_init_n245_11,
  I3 => \u_psram_top/u_psram_init/timer_cnt\(0));
\u_psram_top/u_psram_init/n597_s3\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => u_psram_top_u_psram_init_n597,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I2 => u_psram_top_u_psram_init_n583_10,
  I3 => \u_psram_top/u_psram_init/timer_cnt0\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_en_s1\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en\,
  I0 => NN_1,
  I1 => u_psram_top_u_psram_init_cmd_en_calib,
  I2 => u_psram_top_u_psram_init_cmd_calib,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298_7\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_dq_29_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_dq_29_8\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_en_delay_reg\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/data_mask_d_3_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_3\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/data_mask_d_2_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_2\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/data_mask_d_1_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_1\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/data_mask_d_0_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_data_mask_d_0\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/data_mask_d_3_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_3\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/data_mask_d_2_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_2\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/data_mask_d_1_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1_13\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_1\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/data_mask_d_0_s8\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0_14\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_data_mask_d_0\,
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_data_d_0\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n218\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n763_s2\: LUT4
generic map (
  INIT => X"000E"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n763_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_w\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/shift_burst128_r\(2),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I3 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n764_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n764\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n765_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n765\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q8\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n768_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n768\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n769_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n769\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q9\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n772_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n772\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n773_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n773\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q10\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n776_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n776\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n777_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n777\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q11\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n780_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n780\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n781_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n781\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q12\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n784_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n784\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n785_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n785\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q13\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n788_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n788\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n789_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n789\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q14\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n792_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n792\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(1));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n793_s2\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n793\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(0));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n791_s1\: LUT4
generic map (
  INIT => X"FFE0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n791\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q3\(2),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n786\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n790_s2\: LUT4
generic map (
  INIT => X"FFE0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n790_6\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_r\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/shift_burst128_w\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/q15\(3),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n786\);
\u_psram_top/u_psram_init/n1532_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1532,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(31),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1533_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1533,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(30),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1534_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1534,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(29),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1535_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1535,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(28),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1536_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1536,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(27),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1537_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1537,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(26),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1538_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1538,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(25),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1539_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1539,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(24),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1540_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1540,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(23),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1541_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1541,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(22),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1542_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1542,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(21),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1543_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1543,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(20),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1544_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1544,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(19),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1545_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1545,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(18),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1546_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1546,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(17),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1547_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1547,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(16),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1548_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1548,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(15),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1549_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1549,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(14),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1550_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1550,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(13),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1551_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1551,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(12),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1552_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1552,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(11),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1553_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1553,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(10),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1554_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1554,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(9),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1555_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1555,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(8),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1556_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1556,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(7),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1557_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1557,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(6),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1558_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1558,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(5),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1559_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1559,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(4),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1560_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1560,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1561_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1561,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1562_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n1562,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].id_reg\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n1643_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n1643,
  I0 => \u_psram_top/u_psram_init/adjust_over\(0),
  I1 => \u_psram_top/u_psram_init/read_calibration[0].wr_ptr\(2),
  I2 => u_psram_top_u_psram_init_n1410_4,
  I3 => u_psram_top_u_psram_init_n1410_5);
\u_psram_top/u_psram_init/n2003_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2003,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(31),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2004_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2004,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(30),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2005_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2005,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(29),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2006_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2006,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(28),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2007_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2007,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(27),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2008_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2008,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(26),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2009_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2009,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(25),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2010_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2010,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(24),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2011_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2011,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(23),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2012_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2012,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(22),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2013_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2013,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(21),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2014_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2014,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(20),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2015_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2015,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(19),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2016_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2016,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(18),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2017_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2017,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(17),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2018_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2018,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(16),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2019_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2019,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(15),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2020_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2020,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(14),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2021_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2021,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(13),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2022_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2022,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(12),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2023_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2023,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(11),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2024_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2024,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(10),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2025_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2025,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(9),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2026_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2026,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(8),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2027_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2027,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(7),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2028_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2028,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(6),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2029_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2029,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(5),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2030_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2030,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(4),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2031_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2031,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(3),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2032_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2032,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(2),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2033_s2\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n2033,
  I0 => \u_psram_top/u_psram_init/read_calibration[1].id_reg\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/u_psram_init/n2114_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_init_n2114,
  I0 => \u_psram_top/u_psram_init/adjust_over\(1),
  I1 => \u_psram_top/u_psram_init/read_calibration[1].check_cnt\(1),
  I2 => u_psram_top_u_psram_init_n1881_4,
  I3 => u_psram_top_u_psram_init_n1881_5);
\u_psram_top/n298_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n298,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n297_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n297,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n296_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n296,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(2),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n295_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n295,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(3),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n294_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n294,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(4),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n293_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n293,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(5),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n292_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n292,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(6),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n291_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n291,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(7),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n290_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n290,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(32),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n289_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n289,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(33),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n288_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n288,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(34),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n287_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n287,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(35),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n286_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n286,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(36),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n285_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n285,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(37),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n284_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n284,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(38),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n283_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n283,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(39),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n282_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n282,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(8),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n281_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n281,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(9),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n280_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n280,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(10),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n279_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n279,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(11),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n278_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n278,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(12),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n277_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n277,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(13),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n276_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n276,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(14),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n275_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n275,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(15),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n274_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n274,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(40),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n273_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n273,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(41),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n272_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n272,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(42),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n271_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n271,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(43),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n270_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n270,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(44),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n269_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n269,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(45),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n268_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n268,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(46),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n267_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n267,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(47),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n266_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n266,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(16),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n265_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n265,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(17),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n264_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n264,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(18),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n263_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n263,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(19),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n262_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n262,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(20),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n261_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n261,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(21),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n260_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n260,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(22),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n259_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n259,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(23),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n258_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n258,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(48),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n257_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n257,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(49),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n256_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n256,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(50),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n255_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n255,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(51),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n254_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n254,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(52),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n253_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n253,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(53),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n252_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n252,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(54),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n251_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n251,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(55),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n250_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n250,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(24),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n249_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n249,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(25),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n248_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n248,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(26),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n247_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n247,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(27),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n246_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n246,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(28),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n245_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n245,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(29),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n244_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n244,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(30),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n243_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n243,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rdbk_data_d0\(31),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n242_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n242,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(56),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n241_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n241,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(57),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n240_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n240,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(58),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n239_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n239,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(59),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n238_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n238,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(60),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n237_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n237,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(61),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n236_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n236,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(62),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/n235_s2\: LUT3
generic map (
  INIT => X"A8"
)
port map (
  F => u_psram_top_n235,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rdbk_data_d0\(63),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_data_valid_d1\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/rd_data_valid_d1\(1));
\u_psram_top/u_psram_wd/step_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/step\(0),
  D => u_psram_top_u_psram_wd_n382,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/phase_cnt_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/phase_cnt\(0),
  D => u_psram_top_u_psram_init_n1131,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].add_cnt0_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(0),
  D => u_psram_top_u_psram_init_n1275,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[0].times_reg_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(0),
  D => u_psram_top_u_psram_init_n1493,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].add_cnt0_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(0),
  D => u_psram_top_u_psram_init_n1746,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_calibration[1].times_reg_0_s1\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(0),
  D => u_psram_top_u_psram_init_n1964,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_1_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n139\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_0_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n140\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr_1_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n172\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr_0_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n173\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_1_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1306\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_0_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1307\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_1_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n139\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_0_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n140\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_0_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  D => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1307\,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_13_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(13),
  D => u_psram_top_u_psram_init_n183_12,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_10_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  D => u_psram_top_u_psram_init_n186_10,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_7_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  D => u_psram_top_u_psram_init_n189_13,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_4_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  D => u_psram_top_u_psram_init_n192_10,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_1_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  D => u_psram_top_u_psram_init_n195,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/tvcs_cnt_0_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/tvcs_cnt\(0),
  D => u_psram_top_u_psram_init_n196,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_5_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(5),
  D => u_psram_top_u_psram_init_n254,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt_4_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt\(4),
  D => u_psram_top_u_psram_init_n255,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_5_s5\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(5),
  D => u_psram_top_u_psram_init_n592,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt0_4_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt0\(4),
  D => u_psram_top_u_psram_init_n593,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/read_over_s6\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => u_psram_top_u_psram_init_read_over_12,
  D => u_psram_top_u_psram_init_n1113,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_4_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(4),
  D => u_psram_top_u_psram_init_n1165_12,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_1_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(1),
  D => u_psram_top_u_psram_init_n1168,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_init/timer_cnt1_0_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_init/timer_cnt1\(0),
  D => u_psram_top_u_psram_init_n1169,
  CLK => NN_0,
  CLEAR => u_psram_top_u_psram_sync_ddr_rsti);
\u_psram_top/u_psram_sync/lock_cnt_10_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(10),
  D => u_psram_top_u_psram_sync_n41_11,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_8_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(8),
  D => u_psram_top_u_psram_sync_n43_14,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_6_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(6),
  D => u_psram_top_u_psram_sync_n45_11,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_4_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(4),
  D => u_psram_top_u_psram_sync_n47_13,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_3_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(3),
  D => u_psram_top_u_psram_sync_n48_11,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_1_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(1),
  D => u_psram_top_u_psram_sync_n50,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_sync/lock_cnt_0_s3\: DFFC
generic map (
  INIT => '0'
)
port map (
  Q => \u_psram_top/u_psram_sync/lock_cnt\(0),
  D => u_psram_top_u_psram_sync_n51_11,
  CLK => clk,
  CLEAR => u_psram_top_n797);
\u_psram_top/u_psram_wd/n382_s3\: LUT3
generic map (
  INIT => X"9A"
)
port map (
  F => u_psram_top_u_psram_wd_n382,
  I0 => \u_psram_top/u_psram_wd/step\(0),
  I1 => u_psram_top_u_psram_wd_n372_38,
  I2 => u_psram_top_u_psram_wd_dll_lock_d);
\u_psram_top/u_psram_wd/n444_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_wd_n444,
  I0 => u_psram_top_u_psram_wd_n372_38,
  I1 => u_psram_top_u_psram_wd_dll_lock_d);
\u_psram_top/u_psram_init/n1131_s3\: LUT3
generic map (
  INIT => X"56"
)
port map (
  F => u_psram_top_u_psram_init_n1131,
  I0 => \u_psram_top/u_psram_init/phase_cnt\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_Z\(0),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_Z\(1));
\u_psram_top/u_psram_init/n1125_s2\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_init_n1125,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/readd_Z\(0),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/readd_Z\(1));
\u_psram_top/u_psram_init/n1275_s3\: LUT3
generic map (
  INIT => X"9A"
)
port map (
  F => u_psram_top_u_psram_init_n1275,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].add_cnt0\(0),
  I1 => u_psram_top_u_psram_init_n1265,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\);
\u_psram_top/u_psram_init/n2431_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_psram_top_u_psram_init_n2431,
  I0 => u_psram_top_u_psram_init_n1265,
  I1 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\);
\u_psram_top/u_psram_init/n1493_s3\: LUT4
generic map (
  INIT => X"A9AA"
)
port map (
  F => u_psram_top_u_psram_init_n1493,
  I0 => \u_psram_top/u_psram_init/read_calibration[0].times_reg\(0),
  I1 => u_psram_top_u_psram_init_n2437,
  I2 => u_psram_top_u_psram_init_n1410,
  I3 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\);
\u_psram_top/u_psram_init/n2437_s4\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_psram_top_u_psram_init_n2437_8,
  I0 => u_psram_top_u_psram_init_n2437,
  I1 => u_psram_top_u_psram_init_n1410,
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\);
\u_psram_top/u_psram_init/n1746_s3\: LUT3
generic map (
  INIT => X"C6"
)
port map (
  F => u_psram_top_u_psram_init_n1746,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].add_cnt0\(0),
  I2 => u_psram_top_u_psram_init_n1736);
\u_psram_top/u_psram_init/n2445_s1\: LUT2
generic map (
  INIT => X"2"
)
port map (
  F => u_psram_top_u_psram_init_n2445,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY\,
  I1 => u_psram_top_u_psram_init_n1736);
\u_psram_top/u_psram_init/n1964_s3\: LUT4
generic map (
  INIT => X"CCC6"
)
port map (
  F => u_psram_top_u_psram_init_n1964,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I1 => \u_psram_top/u_psram_init/read_calibration[1].times_reg\(0),
  I2 => u_psram_top_u_psram_init_n1881,
  I3 => u_psram_top_u_psram_init_n2469);
\u_psram_top/u_psram_init/n2469_s4\: LUT3
generic map (
  INIT => X"02"
)
port map (
  F => u_psram_top_u_psram_init_n2469_8,
  I0 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I1 => u_psram_top_u_psram_init_n1881,
  I2 => u_psram_top_u_psram_init_n2469);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n139_s4\: LUT4
generic map (
  INIT => X"2A66"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n139\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr_4_s8\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_16\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n140_s5\: LUT4
generic map (
  INIT => X"4C33"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n140\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/wr_ptr\(0),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_10\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n172_s4\: LUT4
generic map (
  INIT => X"60A0"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n172\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(0),
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\,
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n173_s4\: LUT3
generic map (
  INIT => X"48"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n173\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/rd_ptr\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n298\,
  I2 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_rd_data_ctrl_reg\);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1306_s4\: LUT3
generic map (
  INIT => X"6A"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1306\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(1),
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I2 => \u_psram_top/u_psram_init/calib_Z\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss_4_s6\: LUT3
generic map (
  INIT => X"F4"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4_14\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4\,
  I2 => \u_psram_top/u_psram_init/calib_Z\(0));
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n1307_s4\: LUT3
generic map (
  INIT => X"1A"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n1307\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/ss\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_ss_4\,
  I2 => \u_psram_top/u_psram_init/calib_Z\(0));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n139_s4\: LUT4
generic map (
  INIT => X"1C9C"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n139\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr_4_s7\: LUT4
generic map (
  INIT => X"D555"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4_15\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n140_s5\: LUT4
generic map (
  INIT => X"25A5"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n140\,
  I0 => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_wr_ptr_4_11\,
  I1 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(1),
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/wr_ptr\(0),
  I3 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_ptr_4\);
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/n1307_s4\: LUT4
generic map (
  INIT => X"15AA"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_n1307\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4\,
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(4),
  I3 => \u_psram_top/u_psram_init/calib_Z\(1));
\u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss_4_s5\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4_11\,
  I0 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(0),
  I1 => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_ss_4\,
  I2 => \u_psram_top/u_psram_wd/data_lane_gen[1].u_psram_lane/ss\(4),
  I3 => \u_psram_top/u_psram_init/calib_Z\(1));
\u_psram_top/u_psram_init/n183_s7\: LUT4
generic map (
  INIT => X"666A"
)
port map (
  F => u_psram_top_u_psram_init_n183_12,
  I0 => \u_psram_top/u_psram_init/tvcs_cnt\(13),
  I1 => u_psram_top_u_psram_init_n183,
  I2 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I3 => u_psram_top_u_psram_init_n162);
\u_psram_top/u_psram_init/tvcs_cnt_15_s4\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_init_tvcs_cnt_15,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162);
\u_psram_top/u_psram_init/n186_s5\: LUT4
generic map (
  INIT => X"1EF0"
)
port map (
  F => u_psram_top_u_psram_init_n186_10,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(10),
  I3 => u_psram_top_u_psram_init_n186);
\u_psram_top/u_psram_init/n189_s7\: LUT4
generic map (
  INIT => X"1EF0"
)
port map (
  F => u_psram_top_u_psram_init_n189_13,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(7),
  I3 => u_psram_top_u_psram_init_n189_10);
\u_psram_top/u_psram_init/n192_s5\: LUT4
generic map (
  INIT => X"1EF0"
)
port map (
  F => u_psram_top_u_psram_init_n192_10,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(4),
  I3 => u_psram_top_u_psram_init_n192);
\u_psram_top/u_psram_init/n195_s4\: LUT4
generic map (
  INIT => X"1EF0"
)
port map (
  F => u_psram_top_u_psram_init_n195,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(1),
  I3 => \u_psram_top/u_psram_init/tvcs_cnt\(0));
\u_psram_top/u_psram_init/n196_s4\: LUT3
generic map (
  INIT => X"12"
)
port map (
  F => u_psram_top_u_psram_init_n196,
  I0 => \u_psram_top_u_psram_init_c_state.TVCS_WAITE\,
  I1 => u_psram_top_u_psram_init_n162,
  I2 => \u_psram_top/u_psram_init/tvcs_cnt\(0));
\u_psram_top/u_psram_init/n254_s3\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n254,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I2 => u_psram_top_u_psram_init_n245_11,
  I3 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\);
\u_psram_top/u_psram_init/timer_cnt_5_s6\: LUT4
generic map (
  INIT => X"FF80"
)
port map (
  F => u_psram_top_u_psram_init_timer_cnt_5,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I2 => u_psram_top_u_psram_init_n245_11,
  I3 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\);
\u_psram_top/u_psram_init/n255_s3\: LUT4
generic map (
  INIT => X"BCCC"
)
port map (
  F => u_psram_top_u_psram_init_n255,
  I0 => \u_psram_top/u_psram_init/timer_cnt\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt\(4),
  I2 => u_psram_top_u_psram_init_n245_11,
  I3 => \u_psram_top_u_psram_init_c_state.CONFIG_CR\);
\u_psram_top/u_psram_init/n592_s3\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_psram_top_u_psram_init_n592,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I2 => u_psram_top_u_psram_init_n583_10,
  I3 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\);
\u_psram_top/u_psram_init/timer_cnt0_5_s6\: LUT4
generic map (
  INIT => X"FF80"
)
port map (
  F => u_psram_top_u_psram_init_timer_cnt0_5,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I2 => u_psram_top_u_psram_init_n583_10,
  I3 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\);
\u_psram_top/u_psram_init/n593_s3\: LUT4
generic map (
  INIT => X"BCCC"
)
port map (
  F => u_psram_top_u_psram_init_n593,
  I0 => \u_psram_top/u_psram_init/timer_cnt0\(5),
  I1 => \u_psram_top/u_psram_init/timer_cnt0\(4),
  I2 => u_psram_top_u_psram_init_n583_10,
  I3 => \u_psram_top_u_psram_init_c_state.WRITE_DATA\);
\u_psram_top/u_psram_init/n1113_s4\: LUT4
generic map (
  INIT => X"3222"
)
port map (
  F => u_psram_top_u_psram_init_n1113,
  I0 => u_psram_top_u_psram_init_read_over_12,
  I1 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I2 => u_psram_top_u_psram_init_read_over,
  I3 => u_psram_top_u_psram_init_read_over_10);
\u_psram_top/u_psram_init/n1165_s6\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => u_psram_top_u_psram_init_n1165_12,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top/u_psram_init/timer_cnt1\(4),
  I2 => u_psram_top_u_psram_init_n1165,
  I3 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\);
\u_psram_top/u_psram_init/timer_cnt1_5_s4\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_psram_top_u_psram_init_timer_cnt1_5,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\);
\u_psram_top/u_psram_init/n1168_s4\: LUT4
generic map (
  INIT => X"1450"
)
port map (
  F => u_psram_top_u_psram_init_n1168,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I2 => \u_psram_top/u_psram_init/timer_cnt1\(1),
  I3 => \u_psram_top/u_psram_init/timer_cnt1\(0));
\u_psram_top/u_psram_init/n1169_s5\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_psram_top_u_psram_init_n1169,
  I0 => u_psram_top_u_psram_init_timer_cnt1_clr,
  I1 => \u_psram_top_u_psram_init_c_state.READ_CHECK_DATA\,
  I2 => \u_psram_top/u_psram_init/timer_cnt1\(0));
\u_psram_top/u_psram_sync/n41_s5\: LUT4
generic map (
  INIT => X"A600"
)
port map (
  F => u_psram_top_u_psram_sync_n41_11,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(10),
  I1 => u_psram_top_u_psram_sync_n41,
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I3 => \u_psram_top/u_psram_sync/lock_syn\(1));
\u_psram_top/u_psram_sync/lock_cnt_15_s4\: LUT2
generic map (
  INIT => X"7"
)
port map (
  F => u_psram_top_u_psram_sync_lock_cnt_15,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1));
\u_psram_top/u_psram_sync/n43_s7\: LUT4
generic map (
  INIT => X"84C0"
)
port map (
  F => u_psram_top_u_psram_sync_n43_14,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(8),
  I3 => u_psram_top_u_psram_sync_n43_9);
\u_psram_top/u_psram_sync/n45_s5\: LUT4
generic map (
  INIT => X"84C0"
)
port map (
  F => u_psram_top_u_psram_sync_n45_11,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(6),
  I3 => u_psram_top_u_psram_sync_n45);
\u_psram_top/u_psram_sync/n47_s6\: LUT4
generic map (
  INIT => X"84C0"
)
port map (
  F => u_psram_top_u_psram_sync_n47_13,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(4),
  I3 => u_psram_top_u_psram_sync_n47);
\u_psram_top/u_psram_sync/n48_s5\: LUT4
generic map (
  INIT => X"84C0"
)
port map (
  F => u_psram_top_u_psram_sync_n48_11,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(3),
  I3 => u_psram_top_u_psram_sync_n48);
\u_psram_top/u_psram_sync/n50_s4\: LUT4
generic map (
  INIT => X"84C0"
)
port map (
  F => u_psram_top_u_psram_sync_n50,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(1),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(0));
\u_psram_top/u_psram_sync/n51_s5\: LUT3
generic map (
  INIT => X"84"
)
port map (
  F => u_psram_top_u_psram_sync_n51_11,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(15),
  I1 => \u_psram_top/u_psram_sync/lock_syn\(1),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(0));
\u_psram_top/u_psram_sync/n37_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_psram_top_u_psram_sync_n37_8,
  I0 => \u_psram_top/u_psram_sync/lock_cnt\(13),
  I1 => \u_psram_top/u_psram_sync/lock_cnt\(12),
  I2 => \u_psram_top/u_psram_sync/lock_cnt\(10),
  I3 => \u_psram_top/u_psram_sync/lock_cnt\(11));
\u_psram_top/u_psram_init/n_state.IDLE_s16\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => \u_psram_top_u_psram_init_n_state.IDLE_21\,
  I0 => \u_psram_top/u_psram_init/delay_wait_over\(0),
  I1 => \u_psram_top/u_psram_init/delay_wait_over\(1),
  I2 => \u_psram_top_u_psram_init_c_state.ADJUST_DELAY_WAITE\,
  I3 => \u_psram_top_u_psram_init_n_state.ADJUST_DELAY_WAITE_20\);
\u_psram_top/n797_s2\: INV
port map (
  O => u_psram_top_n797,
  I => rst_n);
\u_psram_top/n804_s2\: INV
port map (
  O => u_psram_top_n804,
  I => pll_lock);
\u_psram_top/u_psram_wd/data_lane_gen[0].u_psram_lane/n864_s2\: INV
port map (
  O => \u_psram_top_u_psram_wd_data_lane_gen[0].u_psram_lane_n864\,
  I => \u_psram_top_u_psram_wd_data_lane_gen[1].u_psram_lane_wr_datats\);
\u_psram_top/u_psram_init/calib_0_s3\: INV
port map (
  O => u_psram_top_u_psram_init_calib_0,
  I => \u_psram_top/u_psram_init/calib_done\(0));
\u_psram_top/u_psram_init/calib_1_s3\: INV
port map (
  O => u_psram_top_u_psram_init_calib_1,
  I => \u_psram_top/u_psram_init/calib_done\(1));
GND_s5: GND
port map (
  G => GND_0);
VCC_s4: VCC
port map (
  V => VCC_0);
GSR_0: GSR
port map (
  GSRI => VCC_0);
  O_psram_reset_n(0) <= NN;
  O_psram_reset_n(1) <= NN;
  clk_out <= NN_0;
  init_calib <= NN_1;
end beh;
