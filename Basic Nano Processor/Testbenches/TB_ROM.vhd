----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:52:51 AM
-- Design Name: 
-- Module Name: TB_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is

component ROM
    Port ( 
        MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
        InstructionBus : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;

signal MemorySelect : STD_LOGIC_VECTOR(2 downto 0);
signal InstructionBus : STD_LOGIC_VECTOR(11 downto 0);

begin

    UUT: ROM
        port map(
            MemorySelect => MemorySelect,
            InstructionBus => InstructionBus
        );

    process
    begin
        for i in 0 to 7 loop
            MemorySelect <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
            wait for 100 ns;
        end loop;
        wait;
    end process;

end Behavioral;