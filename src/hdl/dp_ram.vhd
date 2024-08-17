-- @file dp_ram.vhd
-- @brief Dual-port ram - will synthesize to distributed RAM
-- @author Justin Davis
--
-- Date: 05/23/2023
-- LastEditedBy: Justin Davis
--
-- Copyright: 2023 Southwest Research Institute
-------------------------------------------------------------------------------

library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;

entity dp_ram is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 8
    );
    port (
        clkIn     : in    std_logic;                                 -- Clock Input
        address_0 : in    std_logic_vector (ADDR_WIDTH-1 downto 0);  -- address_0 Input
        data0In    : in    std_logic_vector (DATA_WIDTH-1 downto 0);  -- data_0 bi-directional
        data0Out    : out    std_logic_vector (DATA_WIDTH-1 downto 0);  -- data_0 bi-directional
        we_0      : in    std_logic;                                 -- Write Enable/Read Enable
        
        address_1 : in    std_logic_vector (ADDR_WIDTH-1 downto 0);  -- address_1 Input
        data1In    : in std_logic_vector (DATA_WIDTH-1 downto 0);  -- data_1 bi-directional
        data1Out    : out std_logic_vector (DATA_WIDTH-1 downto 0);  -- data_1 bi-directional
        we_1      : in    std_logic                                  -- Write Enable/Read Enable
    );
end entity dp_ram;

architecture rtl of dp_ram is
    ----------------Internal variables----------------
    constant RAM_DEPTH :integer := 2**ADDR_WIDTH;

    signal data_0_out :std_logic_vector (DATA_WIDTH-1 downto 0);
    signal data_1_out :std_logic_vector (DATA_WIDTH-1 downto 0);

    type RAM is array (integer range <>)of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal mem : RAM (0 to RAM_DEPTH-1)  := (others => (others => '0'));

begin
    ----------------Code Starts Here------------------
    -- Memory Write Block
    -- Write Operation : When we_0 = 1, cs_0 = 1
    MEM_WRITE:
    process (clkIn) begin
        if (rising_edge(clkIn)) then
            if ( we_0 = '1') then
                mem(to_integer(unsigned(address_0))) <= data0In;
            end if;
            if ( we_1 = '1') then
                mem(to_integer(unsigned(address_1))) <= data1In;
            end if;
        end if;
    end process;

--    -- Memory Read Block
--    MEM_READ_0:
--    process (clkIn) begin
--        if (rising_edge(clkIn)) then
--            if ( we_0 = '0') then
--                data0Out <= mem(to_integer(unsigned(address_0)));
--            else
--                data0Out <= (others=>'0');
--            end if;
--        end if;
--    end process;

--    -- Memory Read Block 1
--    MEM_READ_1:
--    process (clkIn) begin
--        if (rising_edge(clkIn)) then
--            if ( we_1 = '0' ) then
--                data1Out <= mem(to_integer(unsigned(address_1)));
--            else
--                data1Out <= (others=>'0');
--            end if;
--        end if;
--    end process;

    data0Out <= mem(to_integer(unsigned(address_0)));
    data1Out <= mem(to_integer(unsigned(address_1)));

end architecture rtl;