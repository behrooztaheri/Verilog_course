library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Full_Adder1 Entity
entity Full_Adder1 is
    Port (
        X : in  STD_LOGIC;
        Y : in  STD_LOGIC;
        Z : in  STD_LOGIC;
        S : out STD_LOGIC;
        C : out STD_LOGIC
    );
end Full_Adder1;

architecture Behavioral of Full_Adder1 is
    signal L, P, Q : STD_LOGIC;
begin
    process(X, Y, Z)
    begin
        L <= X XOR Y;
        P <= L AND Z;
        Q <= X AND Y;
        S <= L XOR Z;
        C <= P OR Q;
    end process;
end Behavioral;

-- Full_Adder2 Entity
entity Full_Adder2 is
    Port (
        X : in  STD_LOGIC;
        Y : in  STD_LOGIC;
        Z : in  STD_LOGIC;
        S : out STD_LOGIC;
        C : out STD_LOGIC
    );
end Full_Adder2;

architecture Behavioral of Full_Adder2 is
begin
    process(X, Y, Z)
        variable Sum : STD_LOGIC_VECTOR(1 downto 0);
    begin
        Sum := ('0' & X) + ('0' & Y) + ('0' & Z);
        S <= Sum(0);
        C <= Sum(1);
    end process;
end Behavioral;
