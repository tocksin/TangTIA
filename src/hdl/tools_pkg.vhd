/* -- @file tools_pkg.vhd
 *-- @brief tool package
 *-- @author Justin Davis
 *--
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
------------------------------------------------------------------------------*/

library ieee;       use ieee.std_logic_1164.all;
                    use ieee.numeric_std.all;
                    
package tools_pkg is

    subtype slv is std_logic_vector;
    subtype sl  is std_logic;

    constant SIM_INDENT         : string  := "    ";
    constant SIM_RETURN         : string  := LF & SIM_INDENT;  

    constant STRING_LENGTH      : natural := 20;

    type DirType              is (LEFT, RIGHT, UP, DOWN);  
    type memMapAccType        is (RW,RO,WO);  -- Memory map access type 

    subtype memMapStringType  is string(1 to STRING_LENGTH);
  
    type memMapRecordType     is record
        name    : memMapStringType;
        addr    : slv(15 downto 0);
        acc     : memMapAccType;
        init    : slv(15 downto 0);
    end record; 

    type memMapRecArrayType   is array (natural range <>) of memMapRecordType;
    type charArray            is array (integer range<>) of std_logic_vector(7 downto 0);

    type ramParaType is array (natural range <>) of std_logic_vector(7 downto 0);
    constant RAM_PARA_INIT  : ramParaType := (0 => x"00");

    -------------------------------------------------------------------------------
    -- Function prototypes
    -------------------------------------------------------------------------------
    -- String functions
    -- function toString( arg: slv )                return string;    
    -- function toString( arg: unsigned )           return string;    
    function nameResize(argument : string)       return string;
    function to_slv(str : string)                return slv;
    function to_chararray(str : string)          return charArray;
    function toUppercase(arg : character)        return character;
    function hexToBin(arg : character)           return string;
    function hexToBin(arg : string)              return string;

    function strResize (
        argument   : string;
        width      : natural;
        direction  : DirType := DOWN
    ) return string;

    -- Math/Vector functions
    function toSL(arg : character)               return sl;
    function log2
        (argument   : unsigned;
        direction   : DirType := DOWN
        ) return natural;
    function log2
        (argument   : natural;
        direction   : DirType := DOWN
        ) return natural;
    function mapDontCares  -- std_logic version
        (arg : sl; 
         match : sl := '0')  
         return sl;
    function mapDontCares -- std_logic_vector version
        (arg : slv;
         match : sl := '0')
         return slv;

    -- Memory map functions
    function accString(argument : memMapAccType) return string;
    function memRec
       (name    : memMapStringType;
        addr    : slv(15 downto 0);
        acc     : memMapAccType;
        init    : slv(15 downto 0) := x"0000") 
        return memMapRecordType;
    function memAddr
       (name    : string;
        memMap  : memMapRecArrayType)
        return slv;        
    function memIndex( 
        argument : string;
        memMap   : memMapRecArrayType) 
        return natural;

    -- BCD conversion (two digits)
    function shiftadd3(binary : slv) return slv;
    function toBCD(binary : slv) return slv;

--------------------------------------------------------------------------------
-- Procedure prototypes
--------------------------------------------------------------------------------
procedure FF    -- for std_logic
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  sl; -- FF input 
     signal   oQ         : out sl; -- FF output
     constant INIT       : in  sl := '0'; -- initial and reset value of output
     constant en         : in  sl := '1');  -- optional enable 

procedure FF    -- for std_logic_vector
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  slv; -- FF input 
     signal   oQ         : out slv; -- FF output
     constant INIT       : in  slv; -- initial and reset value of output
     constant en         : in  sl := '1');

procedure FF    -- for unsigned vector
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  unsigned; -- FF input 
     signal   oQ         : out unsigned; -- FF output
     constant INIT       : in  unsigned; -- initial and reset value of output
     constant en         : in  sl := '1');  -- optional enable 
     
procedure onePulse
       (signal   clk        : in sl;
        signal   rst        : in sl;
        signal   newInput   : in sl;
        signal   delayed    : inout sl;
        signal   pulse      : inout sl;
        constant edge       : in sl := '1');

end tools_pkg;

-------------------------------------------------------------------------------
-- Package Body
-------------------------------------------------------------------------------
package body tools_pkg is

    -------------------------------------------------------------------------------
    -- strResize - sets length of string size, pads with spaces
    -------------------------------------------------------------------------------
    function strResize
        (argument  : string;
        width      : natural;
        direction  : DirType := DOWN
        ) return string is
    begin
        case direction is
            when LEFT | DOWN =>
                if (argument'length < width) then 
                    return (1 to (width-argument'length) => ' ') & argument; -- extend
                else
                    return argument(argument'right-width+1 to argument'right); -- truncate
                end if;
            when RIGHT | UP =>
                if (argument'length < width) then
                    return argument & (1 to (width-argument'length) => ' '); -- extend
                else
                    return argument(argument'left to argument'left+width-1); -- truncate
                end if;
         end case;
    end function strResize;

    -------------------------------------------------------------------------------
    -- toString - substitutes VHDL 2008 call which is not implemented in Vivado
    -------------------------------------------------------------------------------
    -- function toString ( arg: slv ) return string is
        -- variable rtn  : string(1 to arg'length) := (others => NUL);
        -- variable cnt  : integer := 1;
    -- begin
        -- for i in arg'range loop
            -- rtn(cnt) := std_logic'image(arg((i)))(2);
            -- cnt := cnt + 1;
        -- end loop;
        -- return rtn;
    -- end function toString;

    -- function toString ( arg: unsigned ) return string is
    -- begin
        -- return toString(slv(arg));
    -- end function toString;

    -------------------------------------------------------------------------------
    -- log2 - returns log base 2 of given number
    --        can be used to determine how many bits needed for a given number
    -------------------------------------------------------------------------------
    function log2
        (argument   : unsigned;
        direction   : DirType := DOWN
        ) return natural is
        alias arg : unsigned(argument'length-1 downto 0) is argument;
    begin
        for i in arg'range loop
            if (arg(i) = '1') then
                case direction is
                    when DOWN | LEFT => return i;
                    when UP | RIGHT  => return i+1;
                end case;
            end if;
        end loop;
        return 0;
    end function log2;

    function log2
        (argument   : natural;
        direction   : DirType := DOWN
        ) return natural is
        variable convert : unsigned(31 downto 0) := to_unsigned(argument, 32);
    begin
        return log2(convert, direction);
    end function log2;    
    
    -------------------------------------------------------------------------------
    -- accString - returns string for the specified enumerated access type
    -------------------------------------------------------------------------------
    function accString(argument : memMapAccType) return string is
    begin
        case argument is
            when RO => return "RO";
            when RW => return "RW";
            when WO => return "WO";
            when others => return "UNKNOWN";
        end case;
    end function accString;
    
    -------------------------------------------------------------------------------
    -- nameResize - resizes the string to match the name length of the memMapStringType
    -------------------------------------------------------------------------------
    function nameResize(
        argument : string
        ) return string is
    begin
        return strResize(argument, STRING_LENGTH, LEFT);
    end function nameResize;

    -------------------------------------------------------------------------------
    -- to_slv - binary string to one std_logic_vector in 8-bit format using character'pos(c)
    -------------------------------------------------------------------------------
    function to_slv(str : string) return slv is
--      alias str_norm : string(str'length downto 1) is str;
--      variable res_v : std_logic_vector(8 * str'length - 1 downto 0);
--    begin
--      for idx in str_norm'range loop
--        res_v(8 * idx - 1 downto 8 * idx - 8) := 
--          std_logic_vector(to_unsigned(character'pos(str_norm(idx)), 8));
--      end loop;
--      return res_v;
        
        variable rtnVar : slv   (str'right-1 downto   0); -- 15 downto 0
--        variable rtnVar : slv   (len-1 downto   0); -- 15 downto 0
    begin
        for i in rtnVar'range loop
            rtnVar(i) := toSL(str(str'right-i));
        end loop;
        return rtnVar;
    end function;
    
    -------------------------------------------------------------------------------
    -- toSL - character to one std_logic using a case statement
    -------------------------------------------------------------------------------
    function toSL
        (arg    : character)
        return sl is
        variable returnVar : sl;
    begin
        case arg is
            when  '0'   => returnVar := '0';
            when  '1'   => returnVar := '1';
            when  '-'   => returnVar := '-';
            when  'Z'   => returnVar := 'Z';
            when  'W'   => returnVar := 'W';
            when  'L'   => returnVar := 'L';
            when  'H'   => returnVar := 'H';
            when  'U'   => returnVar := 'U';
            when  'X'   => returnVar := 'X';
            when others => returnVar := 'X';
                -- synthesis translate_off ---------------------------------------------
                assert FALSE -----------------------------------------------------------
                    report "toSL: Invalid type conversion of (" & arg & ") to std_logic" & SIM_RETURN;
--                    severity FAILURE; ------------------------------------------------------
                -- synthesis translate_on ----------------------------------------------
        end case;
        return returnVar;
    end function toSL;
    
    -------------------------------------------------------------------------------
    -- to_chararray - string to array of std_logic_vectors in 8-bit format using character'pos(c)
    -------------------------------------------------------------------------------
    function to_chararray(str : string) return charArray is
      alias str_norm : string(1 to str'length) is str;
      variable res_v : charArray(str'left-1 to str'right-1);
    begin
      for idx in str_norm'range loop
        res_v(idx-1) := std_logic_vector(to_unsigned(character'pos(str_norm(idx)), 8));
      end loop;
      return res_v;
    end function;
    
    -------------------------------------------------------------------------------
    -- hexToBin - convert a hexidecimal character into a valid slv string
    -------------------------------------------------------------------------------
    function hexToBin
        (arg     : character)                   -- input characters to convert
         return    string is                    -- converted string
   -----------------------------------------------------------------------------
        variable rtnVar : string(1 to 4) := (others=>'X');
    begin
        case toUppercase(arg) is
            when  '0'   => rtnVar := "0000";
            when  '1'   => rtnVar := "0001";
            when  '2'   => rtnVar := "0010";
            when  '3'   => rtnVar := "0011";
            when  '4'   => rtnVar := "0100";
            when  '5'   => rtnVar := "0101";
            when  '6'   => rtnVar := "0110";
            when  '7'   => rtnVar := "0111";
            when  '8'   => rtnVar := "1000";
            when  '9'   => rtnVar := "1001";
            when  'A'   => rtnVar := "1010";
            when  'B'   => rtnVar := "1011";
            when  'C'   => rtnVar := "1100";
            when  'D'   => rtnVar := "1101";
            when  'E'   => rtnVar := "1110";
            when  'F'   => rtnVar := "1111";
            when  '-'   => rtnVar := "----";
            -------------------------------- below should be used for simulation only
            when  'U'   => rtnVar := "UUUU";
            when  'X'   => rtnVar := "XXXX";
            when  'Z'   => rtnVar := "ZZZZ";
            when  'W'   => rtnVar := "WWWW";
            when  'L'   => rtnVar := "LLLL";
            when  'H'   => rtnVar := "HHHH";
            when others => rtnVar := (others=>'X');
                report "hexToBin: Invalid conversion attempted of (" & arg & ") to std_logic" & SIM_RETURN;
--                severity FAILURE;
        end case;
        return rtnVar;
    end function hexToBin;

    function hexToBin
        (arg    : string)
        return string is
        
        constant normal    : string(1 to arg'length)   := arg;
        variable returnVar : string(1 to arg'length*4) := (others=>'X');
    begin
        for i in normal'range loop
            returnVar(i*4-3 to i*4) := hexToBin(normal(i));
        end loop;
        return returnVar;
    end function hexToBin;

    -------------------------------------------------------------------------------
    -- toUppercase - convert lowercase character into uppercase
    -------------------------------------------------------------------------------
    function toUppercase
        (arg    : character)        -- input character
        return   character is       -- return uppercase character
    begin
        case arg is
            when 'a' to 'z'   => return character'val(character'pos(arg)-32); -- convert to ASCII for convertion
            when others       => return arg;
        end case;
    end function toUppercase;

    -------------------------------------------------------------------------------
    -- mapDontCares - change any dont care value to the value in match
    --                all other values are just copied over
    -------------------------------------------------------------------------------
    function mapDontCares  -- std_logic version
        (arg : sl;
         match : sl  := '0')
         return sl is
    begin
        if (std_match(arg, match)) then return match;
        else return arg;
        end if;
    end function mapDontCares;

    function mapDontCares -- std_logic_vector version
        (arg : slv;
         match : sl  := '0')
         return slv is
        variable returnVector : slv(arg'range); 
    begin
        for i in arg'range loop
            returnVector(i) := mapDontCares(arg(i),match);
        end loop;
        return returnVector;
    end function mapDontCares;

-------------------------------------------------------------------------------
-- onePulse - output one clock pulse until input signal returns to non-edge level
-- EDGE = '1' => RISING-EDGE DETECTION ;  '0' => FALLING-EDGE DETECTION    
-------------------------------------------------------------------------------
    procedure onePulse
       (signal   clk        : in sl;
        signal   rst        : in sl;
        signal   newInput   : in sl;
        signal   delayed    : inout sl;
        signal   pulse      : inout sl;
        constant edge       : in sl := '1') is  
        variable tempPulse  : sl;
    begin
        if (rst = '1') then
            delayed <= '0';
        elsif rising_edge(clk) then
            delayed <= edge xor newInput; 
        end if;
        
        pulse <= (not(edge) and not(newInput) and delayed) or      -- FALLING-EDGE DETECTION
                 (    edge  and     newInput  and delayed);        -- RISING-EDGE  DETECTION   

    end procedure onePulse;

    -------------------------------------------------------------------------------
    -- memRec - return memory record given elements.  Synthesizable for constants.
    --          Useful if some elements are not needed.  Cleaner instantiation. 
    -------------------------------------------------------------------------------
    function memRec
       (name    : string;
        addr    : slv(15 downto 0);
        acc     : memMapAccType;
        init    : slv(15 downto 0) := x"0000") 
        return memMapRecordType is
        variable rtnVar : memMapRecordType;
    begin
        rtnVar.name := nameResize(name);
        rtnVar.addr := addr;
        rtnVar.acc  := acc;
        rtnVar.init := init;
        return rtnVar;
    end function memRec;

    -------------------------------------------------------------------------------
    -- memAddr - returns the address of the name string in the memory map
    -------------------------------------------------------------------------------
    function memAddr
       (name    : string;
        memMap  : memMapRecArrayType)
        return slv is
        variable rtnVar : slv(15 downto 0);  
    begin
        rtnVar := memMap(memIndex(name,memMap)).addr;
        return rtnVar;
    end function memAddr;
    
    -------------------------------------------------------------------------------
    -- memIndex - returns the index of the string in the memory map
    -------------------------------------------------------------------------------
    function memIndex( 
        argument : string;
        memMap   : memMapRecArrayType
    ) return natural is
    begin
        for m in memMap'range loop
            if (nameResize(argument)  = memMap(m).name) then 
                return m;
            end if;
        end loop;
        return -1;  -- this causes an error when indexing to indicate no entry matches
    end function memIndex;

-------------------------------------------------------------------------------
-- FF - rising-edge clocked flip-flop for one bit std_logic
-------------------------------------------------------------------------------
procedure FF 
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  sl; -- FF input 
     signal   oQ         : out sl; -- FF output
     constant INIT       : in  sl := '0'; -- initial and reset value of output
     constant en         : in  sl := '1'  -- optional enable 
     ) is
begin
  if (iRst = '1') then
    oQ <= INIT;
  elsif rising_edge(iClk) then
    if (en = '1') then 
        oQ <= iD;
    end if;
  end if;
end procedure FF;

-------------------------------------------------------------------------------
-- FF - rising-edge clocked flip-flop for std_logic_vector
-------------------------------------------------------------------------------
procedure FF 
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  slv; -- FF input 
     signal   oQ         : out slv; -- FF output
     constant INIT       : in  slv; -- initial and reset value of output
     constant en         : in  sl := '1'  -- optional enable 
     ) is
begin
  if (iRst = '1') then
    oQ <= INIT;
  elsif rising_edge(iClk) then
    if (en = '1') then 
        oQ <= iD;
    end if;
  end if;
end procedure FF;

-------------------------------------------------------------------------------
-- FF - rising-edge clocked flip-flop for unsigned vector
-------------------------------------------------------------------------------
procedure FF 
    (signal   iClk       : in  sl;
     signal   iRst       : in  sl;
     constant iD         : in  unsigned; -- FF input 
     signal   oQ         : out unsigned; -- FF output
     constant INIT       : in  unsigned; -- initial and reset value of output
     constant en         : in  sl := '1'  -- optional enable 
     ) is
begin
  if (iRst = '1') then
    oQ <= INIT;
  elsif rising_edge(iClk) then
    if (en = '1') then 
        oQ <= iD;
    end if;
  end if;
end procedure FF;

-------------------------------------------------------------------------------
-- shiftAdd3 - part of the binary to bcd conversion process
--           - if the input is greater than 4, then add 3
-------------------------------------------------------------------------------
function shiftAdd3(binary : slv) return slv is
variable vbinary : slv(3 downto 0);
variable rtnVar : slv(3 downto 0);
begin
    vbinary := binary;
    case vbinary is
        when "0000" => rtnVar := "0000"; -- no change
        when "0001" => rtnVar := "0001"; -- no change
        when "0010" => rtnVar := "0010"; -- no change
        when "0011" => rtnVar := "0011"; -- no change
        when "0100" => rtnVar := "0100"; -- no change
        when "0101" => rtnVar := "1000"; -- add 3
        when "0110" => rtnVar := "1001"; -- add 3
        when "0111" => rtnVar := "1010"; -- add 3
        when "1000" => rtnVar := "1011"; -- add 3
        when "1001" => rtnVar := "1100"; -- add 3
        when others => rtnVar := "1111"; -- error
    end case;
    return rtnVar;
end function shiftAdd3;

-------------------------------------------------------------------------------
-- toBCD - converts binary to binary-coded-decimal - up to four digits
--       - input maximum value of 9999 (14 bits)
-------------------------------------------------------------------------------
function toBCD(binary : slv) return slv is
    variable rtnVar     : slv(15 downto 0) := (others => '0');
    variable arg    : slv(27 downto 0) := (others => '0');
begin
    arg(binary'left+1 downto 1) := binary;
    for i in 0 to 10 loop
        arg(15 downto 12) := shiftAdd3(arg(15 downto 12));
        arg(19 downto 16) := shiftAdd3(arg(19 downto 16));
        arg(23 downto 20) := shiftAdd3(arg(23 downto 20));
        arg(27 downto 24) := shiftAdd3(arg(27 downto 24));
        arg(27 downto 1) := arg(26 downto 0);
    end loop;
    rtnVar := arg(27 downto 12);
    return rtnVar;
end function toBCD;

end tools_pkg;
