library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity for Flip_Flop_JK
entity TB2 is
end TB2;

architecture behavior of TB2 is

    -- Component declaration for Flip_Flop_JK
    component Flip_Flop_JK
        Port (
            Clk : in  STD_LOGIC;
            Rst : in  STD_LOGIC;
            J   : in  STD_LOGIC;
            K   : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qp  : out STD_LOGIC
        );
    end component;

    -- Signals for driving the component
    signal Clk : STD_LOGIC := '0';
    signal Rst : STD_LOGIC := '0';
    signal J   : STD_LOGIC := '0';
    signal K   : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
    signal Qp  : STD_LOGIC;

begin

    -- Instantiate the Flip_Flop_JK component
    U1: Flip_Flop_JK
        Port map (
            Clk => Clk,
            Rst => Rst,
            J => J,
            K => K,
            Q => Q,
            Qp => Qp
        );

    -- Process to generate clock and stimuli
    stimulus : process
    begin
        -- Initialize signals
        Rst <= '0';
        J   <= '1';
        K   <= '0';
        wait for 100 ns;

        -- Apply reset
        Rst <= '1';
        wait for 60 ns;

        -- Test different combinations of J and K
        J <= '0'; K <= '0';
        wait for 60 ns;

        J <= '1'; K <= '0';
        wait for 60 ns;

        J <= '0'; K <= '1';
        wait for 60 ns;

        J <= '1'; K <= '1';
        wait for 60 ns;

        -- Reset again
        Rst <= '0';
        wait for 60 ns;

        -- Finish the simulation
        wait;
    end process;

    -- Clock generation
    Clk <= not Clk after 5 ns;

end behavior;
