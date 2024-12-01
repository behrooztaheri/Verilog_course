library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Gate_2 is
    Port (
        A     : in  STD_LOGIC;
        B     : in  STD_LOGIC;
        C     : in  STD_LOGIC;
        F     : out STD_LOGIC;
        G     : out STD_LOGIC;
        Times : out STD_LOGIC;
        Sums  : out STD_LOGIC
    );
end Gate_2;

architecture Behavioral of Gate_2 is
    signal XOR1 : STD_LOGIC;
    signal AND1 : STD_LOGIC;
    signal AND2 : STD_LOGIC;
begin
    XOR1 <= A xor B;
    F    <= XOR1 xor C;
    AND1 <= XOR1 and C;
    AND2 <= A and B;
    G    <= AND1 or AND2;

    Times <= A and B;
    Sums  <= XOR1 or AND1; -- Using OR to represent the addition
end Behavioral;
