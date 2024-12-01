library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity Declaration
entity STM is
    Port (
        clk   : in  STD_LOGIC;      -- Clock input
        Rst   : in  STD_LOGIC;      -- Reset input (active low)
        X     : in  STD_LOGIC;      -- Input X
        Y     : out STD_LOGIC       -- Output Y
    );
end STM;

-- Architecture Declaration
architecture Behavioral of STM is

    -- Declare 2-bit state and new_state signals
    signal State     : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Initial state is "00"
    signal New_state : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Default new_state is "00"

begin

    -- State Transition Process (synchronous with clk and reset)
    process(clk, Rst)
    begin
        if (Rst = '0') then  -- Active-low reset
            State <= "00";  -- Reset to state "00"
        elsif (rising_edge(clk)) then  -- On rising edge of clock
            State <= New_state;  -- Update state to new_state
        end if;
    end process;

    -- Output Logic Process (combinational logic based on current state)
    process(State, X)
    begin
        case State is
            when "00" =>  -- State "00"
                Y <= '0';  -- Output Y = 0
                if (X = '0') then
                    New_state <= "00";  -- Stay in state "00" if X = 0
                else
                    New_state <= "01";  -- Transition to state "01" if X = 1
                end if;

            when "01" =>  -- State "01"
                Y <= '0';  -- Output Y = 0
                if (X = '0') then
                    New_state <= "00";  -- Transition to state "00" if X = 0
                else
                    New_state <= "10";  -- Transition to state "10" if X = 1
                end if;

            when "10" =>  -- State "10"
                Y <= '1';  -- Output Y = 1
                if (X = '0') then
                    New_state <= "01";  -- Transition to state "01" if X = 0
                else
                    New_state <= "00";  -- Transition to state "00" if X = 1
                end if;

            when others =>  -- Default case (shouldn't occur)
                Y <= '0';
                New_state <= "00";
        end case;
    end process;

end Behavioral;
