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

    -- Declare 2-bit state and new_state signals
    signal State     : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Initial state is "IDLE"
    signal New_state : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Default new_state is "IDLE"

    -- State parameters
    constant IDLE   : STD_LOGIC_VECTOR(1 downto 0) := "00";
    constant Pre    : STD_LOGIC_VECTOR(1 downto 0) := "01";
    constant Final  : STD_LOGIC_VECTOR(1 downto 0) := "10";

    -- Internal signal for output Y
    signal Y_internal : STD_LOGIC := '0';

begin

    -- Process for state transitions (sync with clk and reset)
    process(clk, Rst)
    begin
        if (Rst = '0') then  -- Asynchronous reset (active low)
            State <= IDLE;  -- Reset state to IDLE
        elsif (rising_edge(clk)) then  -- On rising edge of clock
            State <= New_state;  -- Update state to new_state
        end if;
    end process;

    -- Process to determine the next state and output Y based on current state
    process(State)
    begin
        case State is
            when IDLE =>  -- State IDLE
                Y_internal <= '0';   -- Output Y = 0
                New_state <= Pre;    -- Next state = Pre

            when Pre =>  -- State Pre
                Y_internal <= '0';   -- Output Y = 0
                New_state <= Final;  -- Next state = Final

            when Final =>  -- State Final
                Y_internal <= '1';   -- Output Y = 1
                New_state <= IDLE;   -- Next state = IDLE

            when others =>  -- Default case (should never reach here)
                Y_internal <= '0';   -- Output Y = 0
                New_state <= IDLE;   -- Reset state to IDLE
        end case;
    end process;

    -- Assign internal signal to output Y
    Y <= Y_internal;

end Behavioral;
