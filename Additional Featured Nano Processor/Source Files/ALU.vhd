----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2025 23:08:01
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port (
    MODE : in STD_LOGIC; -- MODE = 0 : Add sub /// MODE = 1 : Compare
    AddSubSelect : in STD_LOGIC;
    TS   : in STD_LOGIC;
    Sign : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    Overflow : out STD_LOGIC;
    Zero : out STD_LOGIC;
    Output : out STD_LOGIC_VECTOR (3 downto 0));
    
end ALU;

architecture Behavioral of ALU is

COMPONENT Add_Sub_4bit_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end COMPONENT;

component Comp_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sign : in STD_LOGIC;
           TS : in STD_LOGIC;
           Comp_Result : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Add_Res : STD_LOGIC_VECTOR (3 downto 0);
signal Comp_Res : STD_LOGIC_VECTOR (3 downto 0);


begin

Add_Sub_4bit_Unit_0: Add_Sub_4bit_Unit 
    Port Map ( 
           A => A ,
           B => B ,
     
           AddSubSelect => AddSubSelect,
           
           S => Add_Res ,
           
           Overflow => Overflow,
           Zero => Zero );
           
Comp_Unit_0 : Comp_Unit 
Port Map (

          A => A,
          B => B,
          Sign => Sign,
          TS  => TS,
          Comp_Result => Comp_Res);
          
  process(MODE, Add_Res, Comp_Res)
  begin
      if MODE = '0' then
          Output <= Add_Res;
      else
          Output <= Comp_Res;
      end if;
  end process;


end Behavioral;
