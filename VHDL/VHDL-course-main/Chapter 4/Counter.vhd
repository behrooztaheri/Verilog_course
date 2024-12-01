library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Counter1 Entity: Counts on the positive edge of Clk
entity Counter1 is
    Port (
        Clk : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Counter1;

architecture Behavioral of Counter1 is
    signal Count : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            Count <= Count + 1;
        end if;
    end process;
    Y <= Count;
end Behavioral;

-- Counter2 Entity: Counts on the negative edge of Clk
entity Counter2 is
    Port (
        Clk : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Counter2;

architecture Behavioral of Counter2 is
    signal Count : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process(Clk)
    begin
        if falling_edge(Clk) then
            Count <= Count + 1;
        end if;
    end process;
    Y <= Count;
end Behavioral;
