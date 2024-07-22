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
    constant INPUT_CLOCK_PERIOD           : time    :=   100 ns; -- 10 MHz
    constant SYS_CLOCK_PERIOD             : time    :=   INPUT_CLOCK_PERIOD*2;
    constant HEARTBEAT_PERIOD             : time    :=  1000 ms; -- 1 Hz
    constant HEARTBEAT_CNTS               : integer := HEARTBEAT_PERIOD / SYS_CLOCK_PERIOD;
--    constant HEARTBEAT_CNTS               : integer := 12000000;
    constant HEARTBEAT_CNT_SIZE           : natural := log2(HEARTBEAT_CNTS,UP);


end sys_description_pkg;

package body sys_description_pkg is


end sys_description_pkg;