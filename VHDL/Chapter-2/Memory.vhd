library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Memory is
    Port (
        Din      : in  STD_LOGIC_VECTOR(7 downto 0);
        Address  : in  STD_LOGIC_VECTOR(11 downto 0);
        Read     : in  STD_LOGIC;
        Write    : in  STD_LOGIC;
        Dout     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Memory;

architecture Behavioral of Memory is
    type memory_array is array (0 to 4095) of STD_LOGIC_VECTOR(7 downto 0);
    signal MEM : memory_array := (others => (others => '0'));

begin
    process
    begin
        MEM(0) <= "00000101"; -- Equivalent to 5
        MEM(86) <= "00011000"; -- Equivalent to 24
        MEM(4065) <= "00111100"; -- Equivalent to 60
        wait;
    end process;

    Dout <= MEM(to_integer(unsigned(Address))) when (Read = '1') else (others => 'Z');

    process(Din, Address, Write)
    begin
        if (Write = '1') then
            MEM(to_integer(unsigned(Address))) <= Din;
        end if;
    end process;
end Behavioral;
