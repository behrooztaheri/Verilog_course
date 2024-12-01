library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Sum_4bit is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        C : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Sum_4bit;

architecture Behavioral of Sum_4bit is
begin
    C <= STD_LOGIC_VECTOR(unsigned(A) + unsigned(B));
end Behavioral;
