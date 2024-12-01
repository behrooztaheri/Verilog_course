library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration
entity STM is
    Port (
        clk : in STD_LOGIC;     -- Clock input
        Rst : in STD_LOGIC;     -- Reset input (active low)
        Y   : out STD_LOGIC     -- Output
    );
end STM;

-- Architecture declaration
architecture Behavioral of STM is

    -- Declare a 2-bit state register
    signal State : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Initial state is "00"

begin

    -- Process to describe the state machine
    process(clk, Rst)
    begin
        if (Rst = '0') then  -- Asynchronous reset (active low)
            State <= "00";  -- Reset state to "00"
            Y <= '0';       -- Reset output Y
        elsif (rising_edge(clk)) then  -- On rising edge of clock
            case State is
                when "00" =>  -- State 0
                    State <= "01";  -- Move to state 1
                    Y <= '0';       -- Set output Y to 0
                when "01" =>  -- State 1
                    State <= "10";  -- Move to state 2
                    Y <= '1';       -- Set output Y to 1
                when "10" =>  -- State 2
                    State <= "00";  -- Move back to state 0
                    Y <= '0';       -- Set output Y to 0
                when others =>  -- Default case
                    State <= "00";  -- Should never reach here, but safe to handle
                    Y <= '0';
            end case;
        end if;
    end process;

end Behavioral;
