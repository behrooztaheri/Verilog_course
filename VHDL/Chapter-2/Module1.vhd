library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Minest module
entity Minest is
    Port (
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : in  STD_LOGIC_VECTOR(3 downto 0);
        T : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Minest;

architecture Behavioral of Minest is
begin
    T <= ('0' & X) - ('0' & Y); -- '0' is concatenated to make 5-bit vectors for subtraction
end Behavioral;

-- MNST module
entity MNST is
    Port (
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : in  STD_LOGIC_VECTOR(3 downto 0);
        H : out STD_LOGIC
    );
end MNST;

architecture Behavioral of MNST is
    signal T : STD_LOGIC_VECTOR(4 downto 0);
begin
    M: entity work.Minest
        port map (
            X => X,
            Y => Y,
            T => T
        );

    H <= Y(0) or T(2);
end Behavioral;
