library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port (
        X1 : in  STD_LOGIC_VECTOR(7 downto 0);
        X2 : in  STD_LOGIC_VECTOR(7 downto 0);
        X3 : in  STD_LOGIC_VECTOR(7 downto 0);
        X4 : in  STD_LOGIC_VECTOR(7 downto 0);
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        Y  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Multiplexer;

architecture Behavioral of Multiplexer is
begin
    process(S, X1, X2, X3, X4)
    begin
        case S is
            when "00" => Y <= X1;
            when "01" => Y <= X2;
            when "10" => Y <= X3;
            when "11" => Y <= X4;
            when others => Y <= (others => '0');
        end case;
    end process;
end Behavioral;
