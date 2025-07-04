----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 01:36:37 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
COMPONENT Decoder_2_to_4
    PORT ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL I : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Decoder_2_to_4 PORT MAP(
    I => I,
    EN => EN,
    Y => Y
);

process
begin
I(0) <= '0';
I(1) <= '0';
EN <= '1';

WAIT FOR 100 ns;
I(0) <= '0';
I(1) <= '1';

WAIT FOR 100 ns;
I(0) <= '1';
I(1) <= '0';

WAIT FOR 100 ns;
I(0) <= '1';
I(1) <= '1';

WAIT FOR 100ns;
EN <= '0';

WAIT;
end process;
end Behavioral;