----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:49:18
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Generic ( N : Integer := 26);
    Port ( Clk_in : in STD_LOGIC; 
           Clk_out : out STD_LOGIC);
end Slow_Clk;
architecture Behavioral of Slow_Clk is
    signal counter : unsigned(26 downto 0) := (others => '0'); 
begin
    process(Clk_in)
    begin
        if rising_edge(Clk_in) then
            counter <= counter + 1;
        end if;
    end process;
    Clk_out <= counter(N);
end Behavioral;