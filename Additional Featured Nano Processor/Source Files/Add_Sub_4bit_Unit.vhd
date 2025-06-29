----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:45:42
-- Design Name: 
-- Module Name: Add_Sub_4bit_Unit - Behavioral
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

entity Add_Sub_4bit_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4bit_Unit;

architecture Behavioral of Add_Sub_4bit_Unit is

Component RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Component;

signal TB : STD_LOGIC_VECTOR (3 downto 0);
signal carry : STD_LOGIC_VECTOR (4 downto 0);
signal result : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin

RCA : RCA_4
Port Map(
   A0 => A(0),
   A1 => A(1),
   A2 => A(2),
   A3 => A(3),
   B0 => TB(0),
   B1 => TB(1),
   B2 => TB(2),
   B3 => TB(3),
   C_in => AddSubSelect,
   S0 => result(0),
   S1 => result(1),
   S2 => result(2),
   S3 => result(3),
   C_out => Overflow);
 
 TB <= B XOR (AddSubSelect & AddSubSelect & AddSubSelect & AddSubSelect);

    S <= result;
    Zero <= not (result(0) or result(1) or result(2) or result(3));

end Behavioral;