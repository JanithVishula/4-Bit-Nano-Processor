----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:53:56 AM
-- Design Name: 
-- Module Name: TB_LUT_16_7 - Behavioral
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

entity TB_LUT_16_7 is
--  Port ( );
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is
component LUT_16_7
port(
    address: in std_logic_vector(3 downto 0) := "0000";
    data : out std_logic_vector(6 downto 0)
);
end component;
signal address : std_logic_vector(3 downto 0);
signal data : std_logic_vector(6 downto 0);
begin
    UUT : LUT_16_7
    PORT MAP
    (address => address,
    data => data
    );
    
    process
        begin
        
        address <= "1110";
        wait for 100 ns;
        
        address <= "1010";
        wait for 100 ns;
        
        address <= "0011";
        wait for 100 ns;
        
        address <= "0010";
        wait for 100 ns;
 
        address <= "1000";
        wait;
        
    end process;
end Behavioral;
