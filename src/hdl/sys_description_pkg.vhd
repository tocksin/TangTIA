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
    constant PIXEL_CLOCK_PERIOD           : time    :=   39.721 ns; -- 25.175 MHz
    constant SYS_CLOCK_PERIOD             : time    :=   PIXEL_CLOCK_PERIOD;
    constant HEARTBEAT_PERIOD             : time    :=  1000 ms; -- 1 Hz
    constant HEARTBEAT_CNTS               : integer := HEARTBEAT_PERIOD / SYS_CLOCK_PERIOD;
--    constant HEARTBEAT_CNTS               : integer := 12000000;
    constant HEARTBEAT_CNT_SIZE           : natural := log2(HEARTBEAT_CNTS,UP);

    constant UART_RATE                    : integer := 115200;

    constant MEM_MAP_GBL : memMapRecArrayType := (
        memRec("VSYNC"               , x"00",             WO),  -- vsync set-clear (D1: 1=start, 0=stop)
        memRec("VBLANK"              , x"01",             WO),  -- vertical blank set-clear (D1: 1=start, 0=stop)
        memRec("WSYNC"               , x"02",             WO),  -- wait for leading edge of horizontal blank (no data bits)
        memRec("RSYNC"               , x"03",             WO),  -- reset horizontal sync counter  (no data bits)

        memRec("NUSIZ0"              , x"04",             WO),  -- number-size player-missile 0
        memRec("NUSIZ1"              , x"05",             WO),  -- number-size player-missile 1
        --  D5-D4: Missile size (1,2,4,8 clocks), D2-D0: Number and size
        
        memRec("COLUP0"              , x"06",             WO),  -- color-luminance player 0 (D7-D4: color, D3-D1: luminance)
        memRec("COLUP1"              , x"07",             WO),  -- color-luminance player 1
        memRec("COLUPF"              , x"08",             WO),  -- color-luminance playfield
        memRec("COLUBK"              , x"09",             WO),  -- color-luminance background color 
        
        memRec("CTRLPF"              , x"0A",             WO),  -- control playfield ball size and collisions
        -- D5-D4: Ball size (1,2,4,8 clocks), D2: Playfield priority, D1: Score, D0: Reflect
        
        memRec("REFP0"               , x"0B",             WO),  -- reflect player 0 (D3: 0=off, 1=reflect)
        memRec("REFP1"               , x"0C",             WO),  -- reflect player 1
        memRec("PF0"                 , x"0D",             WO),  -- playfield register byte 0 (D7-D4)
        memRec("PF1"                 , x"0E",             WO),  -- playfield register byte 1 (D7-D0)
        memRec("PF2"                 , x"0F",             WO),  -- playfield register byte 2 (D7-D0)

        -- Resets
        memRec("RESP0"               , x"10",             WO),  -- reset player 0  (no data bits)
        memRec("RESP1"               , x"11",             WO),  -- reset player 1  (no data bits)
        memRec("RESM0"               , x"12",             WO),  -- reset missile 0 to player 0 (D1: lock)
        memRec("RESM1"               , x"13",             WO),  -- reset missile 1 to player 1 (D1: lock)
        memRec("RESBL"               , x"14",             WO),  -- reset ball      (no data bits)
        
        -- Audio controls
        memRec("AUDC0"               , x"15",             WO),  -- audio control 0 (D3-D0: divider)
        memRec("AUDC1"               , x"16",             WO),  -- audio control 1
        memRec("AUDF0"               , x"17",             WO),  -- audio frequency 0 (D4-D0: divider)
        memRec("AUDF1"               , x"18",             WO),  -- audio frequency 1
        memRec("AUDV0"               , x"19",             WO),  -- audio volume 0 (D3-D0: volume)
        memRec("AUDV1"               , x"1A",             WO),  -- audio volume 1

        memRec("GRP0"                , x"1B",             WO),  -- graphics player 0 (pixels to display)
        memRec("GRP1"                , x"1C",             WO),  -- graphics player 1
        
        memRec("ENAM0"               , x"1D",             WO),  -- graphics (enable) missile 0 (D1: 0=off, 1=on)
        memRec("ENAM1"               , x"1E",             WO),  -- graphics (enable) missile 1
        memRec("ENABL"               , x"1F",             WO),  -- graphics (enable) ball
        
        memRec("HMP0"                , x"20",             WO),  -- horizontal motion player 0 (D7-D4: # of clocks of movement)
        memRec("HMP1"                , x"21",             WO),  -- horizontal motion player 1
        memRec("HMM0"                , x"22",             WO),  -- horizontal motion missile 0
        memRec("HMM1"                , x"23",             WO),  -- horizontal motion missile 1
        memRec("HMBL"                , x"24",             WO),  -- horizontal motion ball
        
        memRec("VDELP0"              , x"25",             WO),  -- vertical delay player 0 (D0: 0=off,1=delay)
        memRec("VDELP1"              , x"26",             WO),  -- vertical delay player 1
        memRec("VDELBL"              , x"27",             WO),  -- vertical delay ball
        memRec("RESMP0"              , x"28",             WO),  -- reset missile 0 to player 0
        memRec("RESMP1"              , x"29",             WO),  -- reset missile 1 to player 1
        memRec("HMOVE"               , x"2A",             WO),  -- apply horizontal motion (only right after WSYNC) (no data bits)
        memRec("HMCLR"               , x"2B",             WO),  -- clear horizontal motion registers (no data bits)
        memRec("CXCLR"               , x"2C",             WO),  -- clear collision latches (no data bits)

        -- Read-only registers will not be needed
        memRec("CXM0P"               , x"00",             RO),  -- read collision m0p1,m0p0
        memRec("CXM1P"               , x"01",             RO),  -- read collision m1p0,m1p1
        memRec("CXP0FB"              , x"02",             RO),  -- read collision p0pf,p0bl
        memRec("CXP1FB"              , x"03",             RO),  -- read collision p1pf,p1bl
        memRec("CXM0FB"              , x"04",             RO),  -- read collision m0pf,m0bl
        memRec("CXM1FB"              , x"05",             RO),  -- read collision m1pf,m1bl
        memRec("CXBLPF"              , x"06",             RO),  -- read collision blpf
        memRec("CXPPMM"              , x"07",             RO),  -- read collision p0p1,m0m1
        memRec("INPT0"               , x"08",             RO),  -- read pot port 
        memRec("INPT1"               , x"09",             RO),  -- read pot port 
        memRec("INPT2"               , x"0A",             RO),  -- read pot port 
        memRec("INPT3"               , x"0B",             RO),  -- read pot port 
        memRec("INPT4"               , x"0C",             RO),  -- read input port 
        memRec("INPT5"               , x"0D",             RO)); -- read input port 


end sys_description_pkg;

package body sys_description_pkg is


end sys_description_pkg;