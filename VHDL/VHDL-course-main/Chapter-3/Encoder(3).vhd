library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder is
    Port (
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        en : in  STD_LOGIC;
        Y : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Encoder;

architecture Behavioral of Encoder is
begin
    process(X, en)
    begin
        if en = '1' then
            case X is
                when "0001" => 
                    Y <= "00";   -- X = 4'b0001, Y = 0
                when "0010" => 
                    Y <= "01";   -- X = 4'b0010, Y = 1
                when "0100" => 
                    Y <= "10";   -- X = 4'b0100, Y = 2
                when "1000" => 
                    Y <= "11";   -- X = 4'b1000, Y = 3
                when others =>
                    Y <= "ZZ";   -- High-impedance if X doesn't match any case
            end case;
        else
            Y <= "ZZ";           -- High-impedance if enable is low
        end if;
    end process;
end Behavioral;
