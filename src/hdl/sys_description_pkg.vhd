/* -- @file sys_description_pkg.vhd
   -- @brief System description package for the spiking neural network TTL project
   -- @author Justin Davis
   --
    Copyright (C) 2024  Justin Davis

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------*/
library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;

library work;       use work.tools_pkg.all;

package sys_description_pkg is

    -- Clock periods
    constant INPUT_CLOCK_PERIOD           : time    :=   37.037 ns; -- 27 MHz
    constant SYS_CLOCK_PERIOD             : time    :=   INPUT_CLOCK_PERIOD*2;
    constant HEARTBEAT_PERIOD             : time    :=  1000 ms; -- 1 Hz
    constant HEARTBEAT_CNTS               : integer := HEARTBEAT_PERIOD / SYS_CLOCK_PERIOD;
--    constant HEARTBEAT_CNTS               : integer := 12000000;
    constant HEARTBEAT_CNT_SIZE           : natural := log2(HEARTBEAT_CNTS,UP);

    constant UART_RATE                    : integer := 115200;

    constant MEM_MAP_GBL : memMapRecArrayType := (
        memRec("VSYNC"               , x"00",             WO),
        memRec("VBLANK"              , x"01",             WO),
        memRec("WSYNC"               , x"02",             WO),
        memRec("RSYNC"               , x"03",             WO),
        memRec("NUSIZ0"              , x"04",             WO),
        memRec("NUSIZ1"              , x"05",             WO),
        memRec("COLUP0"              , x"06",             WO),
        memRec("COLUP1"              , x"07",             WO),
        memRec("COLUPF"              , x"08",             WO),
        memRec("COLUBK"              , x"09",             WO),
        memRec("CTRLPF"              , x"0A",             WO),
        memRec("REFP0"               , x"0B",             WO),
        memRec("REFP1"               , x"0C",             WO),
        memRec("PF0"                 , x"0D",             WO),
        memRec("PF1"                 , x"0E",             WO),
        memRec("PF2"                 , x"0F",             WO),
        memRec("RESP0"               , x"10",             WO),
        memRec("RESP1"               , x"11",             WO),
        memRec("RESM0"               , x"12",             WO),
        memRec("RESM1"               , x"13",             WO),
        memRec("RESBL"               , x"14",             WO),
        memRec("AUDC0"               , x"15",             WO),
        memRec("AUDC1"               , x"16",             WO),
        memRec("AUDF0"               , x"17",             WO),
        memRec("AUDF1"               , x"18",             WO),
        memRec("AUDV0"               , x"19",             WO),
        memRec("AUDV1"               , x"1A",             WO),
        memRec("GRP0"                , x"1B",             WO),
        memRec("GRP1"                , x"1C",             WO),
        memRec("ENAM0"               , x"1D",             WO),
        memRec("ENAM1"               , x"1E",             WO),
        memRec("ENABL"               , x"1F",             WO),
        memRec("HMP0"                , x"20",             WO),
        memRec("HMP1"                , x"21",             WO),
        memRec("HMM0"                , x"22",             WO),
        memRec("HMM1"                , x"23",             WO),
        memRec("HMBL"                , x"24",             WO),
        memRec("VDELP0"              , x"25",             WO),
        memRec("VDELP1"              , x"26",             WO),
        memRec("VDELBL"              , x"27",             WO),
        memRec("RESMP0"              , x"28",             WO),
        memRec("RESMP1"              , x"29",             WO),
        memRec("HMOVE"               , x"2A",             WO),
        memRec("HMCLR"               , x"2B",             WO),
        memRec("CXCLR"               , x"2C",             WO),

        memRec("CXM0P"               , x"00",             RO),
        memRec("CXM1P"               , x"01",             RO),
        memRec("CXP0FB"              , x"02",             RO),
        memRec("CXP1FB"              , x"03",             RO),
        memRec("CXM0FB"              , x"04",             RO),
        memRec("CXM1FB"              , x"05",             RO),
        memRec("CXBLPF"              , x"06",             RO),
        memRec("CXPPMM"              , x"07",             RO),
        memRec("INPT0"               , x"08",             RO),
        memRec("INPT1"               , x"09",             RO),
        memRec("INPT2"               , x"0A",             RO),
        memRec("INPT3"               , x"0B",             RO),
        memRec("INPT4"               , x"0C",             RO),
        memRec("INPT5"               , x"0D",             RO));


end sys_description_pkg;

package body sys_description_pkg is


end sys_description_pkg;