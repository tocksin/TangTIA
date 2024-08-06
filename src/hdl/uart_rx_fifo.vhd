-- @file uart_rx_fifo.vhd
-- @brief UART receiver with fifo interface for buffering
-- @author Justin Davis
--
-- Date: 05/23/2023
-- LastEditedBy: Justin Davis
--
-- Copyright: 2023 Southwest Research Institute
-------------------------------------------------------------------------------

library ieee;       use ieee.std_logic_1164.all;

entity uart_rx_fifo is
    generic(    baud     : integer := 9600;
                clkRate  : time := 10 ns);
    port(       clkIn    : in std_logic;
                rstIn    : in std_logic;
                serialIn : in std_logic;
                dataOut  : out std_logic_vector(7 downto 0);
                rdIn     : in std_logic;
                emptyOut : out std_logic
    );
end entity uart_rx_fifo;

architecture rtl of uart_rx_fifo is

    signal recvByte : std_logic_vector(7 downto 0);
    signal uartStrb : std_logic;

begin

    receiverUart: entity work.uart_rx(rtl)
        generic map(
            baud        => baud,
            clkRate     => clkRate) 
        port map(
        -- Global Control
            clkIn       => clkIn,
            rstIn       => rstIn,
            serialIn    => serialIn,

        -- Byte Stream Output
            recvDataOut => recvByte,
            recvStrbOut => uartStrb
        );

    uart_fifo_comp : entity work.fifo(rtl)
        generic map(
            DATA_WIDTH => 8,
            ADDR_WIDTH => 8
        )
        port map(
            clkIn    => clkIn,
            rstIn    => rstIn,

            data_in  => recvByte,
            wr_en    => uartStrb,
            full     => open,

            data_out => dataOut,
            rd_en    => rdIn,
            empty    => emptyOut
    );


end architecture rtl;
