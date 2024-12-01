library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Flip_Flop_D (D Flip-Flop)
entity Flip_Flop_D is
    Port (
        Clk : in  STD_LOGIC;
        Rst : in  STD_LOGIC;
        D   : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qp  : out STD_LOGIC
    );
end Flip_Flop_D;

architecture Behavioral of Flip_Flop_D is
begin
    -- Process to describe the flip-flop behavior
    process(Clk, Rst)
    begin
        if Rst = '0' then
            Q <= '0';  -- Reset Q to 0 when Rst is active low
        elsif rising_edge(Clk) then
            Q <= D;    -- Set Q to D on rising edge of Clk
        end if;
    end process;

    -- Qp is always the inverse of Q
    Qp <= not Q;

end Behavioral;
