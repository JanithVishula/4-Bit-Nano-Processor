----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:43:41 AM
-- Design Name: 
-- Module Name: TB_MUX_2W_3B - Behavioral
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

entity TB_MUX_2W_3B is
--  Port ( );
end TB_MUX_2W_3B;

architecture Behavioral of TB_MUX_2W_3B is

component MUX_2W_3B
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL A, B, Y : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Sel : STD_LOGIC;

begin

    UUT : MUX_2W_3B PORT MAP (
            A => A,
            B => B,
            Sel => Sel,
            Y => Y);

    process begin 
        A <= "010";
        B <= "101";
        Sel <= '0';
        wait for 400ns;
        
        Sel <= '1';
        wait;
        
    end process;

end Behavioral;
