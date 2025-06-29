----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2025 22:51:02
-- Design Name: 
-- Module Name: Comp_Unit - Behavioral
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

entity Comp_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sign : in STD_LOGIC;
           TS : in STD_LOGIC;
           Comp_Result : out STD_LOGIC_VECTOR (3 downto 0));
end Comp_Unit;

architecture Behavioral of Comp_Unit is
signal Lesser, Greater : STD_LOGIC_VECTOR (3 downto 0);
begin
Compare : process(A, B, Sign)
begin
  case Sign is
  when '1' =>
     if  signed(A) < signed(B) then
         Lesser  <= A;
         Greater <= B;       
     else
        Lesser  <= B;
        Greater <= A; 
     end if;
     
  when '0' =>
      if  unsigned(A) < unsigned(B) then
          Lesser  <= A;
          Greater <= B;       
      else
          Lesser  <= B;
          Greater <= A;
      end if;
   when others => null;
  end case; 

end process;

Selection : process(TS)
begin
    case TS is
         when '0' => Comp_Result <= Greater;
         when '1' => Comp_Result <= Lesser;
         when others => null;
    end case;
end process;
end Behavioral;
