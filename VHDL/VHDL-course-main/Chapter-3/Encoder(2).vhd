library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Encoder1 Entity
entity Encoder1 is
    Port (
        X   : in  STD_LOGIC_VECTOR(3 downto 0);
        en  : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Encoder1;

architecture Behavioral of Encoder1 is
begin
    process(X, en)
    begin
        case X is
            when "0001" =>
                if en = '1' then
                    Y <= "00"; -- Y = 0
                else
                    Y <= "ZZ"; -- High impedance
                end if;
            when "0010" =>
                if en = '1' then
                    Y <= "01"; -- Y = 1
                else
                    Y <= "ZZ";
                end if;
            when "0100" =>
                if en = '1' then
                    Y <= "10"; -- Y = 2
                else
                    Y <= "ZZ";
                end if;
            when "1000" =>
                if en = '1' then
                    Y <= "11"; -- Y = 3
                else
                    Y <= "ZZ";
                end if;
            when others =>
                Y <= "ZZ"; -- High impedance for undefined inputs
        end case;
    end process;
end Behavioral;

-- Encoder2 Entity
entity Encoder2 is
    Port (
        X   : in  STD_LOGIC_VECTOR(3 downto 0);
        en  : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Encoder2;

architecture Behavioral of Encoder2 is
begin
    process(X, en)
    begin
        case (en & X) is
            when "10001" => 
                Y <= "00"; -- Y = 0
            when "10010" => 
                Y <= "01"; -- Y = 1
            when "10100" => 
                Y <= "10"; -- Y = 2
            when "11000" => 
                Y <= "11"; -- Y = 3
            when others =>
                Y <= "ZZ"; -- High impedance for undefined cases
        end case;
    end process;
end Behavioral;

-- Encoder3 Entity
entity Encoder3 is
    Port (
        X   : in  STD_LOGIC_VECTOR(3 downto 0);
        en  : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Encoder3;

architecture Behavioral of Encoder3 is
begin
    process(X, en)
    begin
        if en = '1' then
            case X is
                when "0001" => 
                    Y <= "00"; -- Y = 0
                when "0010" => 
                    Y <= "01"; -- Y = 1
                when "0100" => 
                    Y <= "10"; -- Y = 2
                when "1000" => 
                    Y <= "11"; -- Y = 3
                when others =>
                    Y <= "ZZ"; -- High impedance for undefined inputs
            end case;
        else
            Y <= "ZZ"; -- High impedance when enable is low
        end if;
    end process;
end Behavioral;
