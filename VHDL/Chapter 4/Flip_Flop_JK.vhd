library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Flip_Flop_JK (JK Flip-Flop)
entity Flip_Flop_JK is
    Port (
        Clk : in  STD_LOGIC;
        Rst : in  STD_LOGIC;
        J   : in  STD_LOGIC;
        K   : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qp  : out STD_LOGIC
    );
end Flip_Flop_JK;

architecture Behavioral of Flip_Flop_JK is
begin
    -- Process to describe the JK Flip-Flop behavior
    process(Clk, Rst)
    begin
        if Rst = '0' then
            Q <= '0';  -- Reset Q to 0 when Rst is active low
        elsif rising_edge(Clk) then
            -- JK Flip-Flop behavior based on the values of J and K
            if (J = '0' and K = '0') then
                Q <= Q;  -- No change
            elsif (J = '0' and K = '1') then
                Q <= '0';  -- Reset Q
            elsif (J = '1' and K = '0') then
                Q <= '1';  -- Set Q
            elsif (J = '1' and K = '1') then
                Q <= not Q;  -- Toggle Q
            end if;
        end if;
    end process;

    -- Qp is always the inverse of Q
    Qp <= not Q;

end Behavioral;
