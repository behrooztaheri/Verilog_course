library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Computer is
    Port (
        A     : in  STD_LOGIC_VECTOR(7 downto 0);
        Adr   : in  STD_LOGIC_VECTOR(11 downto 0);
        Op    : in  STD_LOGIC_VECTOR(1 downto 0);
        Rd    : in  STD_LOGIC;
        Wr    : in  STD_LOGIC;
        
        F     : out STD_LOGIC_VECTOR(15 downto 0);
        Z     : out STD_LOGIC
    );
end Computer;

architecture Structural of Computer is
    -- Internal signals
    signal B : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_Result : STD_LOGIC_VECTOR(15 downto 0);
    signal ALU_ZFlag : STD_LOGIC;

    -- Component declaration for Memory
    component Memory
        Port (
            Din    : in  STD_LOGIC_VECTOR(7 downto 0);
            Adress : in  STD_LOGIC_VECTOR(11 downto 0);
            Read   : in  STD_LOGIC;
            Write  : in  STD_LOGIC;
            Dout   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Component declaration for ALU
    component ALU
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            OpCode : in  STD_LOGIC_VECTOR(1 downto 0);
            Result : out STD_LOGIC_VECTOR(15 downto 0);
            Zflag  : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate Memory Unit
    Unit1: Memory
        port map (
            Din    => (others => '0'), -- Din is set to 8'b0 as in Verilog code
            Adress => Adr,
            Read   => Rd,
            Write  => Wr,
            Dout   => B
        );

    -- Instantiate ALU Unit
    Unit2: ALU
        port map (
            A      => A,
            B      => B,
            OpCode => Op,
            Result => ALU_Result,
            Zflag  => ALU_ZFlag
        );

    -- Assign outputs
    F <= ALU_Result;
    Z <= ALU_ZFlag;

end Structural;
