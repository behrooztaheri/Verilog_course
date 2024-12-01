library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        OpCode : in  STD_LOGIC_VECTOR(1 downto 0);
        
        Result : out STD_LOGIC_VECTOR(15 downto 0);
        Zflag  : out STD_LOGIC
    );
end ALU;

architecture Behavioral of ALU is
    signal temp_result : STD_LOGIC_VECTOR(15 downto 0);
begin

    process(A, B, OpCode)
    begin
        case OpCode is
            when "00" =>
                temp_result <= ("00000000" & A) + ("00000000" & B); -- Addition
            when "01" =>
                temp_result <= ("00000000" & A) - ("00000000" & B); -- Subtraction
            when "10" =>
                temp_result <= ("00000000" & A) * ("00000000" & B); -- Multiplication
            when "11" =>
                temp_result <= A & "0"; -- Left Shift by 1 bit
            when others =>
                temp_result <= (others => 'Z'); -- Undefined state
        end case;
        
        -- Assign the computed result
        Result <= temp_result;
        
        -- Set Zflag to '1' if Result is zero, otherwise '0'
        if temp_result = "0000000000000000" then
            Zflag <= '1';
        else
            Zflag <= '0';
        end if;
    end process;

end Behavioral;
