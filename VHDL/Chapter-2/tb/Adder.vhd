library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Adder_ is
    Port (
        X : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : in  STD_LOGIC_VECTOR(3 downto 0);
        Z : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Adder_;

architecture Behavioral of Adder_ is
begin
    Z <= STD_LOGIC_VECTOR(unsigned(X) + unsigned(Y));
end Behavioral;
