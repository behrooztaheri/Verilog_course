library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Flip_Flop_T (T Flip-Flop)
entity Flip_Flop_T is
    Port (
        Clk : in  STD_LOGIC;
        Rst : in  STD_LOGIC;
        T   : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qp  : out STD_LOGIC
    );
end Flip_Flop_T;

architecture Behavioral of Flip_Flop_T is
begin
    -- Process to describe the T Flip-Flop behavior
    process(Clk, Rst)
    begin
        if Rst = '0' then
            Q <= '0';  -- Reset Q to 0 when Rst is active low
        elsif rising_edge(Clk) then
            if T = '0' then
                Q <= Q;  -- No change
            else
                Q <= not Q;  -- Toggle Q
            end if;
        end if;
    end process;

    -- Qp is always the inverse of Q
    Qp <= not Q;

end Behavioral;
