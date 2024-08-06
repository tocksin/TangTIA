/*
* @file tia_if.vhd
* @brief TIA interface
* @author Justin Davis
*
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
**************************************************************************/
library ieee;           use ieee.std_logic_1164.all;
                        use ieee.numeric_std.all;

library work;           use work.sys_description_pkg.all;
                        use work.tools_pkg.all;

entity tia_if is
    port (  iClk        : in sl;
            iRst        : in sl;

            --Atari bus interface
            iVideoClk   : in sl;
            iChipSelect : in sl;
            iReadWrite  : in sl;
            iAddr       : in slv(5 downto 0);
            iData       : in slv(7 downto 0);

            --Video output interface
            oColor      : out slv(7 downto 0);
            oX          : out slv(7 downto 0);
            oY          : out slv(7 downto 0);
            oValid      : out sl);
end entity tia_if;

architecture rtl of tia_if is

begin

end architecture rtl;
