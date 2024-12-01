library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Multi_8_bit is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        C : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Multi_8_bit;

architecture Behavioral of Multi_8_bit is
begin
    C <= STD_LOGIC_VECTOR(unsigned(A) * unsigned(B));
end Behavioral;
