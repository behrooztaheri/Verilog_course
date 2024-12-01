library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port (
        D       : in  STD_LOGIC;
        Clk     : in  STD_LOGIC;
        Q       : out STD_LOGIC;
        Q_prime : out STD_LOGIC
    );
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is
    signal temp_Q       : STD_LOGIC;
    signal temp_Q_prime : STD_LOGIC;
begin
    process(D, Clk)
    begin
        temp_Q       <= not ((not (D and Clk)) and temp_Q_prime);
        temp_Q_prime <= not ((not (not D and Clk)) and temp_Q);
    end process;
    
    Q       <= temp_Q;
    Q_prime <= temp_Q_prime;
end Behavioral;
