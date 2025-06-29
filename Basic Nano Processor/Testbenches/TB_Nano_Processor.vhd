----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:46:17 AM
-- Design Name: 
-- Module Name: TB_Nano_Processor - Behavioral
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

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is

component Nano_Processor
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg7Out : out STD_LOGIC_VECTOR (6 downto 0);
           Reg7Out : out STD_LOGIC_VECTOR (3 downto 0);
           AnodeOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk_in : STD_LOGIC := '0';
signal Reset, Overflow, Zero : STD_LOGIC;
signal Seg7Out : STD_LOGIC_VECTOR (6 downto 0);
signal Reg7Out : STD_LOGIC_VECTOR (3 downto 0);
signal AnodeOut : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Nano_Processor
    PORT MAP (
        Clk_in => Clk_in,
        Reset => Reset,
        Overflow => Overflow,
        Zero => Zero,
        Seg7Out => Seg7Out,
        Reg7Out => Reg7Out,
        AnodeOut => AnodeOut
    );

-- Clock generation: 10 ns period (5 ns high, 5 ns low)
process
begin
    wait for 5 ns;
    Clk_in <= not Clk_in;
end process;

-- Reset pulse: 20 ns high, then low
process
begin
    Reset <= '1';
    wait for 20 ns;
    Reset <= '0';
    wait;
end process;

end Behavioral;