library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity for Flip_Flop_T (T-Flip Flop)
entity Flip_Flop_T is
    Port (
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;
        T   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        Qp  : out STD_LOGIC
    );
end Flip_Flop_T;

architecture Behavioral of Flip_Flop_T is
begin
    process(Clk, Rst)
    begin
        if Rst = '1' then
            Q <= '0';
            Qp <= '1';
        elsif rising_edge(Clk) then
            if T = '1' then
                Q <= not Q;
                Qp <= not Qp;
            end if;
        end if;
    end process;
end Behavioral;

-- Entity for Counter4
entity Counter4 is
    Port (
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;
        F   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Counter4;

architecture Behavioral of Counter4 is
    signal Qp : STD_LOGIC_VECTOR(3 downto 0);
    signal w1, w2 : STD_LOGIC;
begin
    -- AND gates logic
    w1 <= F(0) and F(1);
    w2 <= w1 and F(2);

    -- Flip-Flops instantiation
    U0: entity work.Flip_Flop_T
        port map (Clk => Clk, Rst => Rst, T => '1', Q => F(0), Qp => Qp(0));

    U1: entity work.Flip_Flop_T
        port map (Clk => Clk, Rst => Rst, T => F(0), Q => F(1), Qp => Qp(1));

    U2: entity work.Flip_Flop_T
        port map (Clk => Clk, Rst => Rst, T => w1, Q => F(2), Qp => Qp(2));

    U3: entity work.Flip_Flop_T
        port map (Clk => Clk, Rst => Rst, T => w2, Q => F(3), Qp => Qp(3));

end Behavioral;
