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
    signal Y_internal : STD_LOGIC := '0';  -- Internal signal for output Y

begin

    -- Process to describe the state machine with reset
    process(clk, Rst)
    begin
        if (Rst = '0') then  -- Asynchronous reset (active low)
            State <= "00";  -- Reset state to "00"
        elsif (rising_edge(clk)) then  -- On rising edge of clock
            case State is
                when "00" =>  -- State 0
                    State <= "01";  -- Move to state 1
                when "01" =>  -- State 1
                    State <= "10";  -- Move to state 2
                when "10" =>  -- State 2
                    State <= "00";  -- Move back to state 0
                when others =>  -- Default case
                    State <= "00";  -- Should never reach here, but safe to handle
            end case;
        end if;
    end process;

    -- Process to set the output Y based on the state
    process(State)
    begin
        case State is
            when "00" =>  -- State 0
                Y_internal <= '0';
            when "01" =>  -- State 1
                Y_internal <= '0';
            when "10" =>  -- State 2
                Y_internal <= '1';
            when others =>  -- Default case
                Y_internal <= '0';
        end case;
    end process;

    -- Assign internal signal to output
    Y <= Y_internal;

end Behavioral;
