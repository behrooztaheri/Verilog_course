library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_Flip_Flop is
    Port (
        J       : in  STD_LOGIC;
        K       : in  STD_LOGIC;
        Clk     : in  STD_LOGIC;
        Q       : out STD_LOGIC;
        Q_prime : out STD_LOGIC
    );
end JK_Flip_Flop;

architecture Behavioral of JK_Flip_Flop is
    signal R, S : STD_LOGIC;
    signal temp_Q, temp_Q_prime : STD_LOGIC;
begin
    R <= not (J and Clk and temp_Q_prime);
    S <= not (K and Clk and temp_Q);

    temp_Q       <= not (R and temp_Q_prime);
    temp_Q_prime <= not (S and temp_Q);

    Q       <= temp_Q;
    Q_prime <= temp_Q_prime;
end Behavioral;
