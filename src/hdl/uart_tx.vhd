-- @file uart_tx.vhd
-- @brief UART transmitter 
-- @author Justin Davis
--
-- Date: 05/23/2023
-- LastEditedBy: Justin Davis
--
-- Copyright: 2023 Southwest Research Institute
-------------------------------------------------------------------------------

library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;

library work;       use work.tools_pkg.all;

entity uart_tx is
    generic(baud            : integer := 9600;
            clkRate         : time    := 10 ns);
    port (  clkIn           : in    sl;
            rstIn           : in    sl;
            sendEnIn        : in    sl;
            dataIn          : in    slv (7 downto 0);
            readyOut        :   out sl;
            uartSerialOut   :   out sl);
end entity uart_tx;

architecture rtl of uart_tx is

    constant UART_CNTS      : integer := integer(real( 1 sec / clkRate) / real(baud));
    constant UART_CNT_SIZE  : integer := log2(UART_CNTS,UP);
    constant BIT_TMR_MAX    : unsigned(UART_CNT_SIZE-1 downto 0) := to_unsigned(UART_CNTS,UART_CNT_SIZE);
    constant BIT_INDEX_MAX  : natural := 10;

    type TX_STATE_TYPE is (STANDBY, LOAD, SEND);

    signal bitTmr : unsigned(UART_CNT_SIZE-1 downto 0);

    signal bitDone : sl;

    signal bitIndex : natural;

    signal txBit : sl;

    signal serialVector : slv(9 downto 0);

    signal txState : TX_STATE_TYPE;

begin

    stateProc : process (clkIn, rstIn)
    begin
        if (rstIn='1') then
            txState <= STANDBY;
            serialVector <= (others => '0');
            txBit <= '1';
        elsif (rising_edge(clkIn)) then
            case txState is 
                when STANDBY =>
                    txBit <= '1';
                    if (sendEnIn = '1') then
                        serialVector <= '1' & dataIn & '0';
                        txState <= LOAD;
                    end if;
                when LOAD =>
                    txState <= SEND;
                    txBit <= serialVector(bitIndex);
                when SEND =>
                    if (bitDone = '1') then
                        if (bitIndex = BIT_INDEX_MAX) then
                            txState <= STANDBY;
                        else
                            txState <= LOAD;
                        end if;
                    end if;
                when others=> 
                    txState <= STANDBY;
            end case;
        end if;
    end process stateProc;
    
    bitCountProc : process (clkIn, rstIn)
    begin
        if (rstIn='1') then
            bitTmr <= BIT_TMR_MAX;
        elsif (rising_edge(clkIn)) then
            if (txState = STANDBY) then
                bitTmr <= BIT_TMR_MAX;
            else
                if (bitDone = '1') then
                    bitTmr <= BIT_TMR_MAX;
                else
                    bitTmr <= bitTmr - 1;
                end if;
            end if;
        end if;
    end process bitCountProc;
    
    bitDone <= '1' when (bitTmr = (bitTmr'range => '0')) else '0';
    
    byteCountProc : process (clkIn, rstIn)
    begin
        if (rstIn='1') then
            bitIndex <= 0;
        elsif (rising_edge(clkIn)) then
            if (txState = STANDBY) then
                bitIndex <= 0;
            elsif (txState = LOAD) then
                bitIndex <= bitIndex + 1;
            end if;
        end if;
    end process byteCountProc;
    
    uartSerialOut <= txBit;
    readyOut <= '1' when (txState = STANDBY) else '0';
    
end architecture rtl;

