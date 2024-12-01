library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port (
        en : in  STD_LOGIC;
        X  : in  STD_LOGIC_VECTOR(1 downto 0);
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
begin
    process(en, X)
    begin
        if en = '0' then
            Y <= "0000";
        else
            case X is
                when "00" =>
                    Y <= "0001";
                when "01" =>
                    Y <= "0010";
                when "10" =>
                    Y <= "0100";
                when "11" =>
                    Y <= "1000";
                when others =>
                    Y <= "ZZZZ";  -- High impedance for invalid states
            end case;
        end if;
    end process;
end Behavioral;
