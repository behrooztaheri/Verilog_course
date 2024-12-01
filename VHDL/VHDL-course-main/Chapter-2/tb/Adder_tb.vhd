library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB is
end TB;

architecture sim of TB is
    -- Declare signals equivalent to the input and output ports
    signal X : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(3 downto 0);
    signal Z : STD_LOGIC_VECTOR(4 downto 0);

    -- Instantiate the Adder component (assumes Adder component is defined separately)
    component Adder
        Port ( X : in STD_LOGIC_VECTOR(3 downto 0);
               Y : in STD_LOGIC_VECTOR(3 downto 0);
               Z : out STD_LOGIC_VECTOR(4 downto 0));
    end component;

begin
    UUT: Adder port map (X => X, Y => Y, Z => Z);

    process
    begin
        -- Initialize test cases
        X <= "1000"; -- 4'd8
        Y <= "0011"; -- 4'd3
        wait for 50 ns;

        X <= "0100"; -- 4'd4
        Y <= "0100"; -- 4'd4
        wait for 20 ns;

        X <= "0011"; -- 4'd3
        Y <= "0111"; -- 4'd7
        wait for 69 ns;

        X <= "0010"; -- 4'd2
        Y <= "0101"; -- 4'd5
        wait for 20 ns;

        -- End simulation
        wait;
    end process;

end sim;
