library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Test Entity
entity Test is
    Port (
        en     : in  STD_LOGIC;
        Start  : in  STD_LOGIC;
        X      : in  STD_LOGIC_VECTOR(1 downto 0);
        F      : out STD_LOGIC_VECTOR(3 downto 0);
        FADD   : out STD_LOGIC
    );
end Test;

architecture Behavioral of Test is
    signal Y : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(en, Start, X)
    begin
        -- Decoder logic
        if en = '0' then
            Y <= "0000";
        elsif X = "00" then
            Y <= "0001";
        elsif X = "01" then
            Y <= "0010";
        elsif X = "10" then
            Y <= "0100";
        elsif X = "11" then
            Y <= "1000";
        else
            Y <= "ZZZZ"; -- High impedance for undefined cases
        end if;

        -- Conditional assignment for F based on Start signal
        if Start = '1' then
            F <= Y;
        else
            F <= "0000";
        end if;

        -- FADD logic
        FADD <= F(0) AND F(1) AND F(2) AND F(3);
    end process;
end Behavioral;
