library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity IF_ELSE is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : out STD_LOGIC_VECTOR(7 downto 0)
    );
end IF_ELSE;

architecture Behavioral of IF_ELSE is
begin
    process(A)
    begin
        if unsigned(A) > 18 then
            B <= "00000101"; -- 8'd5
        elsif unsigned(A) > 10 then
            B <= "00000110"; -- 8'd6
        else
            B <= "00001010"; -- 8'd10
        end if;
    end process;
end Behavioral;
