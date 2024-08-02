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
            
            -- PSRAM(Internal connection)
            O_psram_ck      : out    slv(1 downto 0); 
            O_psram_ck_n    : out    slv(1 downto 0);
            IO_psram_rwds   : inout  slv(1 downto 0);
            IO_psram_dq     : inout  slv(15 downto 0);
            O_psram_reset_n : out    slv(1 downto 0);
            O_psram_cs_n    : out    slv(1 downto 0);

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

    component ELVDS_OBUF
        port (I :IN  std_logic;
              OB:OUT std_logic;
              O :OUT std_logic);
    end component;

    constant VIDEOID          : integer := 1; -- 640x480
    constant VIDEO_REFRESH    : real    := 59.94;
    constant AUDIO_RATE       : integer := 48000;
--    constant AUDIO_CNTS       : integer :=  clock_frequency / audio_rate / 2
    constant AUDIO_CNTS       : integer := 1023;
    constant AUDIO_BIT_WIDTH  : integer := 16;
    constant BIT_WIDTH        : integer := 10;
    constant BIT_HEIGHT       : integer := 10;
    
    type audioArrayType is array (1 downto 0) of slv(15 downto 0);

    type RW_STATE_TYPE is (IDLE, WRITING, READING);

    signal reset        : sl;
    signal clk_pixel    : sl;
    signal clk_pixel_x5 : sl;
    signal lock         : sl;
    signal clkAudio     : sl := '0';
    signal audioWord    : audioArrayType;
    signal rgb          : slv(23 downto 0);
    signal cx           : slv(BIT_WIDTH-1 downto 0);
    signal cy           : slv(BIT_HEIGHT-1 downto 0);
    signal tmds         : slv(2 downto 0);
    signal tmdsClk      : sl;
    signal audioCnt     : unsigned(8 downto 0);
    
    signal uartData     : slv(7 downto 0);
    signal uartStrobe   : sl;
    
    signal psramAddr    : slv(20 downto 0);
    signal rwState      : RW_STATE_TYPE;
    
    signal memDelayCnt  : unsigned(4 downto 0);
    signal memDelayEn   : sl;
    signal memDelayDone : sl;
    
begin

    reset <= not btn2;

    uartTxProc : entity work.uart_tx
    generic map(baud            => UART_RATE,
                clkRate         => SYS_CLOCK_PERIOD)
      port map (clkIn           => clk_pixel,
                rstIn           => reset,
                sendEnIn        => psramRdValid,
                dataIn          => psramRdData,
                readyOut        => open,
                uartSerialOut   => uartTx);

    uartRxProc : entity work.uart_rx
    generic map(baud            => UART_RATE,
                clkRate         => SYS_CLOCK_PERIOD)
      port map (clkIn           => clk_pixel,
                rstIn           => reset,
                serialIn        => uartRx,
                recvStrbOut     => uartStrobe,
                recvDataOut     => uartData);
                
    -- TIA module
    --  Takes in the bus pins
        -- databus(7 downto 0)
        -- addrbus(5 downto 0)
        -- cs0_n                -- needs to be low to be valid address
        -- cs3_n                -- needs to be low to be valid address
        -- r/w
        -- OSC                  -- primary fast clock 3.58MHz
        -- PHI0                 -- derived from OSC, output to the CPU
        -- PHI2                 -- input back from CPU, 1.19MHz
        -- RDY
        -- If the read-write line is low, 
        --   the data bits will be written into the addressed write location when the 02 clock goes from high to low.
        -- If the read-write line is high, 
        --   the addressed location can be read by the microprocessor on data lines 6 and 7 while the 02 clock is high.
    --  Output x/y pixel and color for that pixel

    -- PSRAM Interface
    --  64Mbit in-package memory
    --  A video buffer holds the frame from the TIA until the HDMI reads it out
    --  There is not enough block RAM to hold the frame
    --  One interface must be shared by both sides
    --  The faster side will control the memory - the HDMI side
    --  A state machine will handle writes to the memory from the TIA module
    --  A simple buffer will hold the writes and handle the clock crossing
    --  DDR mode, 6 toggles to send command addres, 8 toggles delay, 8 more delay, then 
    psramAddr <= x"000";
    psramWrData <= x"00000000000000" & uartData;
    psramMask <= x"FF";

    -- When I receive a character, write it into memory
    -- Wait a certain amount of time (16 clock cycles?)
    -- Then perform a read
    ReadWriteProc : process (clk_pixel)
    begin
        if rising_edge(clk_pixel) then
            memDelayEn <= '0';
            case (rwState) is
                when IDLE =>
                    psramRW <= '1';
                    psramEn <= '0';
                    if uartStrobe=1 then
                        psramEn <= '1';
                        rwState <= WRITING;
                        memDelayEn <= '1';
                    end if;
                when WRITING =>
                    psramRW <= '0';
                    psramEn <= '0';
                    if memDelayDone=1 then
                        rwState <= READING;
                    end if;
                when READING =>
                    psramRW <= '0';
                    psramEn <= '1';
                    rwState <= IDLE;
            end case;
        end if;
    end process ReadWriteProc;
    
    memDelayProc : process (clk_pixel)
    begin
        if rising_edge(clk_pixel) then
            memDelayDone <= '0';
            if memDelayEn ='1' then
                memDelayCnt <= x"0F";
            elsif memDelayCnt=0 then
                memDelayDone <= '1';
            else 
                memDelayCnt <= memDelayCnt - 1;
            end if;
        end if;
    end process memDelayProc;

    memoryComp: entity work.PSRAM_Memory_Interface_HS_V2_Top
        port map (
            clk_d           => clk_pixel,           --input generated by same pll, divided by 4 normally
            memory_clk      => clk_pixel_x5,        --input usually from pll? (50-250MHz)
            memory_clk_p    => memory_clk_p,        --input usually from pll, but phase shift 90 degrees
            pll_lock        => lock,                --input use with memory clock
            rst_n           => not reset,           --input active low reset
            
            init_calib      => open,                --output initialization completed
            addr            => psramAddr,           --input address (21-bit)
            wr_data         => psramWrData,         --input write data (64-bit)
            data_mask       => psramMask,           --input mask for wr_data (8-bits)
            rd_data         => psramRdData,         --output read data (64-bit)
            rd_data_valid   => psramRdValid,        --output read data 1 = valid
            cmd             => psramRW,             --input command channel (0=read, 1=write)
            cmd_en          => psramEn,             --input command enable
            clk_out         => open,                --output of 1/2 clk_d

            -- To top level external ports
            O_psram_ck      => O_psram_ck,          -- clock
            O_psram_ck_n    => O_psram_ck_n,        -- clock inverted
            IO_psram_dq     => IO_psram_dq,         -- data in and out
            IO_psram_rwds   => IO_psram_rwds,       -- read/write control
            O_psram_cs_n    => O_psram_cs_n,        -- chip select active low
            O_psram_reset_n => O_psram_reset_n      -- reset active low
        );

    -- HDMI module
    --  Reads video from RAM

    -- HDMI clocks
    u_pll : entity work.Gowin_rPLL2
        port map( clkin  => clk,            -- 27 MHz
                  clkout => clk_pixel_x5,   -- 125.875MHz
                  lock   => lock);
                  
    u_div_5 : entity work.Gowin_CLKDIV
        port map( hclkin => clk_pixel_x5,
                  clkout => clk_pixel,      -- 25.175MHz
                  resetn => lock );

    -- not the best way to generate a clock
    -- 24.5KHz = 25.175/1024
    audioClkProc : process (clk_pixel)
    begin
        if rising_edge(clk_pixel) then
            if (audioCnt=0) then
                audioCnt <= to_unsigned(AUDIO_CNTS,audioCnt'length);
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
        port map (  reset               => reset,
                    clk_pixel           => clk_pixel,
                    clk_pixel_x5        => clk_pixel_x5,

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

    -- Need 24 bits of data every 25.175MHz
    -- Test video
    rgb(23 downto 16) <= cx(7 downto 0);
    rgb(15 downto 8) <= cy(7 downto 0);
    rgb(7 downto 0) <= cx(9 downto 8) & cy(9 downto 8) & "0000";

    -- Test audio
    testAudioProc : process (clkAudio)
    begin
        if rising_edge(clkAudio) then
           audioWord(1)(12 downto 8) <= slv(unsigned(audioWord(1)(12 downto 8)) + "11111");
           audioWord(0)(12 downto 8) <= slv(unsigned(audioWord(0)(12 downto 8)) - "11111");
        end if;
    end process testAudioProc;

    -- HDMI output buffers
    tmdsBuffer0 : ELVDS_OBUF
        port map(   I   => tmds(0),
                    O   => tmdsDataP(0),
                    OB  => tmdsDataN(0));

    tmdsBuffer1 : ELVDS_OBUF
        port map(   I   => tmds(1),
                    O   => tmdsDataP(1),
                    OB  => tmdsDataN(1));

    tmdsBuffer2 : ELVDS_OBUF
        port map(   I   => tmds(2),
                    O   => tmdsDataP(2),
                    OB  => tmdsDataN(2));

    tmdsBuffer3 : ELVDS_OBUF
        port map(   I   => clk_pixel,
                    O   => tmdsClkP,
                    OB  => tmdsClkN);

end architecture rtl;
