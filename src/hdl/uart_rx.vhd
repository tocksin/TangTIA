-- @file uart_rx.vhd
-- @brief UART receiver 
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

entity uart_rx is
    generic(baud        : integer := 9600;
            clkRate     : time    := 10 ns);
    port(   clkIn       : in    std_logic;
            rstIn       : in    std_logic;
            serialIn    : in    std_logic;
            recvStrbOut :   out std_logic;
            recvDataOut :   out std_logic_vector(7 downto 0)
    );
end entity uart_rx;

architecture rtl of uart_rx is
  constant UART_CNTS       : integer := integer(real( 1 sec / clkRate) / real(baud)) - 1;
  constant HALF_CNTS       : integer := UART_CNTS / 2;

  type RX_STATE_TYPE is (READY, START, DATABYTE, STOP);
  
  signal rxState     : RX_STATE_TYPE;
 
  signal serialR     : std_logic;
  signal serialRR    : std_logic;
   
  signal bitCnt      : integer range 0 to UART_CNTS;
  signal bitIndex    : integer range 0 to 7;
  signal dataWord    : std_logic_vector(7 downto 0);
  signal validStrobe : std_logic;
   
begin
 
    inputRegisterProc : process (clkIn, rstIn)
    begin
        if (rstIn = '1') then
            serialR  <= '1';
            serialRR <= '1';        
        elsif rising_edge(clkIn) then
            serialR  <= serialIn;
            serialRR <= serialR; 
        end if; 
    end process inputRegisterProc; 
      
    rxStateProc : process (clkIn, rstIn) 
    begin 
        if (rstIn = '1') then
            validStrobe <= '0';
            bitCnt      <= 0;
            bitIndex    <= 0;
            rxState     <= READY; 
            dataWord    <= (others => '0');
        elsif rising_edge(clkIn) then 
            validStrobe   <= '0';
            case rxState is 
                when READY =>
                    bitCnt      <= HALF_CNTS;
                    bitIndex    <= 0;
                    if serialRR = '0' then
                        rxState <= START;
                    end if;
                when START =>
                    if bitCnt = 0 then
                        if serialRR = '0' then
                            bitCnt <= UART_CNTS;
                            rxState   <= DATABYTE;
                        else
                            rxState   <= READY; -- Abort
                        end if;
                    else
                        bitCnt <= bitCnt - 1;
                    end if;
                when DATABYTE =>
                    if bitCnt = 0 then
                        bitCnt             <= UART_CNTS;
                        dataWord(bitIndex) <= serialRR;
             
                        if bitIndex = 7 then
                            bitIndex <= 0;
                            rxState  <= STOP; 
                        else
                            bitIndex <= bitIndex + 1;
                        end if; 
                    else
                        bitCnt <= bitCnt - 1;
                    end if;
                when STOP =>
                    if bitCnt = 0 then
                        validStrobe <= '1';
                        bitCnt      <= 0;
                        rxState     <= READY; 
                    else
                        bitCnt <= bitCnt - 1;
                    end if;
                when others =>
                    rxState <= READY;
            end case;
        end if;
    end process rxStateProc;
 
    recvStrbOut <= validStrobe;
    recvDataOut <= dataWord;
   
end architecture rtl;