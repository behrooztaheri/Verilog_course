library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Adder module
entity Adder is
    Port (
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : in  STD_LOGIC_VECTOR(3 downto 0);
        F : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Adder;

architecture Behavioral of Adder is
begin
    F <= ('0' & X) + ('0' & Y);
end Behavioral;

-- NewAdder module
entity NewAdder is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        C : in  STD_LOGIC_VECTOR(3 downto 0);
        D : in  STD_LOGIC_VECTOR(3 downto 0);
        E : in  STD_LOGIC_VECTOR(3 downto 0);
        F : in  STD_LOGIC_VECTOR(3 downto 0);

        G : out STD_LOGIC_VECTOR(4 downto 0);
        H : out STD_LOGIC_VECTOR(4 downto 0);
        K : out STD_LOGIC_VECTOR(4 downto 0)
    );
end NewAdder;

architecture Structural of NewAdder is
    component Adder
        Port (
            X : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : in  STD_LOGIC_VECTOR(3 downto 0);
            F : out STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;

    signal G_internal : STD_LOGIC_VECTOR(4 downto 0);
    signal H_internal : STD_LOGIC_VECTOR(4 downto 0);
    signal K_internal : STD_LOGIC_VECTOR(4 downto 0);

begin
    U1: Adder port map (X => A, Y => B, F => G_internal);
    U2: Adder port map (X => C, Y => D, F => H_internal);
    U3: Adder port map (X => E, Y => F, F => K_internal);

    G <= G_internal;
    H <= H_internal;
    K <= K_internal;
end Structural;
