library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity for Flip_Flop_D (D Flip-Flop)
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
    process(Clk, Rst)
    begin
        if Rst = '1' then
            Q <= '0';
            Qp <= '1';
        elsif rising_edge(Clk) then
            Q <= D;
            Qp <= not D;
        end if;
    end process;
end Behavioral;

-- Testbench for Flip_Flop_D
entity TB is
end TB;

architecture Behavioral of TB is
    -- Signals for Flip-Flop and Testbench
    signal Clk, Rst, D : STD_LOGIC := '0';
    signal Q, Qp : STD_LOGIC;
begin

    -- Instantiate the Flip_Flop_D module
    uut: entity work.Flip_Flop_D
        port map (
            Clk => Clk,
            Rst => Rst,
            D => D,
            Q => Q,
            Qp => Qp
        );

    -- Clock generation: Period = 10ns
    process
    begin
        Clk <= '0';
        wait for 5 ns;
        Clk <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Initial condition
        D <= '1';
        Rst <= '0';
        wait for 100 ns;

        -- Apply reset
        Rst <= '1';
        wait for 60 ns;

        -- Change D input
        D <= '0';
        wait for 60 ns;

        D <= '1';
        wait for 60 ns;

        -- Deassert reset
        Rst <= '0';
        wait for 60 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
