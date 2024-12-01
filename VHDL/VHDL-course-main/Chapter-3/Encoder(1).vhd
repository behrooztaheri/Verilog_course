library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule is
    Port (
        X    : in  STD_LOGIC_VECTOR(3 downto 0);
        en   : in  STD_LOGIC;
        Y1   : out STD_LOGIC_VECTOR(1 downto 0);
        Y2   : out STD_LOGIC_VECTOR(1 downto 0);
        Y3   : out STD_LOGIC_VECTOR(1 downto 0)
    );
end TopModule;

architecture Structural of TopModule is
    -- Component declarations
    component Encoder1
        Port (
            X   : in  STD_LOGIC_VECTOR(3 downto 0);
            en  : in  STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component Encoder2
        Port (
            X   : in  STD_LOGIC_VECTOR(3 downto 0);
            en  : in  STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component Encoder3
        Port (
            X   : in  STD_LOGIC_VECTOR(3 downto 0);
            en  : in  STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

begin
    -- Instantiate Encoder1
    U1: Encoder1
        port map (
            X => X,
            en => en,
            Y => Y1
        );

    -- Instantiate Encoder2
    U2: Encoder2
        port map (
            X => X,
            en => en,
            Y => Y2
        );

    -- Instantiate Encoder3
    U3: Encoder3
        port map (
            X => X,
            en => en,
            Y => Y3
        );
end Structural;
