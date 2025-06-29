----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:57:34 AM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
    Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheckForJump : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : out STD_LOGIC;
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC;
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : out STD_LOGIC;
           AddressToJump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal InstructionBus : STD_LOGIC_VECTOR (11 downto 0);
signal RegCheckForJump : STD_LOGIC_VECTOR (3 downto 0);
signal RegEnable : STD_LOGIC_VECTOR (2 downto 0);
signal LoadSelect : STD_LOGIC;
signal ImmediateValue : STD_LOGIC_VECTOR (3 downto 0);
signal RegSel1 : STD_LOGIC_VECTOR (2 downto 0);
signal RegSel2 : STD_LOGIC_VECTOR (2 downto 0);
signal AddSubSelect : STD_LOGIC;
signal JumpFlag : STD_LOGIC;
signal AddressToJump : STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT : Instruction_Decoder
    PORT MAP (
        InstructionBus => InstructionBus,
        RegCheckForJump => RegCheckForJump,
        AddSubSelect => AddSubSelect,
        RegSel1 => RegSel1,
        RegSel2 => RegSel2,
        ImmediateValue => ImmediateValue,
        LoadSelect => LoadSelect,
        RegEnable => RegEnable,
        JumpFlag => JumpFlag,
        AddressToJump => AddressToJump
    );

    process
    begin
        -- MOVI R1, 4
        InstructionBus <= "100010000100";
        RegCheckForJump <= "0000";
        wait for 100 ns;

        -- MOVI R2, 1
        InstructionBus <= "100100000001";
        wait for 100 ns;

        -- ADD R1, R2
        InstructionBus <= "000010100000";
        wait for 100 ns;

        -- JZR R1, 6
        InstructionBus <= "110010000110";
        wait for 100 ns;

        -- NEG R2
        InstructionBus <= "010100000000";
        wait for 100 ns;

        wait;
    end process;
end Behavioral;