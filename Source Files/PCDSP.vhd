----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2025 19:27:17
-- Design Name: 
-- Module Name: PCDSP - Behavioral
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

entity PCDSP is

    Port ( 
           Clk : IN STD_LOGIC;
           JumpAddress : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           JumpFlag : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PCDSP;

architecture Behavioral of PCDSP is

COMPONENT c_counter_binary_0 IS
  PORT (
    CLK : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    LOAD : IN STD_LOGIC;
    L : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;


begin

PC1 : c_counter_binary_0
PORT MAP(
    CLK => Clk,
    SCLR => Reset,
    LOAD => JumpFlag,
    L => JumpAddress,
    Q =>Q
);


end Behavioral;
