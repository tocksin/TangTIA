-- @file uart_tx_fifo.vhd
-- @brief UART transmitter with fifo interface for buffering
-- @author Justin Davis
--
-- Date: 05/23/2023
-- LastEditedBy: Justin Davis
--
-- Copyright: 2023 Southwest Research Institute
-------------------------------------------------------------------------------

library ieee;       use ieee.std_logic_1164.all;

library work;       use work.tools_pkg.all;

entity uart_tx_fifo is
    generic(baud    : integer := 9600;
            clkRate : time := 10 ns);
    port(   clkIn   : in sl;
            rstIn   : in sl;
            uartTxOut  : out sl;
 
            wrIn    : in sl;
            dataIn  : in slv;
            fullOut : out sl
        );
end entity uart_tx_fifo;

architecture rtl of uart_tx_fifo is

    signal sendEnable : sl;
    signal sendByte   : slv(7 downto 0);
    signal uartRdy    : sl;
    signal fifoEmpty  : sl;

begin

    uartTxComp: entity work.uart_tx
        generic map (
            baud            => baud,
            clkRate         => clkRate) 
        port map(
            clkIn           => clkIn,
            rstIn           => rstIn,
            uartSerialOut   => uartTxOut,
            sendEnIn        => sendEnable,
            dataIn          => sendByte,
            readyOut        => uartRdy
        );

    uartFifoComp : entity work.fifo(rtl)
        generic map(
            DATA_WIDTH => 8,
            ADDR_WIDTH => 8
        )
        port map(
            clkIn    => clkIn,
            rstIn    => rstIn,

            data_in  => dataIn,
            wr_en    => wrIn,
            full     => fullOut,

            data_out => sendByte,
            rd_en    => sendEnable,
            empty    => fifoEmpty
    );

    sendEnable <= '1' when (fifoEmpty = '0') and (uartRdy = '1') else '0';

end architecture rtl;
