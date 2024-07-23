/*
* @file tangtia_top.vhd
* @brief Top level design for the spiking neural network TTL project
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

entity tangtia_top is
    port (  clk         : in sl;    -- 27 MHz
            resetn      : in sl;
            led         : in slv(5 downto 0);
            btn1        : in  sl;
            btn2        : in  sl;
            
            tmdsDataP   : out slv(2 downto 0);
            tmdsDataN   : out slv(2 downto 0);
            tmdsClkP    : out sl;
            tmdsClkN    : out sl;

            uartTx      : out sl;
            uartRx      : in sl;

            tfClk       : out sl;
            tfCs        : out sl;
            tfMosi      : out sl;
            tfMiso      : in  sl;

            flashClk    : out sl;
            flashCs     : out sl;
            flashMosi   : out sl;
            flashMiso   : in  sl;

            pin25       : in  sl;
            pin26       : in  sl;
            pin27       : in  sl;
            pin28       : in  sl;
            pin29       : in  sl;
            pin30       : in  sl;
            pin31       : in  sl;
            pin32       : in  sl;
            pin33       : in  sl;
            pin34       : in  sl;
            pin35       : in  sl;
            pin40       : in  sl;
            pin41       : in  sl;
            pin42       : in  sl;
            pin48       : in  sl;
            pin49       : in  sl;
            pin51       : in  sl;
            pin53       : in  sl;
            pin54       : in  sl;
            pin55       : in  sl;
            pin56       : in  sl;
            pin57       : in  sl;
            pin63       : in  sl;
            pin76       : in  sl;
            pin77       : in  sl
    );
end entity tangtia_top;

architecture rtl of tangtia_top is

    constant VIDEOID          : integer := 2; -- 720x480, 27MHz pixel clock
    constant VIDEO_REFRESH    : real    := 59.94;
    constant AUDIO_RATE       : integer := 48000;
--    constant AUDIO_CNTS       : integer :=  clock_frequency / audio_rate / 2
    constant AUDIO_CNTS       : integer := 281;
    constant AUDIO_BIT_WIDTH  : integer := 16;
    constant BIT_WIDTH        : integer := 10;
    constant BIT_HEIGHT       : integer := 10;

    signal reset        : sl;
    signal clkPixel     : sl;
    signal lock         : sl;
    signal clkAudio     : sl := '0';
    signal audioWord    : slv(1 downto 0);
    signal rgb          : slv(23 downto 0);
    signal cx           : slv(BIT_WIDTH-1 downto 0);
    signal cy           : slv(BIT_HEIGHT-1 downto 0);
    signal tmds         : slv(2 downto 0);
    signal tmdsClk      : sl;
    
begin

    reset <= not resetn;
    
    -- TIA module
    --  Takes in the bus pins
    --  Output x/y pixel and color for that pixel

    -- Dual port RAM module
    --  One side TIA controls
    --  One side HDMI controls

    -- HDMI module
    --  Reads video from RAM

    -- HDMI clocks
    pllComp : entity work.pll_hdmi
        port map (  clkin   => clk,          -- 27MHz
                    clkout  => clkPixel,       -- 5x pixel clock: 135 Mhz
                    lock    => lock);

    -- not the best way to generate a clock
    audioClkProc : process (clk)
    begin
        if rising_edge(clk) then
            if (audio_divider=0) then
                audioCnt <= AUDIO_CNTS;
                clkAudio <=  not clkAudio; 
            else
                audioCnt <= audioCnt - 1;
            end if;
        end if;
    end process audioClkProc;
    
    hdmiComp : entity work.hdmi
        generic map(VIDEO_ID_CODE       => VIDEOID,
                    DVI_OUTPUT          => 0,
                    VIDEO_REFRESH_RATE  => VIDEO_REFRESH,
                    IT_CONTENT          => 1,
                    AUDIO_RATE          => AUDIO_RATE,
                    AUDIO_BIT_WIDTH     => AUDIO_BIT_WIDTH,
                    START_X             => 0,
                    START_Y             => 0)
        port map (  reset               => not resetn, -- active high
                    clk_pixel           => clk,
                    clk_pixel_x5        => clkPixel,

                    clk_audio           => clkAudio,
                    audio_sample_word   => audioWord,

                    cx                  => cx,  -- x pixel location requested
                    cy                  => cy,  -- y pixel location requested
                    rgb                 => rgb, -- color of that pixel
                    frame_width         => open,
                    frame_height        => open,
                    screen_width        => open,
                    screen_height       => open, 
                    
                    tmds_clock          => tmdsClk,
                    tmds                => tmds);

    -- Test video
    rgb(23 downto 16) <= cx(7 downto 0);
    rgb(15 downto 8) <= cy(7 downto 0);
    rgb(7 downto 0) <= cx(9 downto 8) & cy(9 downto 8) & "0000";

    -- Test audio
    testAudioProc : process (clkAudio)
    begin
        if rising_edge(clkAudio) then
            audioWord(1) <= audioWord(1) + 1;
            audioWord(0) <= audioWord(0) - 1;
        end if;
    end process testAudioProc;

    -- HDMI output buffers
    tmdsBuffer0 : entity ELVDS_OBUF
        port map(   I   => tmds(0),
                    O   => tmdsDataP(0),
                    OB  => tmdsDataN(0));

    tmdsBuffer1 : entity ELVDS_OBUF
        port map(   I   => tmds(1),
                    O   => tmdsDataP(1),
                    OB  => tmdsDataN(1));

    tmdsBuffer2 : entity ELVDS_OBUF
        port map(   I   => tmds(2),
                    O   => tmdsDataP(2),
                    OB  => tmdsDataN(2));

    tmdsBuffer3 : entity ELVDS_OBUF
        port map(   I   => tmdsClk,
                    O   => tmdsClkP,
                    OB  => tmdsClkN);

end architecture rtl;
