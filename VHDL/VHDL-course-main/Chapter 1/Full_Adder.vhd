library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        X : in  STD_LOGIC;
        Y : in  STD_LOGIC;
        W : in  STD_LOGIC;
        S : out STD_LOGIC;
        C : out STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    S <= (X xor Y) xor W;
    C <= ((X xor Y) and W) or (X and Y);
end Behavioral;
