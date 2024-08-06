-- @file fifo.vhd
-- @brief General purpose FIFO (will synthesize to distributed RAM
-- @author Justin Davis
--
-- Date: 05/23/2023
-- LastEditedBy: Justin Davis
--
-- Copyright: 2023 Southwest Research Institute
-------------------------------------------------------------------------------

library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;

entity fifo is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 8
    );
    port (
        clkIn    :in  std_logic; -- Clock input
        rstIn    :in  std_logic; -- Active high reset

        data_in  :in  std_logic_vector (DATA_WIDTH-1 downto 0); -- Data input
        wr_en    :in  std_logic; -- Write Enable
        full     :out std_logic; -- FIFO full

        data_out :out std_logic_vector (DATA_WIDTH-1 downto 0); -- Data Output
        rd_en    :in  std_logic; -- Read enable
        empty    :out std_logic  -- FIFO empty
    );
end entity fifo;
architecture rtl of fifo is
    -------------Internal variables-------------------
    constant RAM_DEPTH :integer := 2**ADDR_WIDTH;

    signal wr_pointer   :unsigned (ADDR_WIDTH-1 downto 0);
    signal rd_pointer   :unsigned (ADDR_WIDTH-1 downto 0);
    signal status_cnt   :unsigned (ADDR_WIDTH   downto 0);
    signal data_ram_in  :std_logic_vector (DATA_WIDTH-1 downto 0);
    signal data_ram_out :std_logic_vector (DATA_WIDTH-1 downto 0);
    
   
begin
    -------------Code Start---------------------------
    full  <= '1' when (status_cnt = (RAM_DEPTH-1)) else '0';
    empty <= '1' when (status_cnt = 0) else '0';

    pointersProc: process (clkIn, rstIn) 
    begin
        if (rstIn = '1') then
            wr_pointer <= (others=>'0');
            rd_pointer <= (others=>'0');
--            data_out <= (others=>'0');
        elsif (rising_edge(clkIn)) then
            if ( wr_en = '1') then
                wr_pointer <= wr_pointer + 1;
            end if;
            if ( rd_en = '1') then
                rd_pointer <= rd_pointer + 1;
            end if;
        end if;
    end process;

    data_out <= data_ram_out;
    
    STATUS_COUNTER: process (clkIn, rstIn) 
    begin
        if (rstIn = '1') then
            status_cnt <= (others=>'0');
        -- Read but no write.
        elsif (rising_edge(clkIn)) then
            if (( rd_en = '1') and not(wr_en = '1') and (status_cnt /= 0)) then
                status_cnt <= status_cnt - 1;
            -- Write but no read.
            elsif ((wr_en = '1') and not ( rd_en = '1') and (status_cnt /= RAM_DEPTH)) then
                status_cnt <= status_cnt + 1;
            end if;
        end if;
    end process;
    
    data_ram_in <= data_in;

    DP_RAM : entity work.dp_ram
    generic map (
        DATA_WIDTH => DATA_WIDTH,
        ADDR_WIDTH => ADDR_WIDTH
    )
    port map (
        clkIn     => clkIn, 
        address_0 => std_logic_vector(wr_pointer),    -- address_0 input
        data0In    => data_ram_in,   -- data_0 bi-directional
        data0Out   => open,
        we_0      => wr_en,         -- write enable

        address_1 => std_logic_vector(rd_pointer),    -- address_q input
        data1In   => (7 downto 0 => '0'),
        data1Out    => data_ram_out,  -- data_1 bi-directional
        we_1      => '0'           -- Read enable
    );
    
end architecture;