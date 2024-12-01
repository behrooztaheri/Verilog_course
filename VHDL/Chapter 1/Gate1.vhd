library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_1 is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        C : in  STD_LOGIC;
        F : out STD_LOGIC;
        G : out STD_LOGIC
    );
end Gate_1;

architecture Behavioral of Gate_1 is
    signal XOR1 : STD_LOGIC;
    signal AND1 : STD_LOGIC;
    signal AND2 : STD_LOGIC;
begin
    XOR1 <= A xor B;
    F    <= XOR1 xor C;
    AND1 <= XOR1 and C;
    AND2 <= A and B;
    G    <= AND1 or AND2;
end Behavioral;
