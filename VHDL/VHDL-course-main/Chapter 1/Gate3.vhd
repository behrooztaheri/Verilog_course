library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_3 is
    Port (
        A : in  STD_LOGIC;
        S : out STD_LOGIC;
        C : out STD_LOGIC
    );
end Gate_3;

architecture Behavioral of Gate_3 is
    constant n : STD_LOGIC := '1';
    constant m : STD_LOGIC := '0';
begin
    S <= A xor n;
    C <= A and m;
end Behavioral;

