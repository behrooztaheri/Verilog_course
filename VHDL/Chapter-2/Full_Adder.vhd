library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Full_Adder is
    Port (
        X   : in  STD_LOGIC;
        Y   : in  STD_LOGIC;
        W   : in  STD_LOGIC;
        SUM : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    SUM <= STD_LOGIC_VECTOR(unsigned("0" & X) + unsigned("0" & Y) + unsigned("0" & W));
end Behavioral;
