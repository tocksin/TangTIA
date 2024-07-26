-- TV Interface Adapter (TIA)
-- Copyright 2006, 2010 Retromaster
--
--  This file is part of A2601.
--
--  A2601 is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License,
--  or any later version.
--
--  A2601 is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with A2601.  If not, see <http://www.gnu.org/licenses/>.
--

library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;

entity audio is
    port(
        clke    : in    std_logic;
        clk_ena : in    std_logic; -- replaced boolean with std_logic
        cnt     : in    std_logic;
        freq    : in    std_logic_vector(4 downto 0);
        ctrl    : in    std_logic_vector(3 downto 0);
        ao      :   out std_logic);
end entity audio;

architecture rtl of audio is

    signal dvdr     : unsigned(4 downto 0) := "00000";
    signal sr4      : std_logic_vector(3 downto 0) := "0000";
    signal sr5      : std_logic_vector(4 downto 0) := "00000";
    signal sr5_tap  : std_logic;
    signal sr4_in   : std_logic;
    signal sr5_in   : std_logic;
    signal sr4_cnt  : std_logic;
    signal sr5_cnt  : std_logic;

begin

    audioProc: process(clke)
    begin
        if rising_edge(clke) then -- moved clk_ena to synchronous input
            if (clk_ena='1') and (cnt = '1') then
                if (sr4_cnt = '1') then
                    sr4 <= sr4_in & sr4(3 downto 1);
                end if;
                if (sr5_cnt = '1') then
                    sr5 <= sr5_in & sr5(4 downto 1);
                end if;
                if (dvdr = unsigned(freq)) then
                    dvdr <= "00000";
                else
                    dvdr <= dvdr + 1;
                end if;
            end if;
        end if;
    end process audioProc;

    sr5_in <= '1' when
        (ctrl = "0000") or
        (sr5_tap = '1') or
        (sr5 = "00000" and (ctrl(0) = '1' or ctrl(1) = '1' or sr4 = "1111"))
        else '0';

    sr4_in <= '1' when
        (ctrl = "0000") or
        (ctrl(3 downto 2) = "00" and (sr4 = "1111" or ((sr4(1) xnor sr4(0)) = '1'))) or
        (ctrl(3 downto 2) = "11" and (sr4(3 downto 1) = "101" or sr4(1) = '0')) or
        (ctrl(3 downto 2) = "01" and sr4(3) = '0') or
        (ctrl(3 downto 2) = "10" and sr5(0) = '1')
        else '0';

    sr5_tap <= sr5(0) xor sr4(0) when (ctrl(1 downto 0) = "00") else sr5(0) xor sr5(3);

    sr5_cnt <= '1' when (dvdr = unsigned(freq)) else '0';  -- CHECKME

    sr4_cnt <= '1' when
        (dvdr = unsigned(freq) and (
            (ctrl(1 downto 0) = "10" and sr5(4 downto 1) = "0001") or
            (ctrl(1 downto 0) = "11" and sr5(0) = '1')  or
            (ctrl(1) = '0')))
        else '0';

    ao <= sr4(0);

end architecture rtl;

