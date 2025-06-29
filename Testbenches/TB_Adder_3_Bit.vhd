----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 10:02:54 AM
-- Design Name: 
-- Module Name: TB_Adder_3_Bit - Behavioral
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

entity TB_Adder_3_bit is
--  Port ( );
end TB_Adder_3_bit;

architecture Behavioral of TB_Adder_3_bit is

component Adder_3_bit
    port( A : in STD_LOGIC_VECTOR (2 downto 0);
          S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A : STD_LOGIC_VECTOR (2 downto 0) :=(others => '0');
signal S : STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT: Adder_3_bit port map(
        A=>A,
        S=>S);
    process begin
        A<= "000";
        wait for 100ns;
    
        A<= "001";
        wait for 100ns;
    
        A<= "010";
        wait for 100ns;
    
        A<= "011";
        wait for 100ns;
    
        A<= "100";
        wait for 100ns;
    
        A<= "101";
        wait for 100ns;
    
        A<= "110";
        wait for 100ns;
    
        A<= "111";
        wait for 100ns;
    
        wait;
    end process;
   
end Behavioral;
