library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Full_Adder module
entity Full_Adder is
    Port (
        X : in  STD_LOGIC;
        Y : in  STD_LOGIC;
        K : in  STD_LOGIC;
        N : out STD_LOGIC;
        G : out STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    N <= (X xor Y) xor K;
    G <= ((X xor Y) and K) or (X and Y);
end Behavioral;

-- Adder_4bit1 module
entity Adder_4bit1 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        F : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Adder_4bit1;

architecture Behavioral of Adder_4bit1 is
    signal C : STD_LOGIC_VECTOR(3 downto 0);
begin
    C(0) <= '0';

    FA1: entity work.Full_Adder
        port map (
            X => A(0),
            Y => B(0),
            K => C(0),
            N => F(0),
            G => C(1)
        );

    FA2: entity work.Full_Adder
        port map (
            X => A(1),
            Y => B(1),
            K => C(1),
            N => F(1),
            G => C(2)
        );

    FA3: entity work.Full_Adder
        port map (
            X => A(2),
            Y => B(2),
            K => C(2),
            N => F(2),
            G => C(3)
        );

    FA4: entity work.Full_Adder
        port map (
            X => A(3),
            Y => B(3),
            K => C(3),
            N => F(3),
            G => F(4)
        );

end Behavioral;

-- Adder_4bit2 module
entity Adder_4bit2 is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin   : in  STD_LOGIC;
        F     : out STD_LOGIC_VECTOR(3 downto 0);
        Carry : out STD_LOGIC
    );
end Adder_4bit2;

architecture Behavioral of Adder_4bit2 is
    signal C : STD_LOGIC_VECTOR(3 downto 0);
begin

    FA1: entity work.Full_Adder
        port map (
            X => A(0),
            Y => B(0),
            K => Cin,
            N => F(0),
            G => C(1)
        );

    FA2: entity work.Full_Adder
        port map (
            X => A(1),
            Y => B(1),
            K => C(1),
            N => F(1),
            G => C(2)
        );

    FA3: entity work.Full_Adder
        port map (
            X => A(2),
            Y => B(2),
            K => C(2),
            N => F(2),
            G => C(3)
        );

    FA4: entity work.Full_Adder
        port map (
            X => A(3),
            Y => B(3),
            K => C(3),
            N => F(3),
            G => Carry
        );

end Behavioral;
