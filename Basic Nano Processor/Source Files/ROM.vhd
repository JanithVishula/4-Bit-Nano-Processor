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

entity ROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
    process(MemorySelect)
    begin
        case MemorySelect is
            when "000" => InstructionBus <= "100010000001";  -- MOVI R1, 1 
            when "001" => InstructionBus <= "100100000010";  -- MOVI R2, 2
            when "010" => InstructionBus <= "100110000011";  -- MOVI R3, 3
            when "011" => InstructionBus <= "101110000000";  -- MOVI R7, 0
            when "100" => InstructionBus <= "001110010000";  -- ADD R7, R1
            when "101" => InstructionBus <= "001110100000";  -- ADD R7, R2
            when "110" => InstructionBus <= "001110110000";  -- ADD R7, R3
            when "111" => InstructionBus <= "110000000111";  -- JZR, R0
        when others => InstructionBus <= "110000000000";  -- JZR R0,0    
        end case;
    end process;

end Behavioral;
