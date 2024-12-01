library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port (
        X1 : in  STD_LOGIC;
        X2 : in  STD_LOGIC;
        X3 : in  STD_LOGIC;
        X4 : in  STD_LOGIC;
        S1 : in  STD_LOGIC;
        S2 : in  STD_LOGIC;
        Y  : out STD_LOGIC
    );
end Multiplexer;

architecture Behavioral of Multiplexer is
begin
    process(S1, S2, X1, X2, X3, X4)
    begin
        case (S1 & S2) is
            when "00" => Y <= X1;
            when "01" => Y <= X2;
            when "10" => Y <= X3;
            when "11" => Y <= X4;
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;
