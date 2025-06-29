----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:34:03 AM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity RegBank_TB is
--  Port ( );
end RegBank_TB;

architecture Behavioral of RegBank_TB is

component RegBank is
    Port ( Value : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegEN : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Reset, Clk : STD_LOGIC := '0';
SIGNAL Value, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegEN : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : RegBank PORT MAP (
        Value => Value,
        CLK => CLK,
        RegEN => RegEN,
        Reset => Reset,
        Q0 => Q0,
        Q1 => Q1,
        Q2 => Q2,
        Q3 => Q3,
        Q4 => Q4,
        Q5 => Q5,
        Q6 => Q6,
        Q7 => Q7 );
        
     process begin
        CLK <= NOT(CLK);
        wait for 3ns;
    end process;
    
    process begin
    
        -- 230714 -> 11 1000 0101 0011 1010 
        -- 230670 -> 11 1000 0101 0000 1110 
    
        Value <= "1000";
        RegEN <= "101";
        wait for 100ns;
        
        Value <= "0101";
        RegEN <= "100";
        wait for 100ns;
        
        Value <= "1110";
        RegEN <= "110";
        wait for 100ns;

        Reset <= '1';
        wait;
    
    end process;   


end Behavioral;