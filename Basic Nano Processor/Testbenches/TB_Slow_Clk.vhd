----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:36:29 AM
-- Design Name: 
-- Module Name: TB_Slow_Clk - Behavioral
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

entity TB_Slow_Clk is
--  Port ( );
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is
component Slow_Clk
    port(
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end component;

SIGNAL Clk_in : STD_LOGIC := '0';
SIGNAL Clk_out : STD_LOGIC;



begin
UUT: Slow_Clk port map(
    Clk_in => Clk_in,
    Clk_out => Clk_out
);

process
begin 
    Clk_in <= '1';
    WAIT FOR 5ns;
    Clk_in <= '0';
    WAIT FOR 5ns;
end process;

end Behavioral;

