----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:42:51
-- Design Name: 
-- Module Name: ROM - Behavioral
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

--entity ROM is
--    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
--           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
--end ROM;

entity ROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           ROM_Sel : in STD_LOGIC;
           InstructionBus : out STD_LOGIC_VECTOR (12 downto 0));
end ROM;
architecture Behavioral of ROM is
    SIGNAL  InstructionBus0, InstructionBus1 : STD_LOGIC_VECTOR (12 downto 0);

begin
    process(MemorySelect)
    begin
        case MemorySelect is
            when "000" => InstructionBus0 <= "0101110000011";  -- MOVI R7, 3 
            when "001" => InstructionBus0 <= "0100010000001";  -- MOVI R1, 1
            when "010" => InstructionBus0 <= "0010010000000";  -- NEG  R1
            when "011" => InstructionBus0 <= "0100100000011";  -- MOVI R2, 3
            when "100" => InstructionBus0 <= "0000100010000";  -- ADD  R2, R1
            when "101" => InstructionBus0 <= "0001110100000";  -- ADD R7, R2
            when "110" => InstructionBus0 <= "0110100000110";  -- JZR  R2, 6
            when "111" => InstructionBus0 <= "0110000000100";  -- JZR R0,4
            when others => InstructionBus0 <= "0000000000000"; 
        end case;


          case MemorySelect is
              when "000" => InstructionBus1 <= "0101110000111";   -- MOVI R7, 7  == 7
              when "001" => InstructionBus1 <= "0100010001101";  -- MOVI R1, -3  == 7
              when "010" => InstructionBus1 <= "0001110000000";  -- ADD R7, R0   == 7
              when "011" => InstructionBus1 <= "0100100000010";  -- MOVI R2, 2   == 7
              when "100" => InstructionBus1 <= "1001110100001";  -- COMP R7, R2 == 7 (UNSIGNED GREATER)
              when "101" => InstructionBus1 <= "1011110100001";  -- COMP R7, R2  == 2 (UNSIGNED LESSER)
              when "110" => InstructionBus1 <= "1111110010011";  -- COMP R7, R1  == -3 d (SIGNED LESSER)
              when "111" => InstructionBus1 <= "0110000000111";  -- JZR R0,4
              when others => InstructionBus1 <= "0000000000000"; 
          end case;
    end process;
    
Instruction_Select : process(ROM_Sel)

    begin

        case ROM_Sel is
            when '0' => InstructionBus <= InstructionBus0;
            when '1' => InstructionBus <= InstructionBus1;
        end case;

    end process;

end Behavioral;
