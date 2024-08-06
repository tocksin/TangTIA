--Copyright (C)2014-2024 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.10 (64-bit)
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Mon Aug  5 18:49:31 2024

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_rPLL2
    port (
        clkout: out std_logic;
        clkin: in std_logic
    );
end component;

your_instance_name: Gowin_rPLL2
    port map (
        clkout => clkout,
        clkin => clkin
    );

----------Copy end-------------------
