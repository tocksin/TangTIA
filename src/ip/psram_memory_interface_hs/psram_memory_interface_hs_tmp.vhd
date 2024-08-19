--Copyright (C)2014-2024 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.10 (64-bit)
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Sun Aug 18 14:57:47 2024

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component PSRAM_Memory_Interface_HS_Top
	port (
		clk: in std_logic;
		memory_clk: in std_logic;
		pll_lock: in std_logic;
		rst_n: in std_logic;
		O_psram_ck: out std_logic_vector(1 downto 0);
		O_psram_ck_n: out std_logic_vector(1 downto 0);
		IO_psram_dq: inout std_logic_vector(15 downto 0);
		IO_psram_rwds: inout std_logic_vector(1 downto 0);
		O_psram_cs_n: out std_logic_vector(1 downto 0);
		O_psram_reset_n: out std_logic_vector(1 downto 0);
		wr_data: in std_logic_vector(63 downto 0);
		rd_data: out std_logic_vector(63 downto 0);
		rd_data_valid: out std_logic;
		addr: in std_logic_vector(20 downto 0);
		cmd: in std_logic;
		cmd_en: in std_logic;
		init_calib: out std_logic;
		clk_out: out std_logic;
		data_mask: in std_logic_vector(7 downto 0)
	);
end component;

your_instance_name: PSRAM_Memory_Interface_HS_Top
	port map (
		clk => clk,
		memory_clk => memory_clk,
		pll_lock => pll_lock,
		rst_n => rst_n,
		O_psram_ck => O_psram_ck,
		O_psram_ck_n => O_psram_ck_n,
		IO_psram_dq => IO_psram_dq,
		IO_psram_rwds => IO_psram_rwds,
		O_psram_cs_n => O_psram_cs_n,
		O_psram_reset_n => O_psram_reset_n,
		wr_data => wr_data,
		rd_data => rd_data,
		rd_data_valid => rd_data_valid,
		addr => addr,
		cmd => cmd,
		cmd_en => cmd_en,
		init_calib => init_calib,
		clk_out => clk_out,
		data_mask => data_mask
	);

----------Copy end-------------------
