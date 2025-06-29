----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:41:16
-- Design Name: 
-- Module Name: R7_7seg - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R7_7seg is
    Port ( Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           Clk_In : in STD_LOGIC;
           Q : in STD_LOGIC_VECTOR (2 downto 0);
           Seg7 : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end R7_7seg;

architecture Behavioral of R7_7seg is

component LUT_16_7
    port(
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

component Slow_Clk is
    Generic ( N : Integer := 26);
    Port ( Clk_in : in STD_LOGIC; 
           Clk_out : out STD_LOGIC);
end component;

Signal D_Clk, N_Clk : STD_LOGIC;
Signal Q_TMP : STD_LOGIC_VECTOR (3 downto 0);
Signal Display_3, Display_0, Display_4 : STD_LOGIC_VECTOR (6 downto 0) := "1111111";
Signal D : unsigned (1 downto 0) := "00";
Signal N : Integer := 0;

begin

Q_TMP(2 downto 0) <= Q;

Display_Clk : Slow_Clk
    Generic Map ( N => 17 )
    PORT MAP (
        Clk_in => Clk_in,
        Clk_out => D_Clk
    );
    
 Display3 : Slow_Clk
        Generic Map ( N => 24 )
        PORT MAP (
            Clk_in => Clk_in,
            Clk_out => N_Clk
        );
        
LUT_16_7_0 : LUT_16_7
    PORT MAP(
        address => Reg7,
        data => Display_0
    );
LUT_16_7_1 : LUT_16_7
    PORT MAP(
        address => Q_TMP,
        data => Display_4
    );
    
Anode_Select : Process (D_Clk)
begin
    if rising_edge(D_Clk) then
       D <= D + 1;
    end if;
end process;

D3 : Process (D_Clk)
begin
    if rising_edge(N_Clk) then
       N <= N + 1;
       if N = 7 then
          N <= 0;
       end if;
    end if;
    case N is
      when 0 => Display_3 <= "1111100";
      when 1 => Display_3 <= "1111001";
      when 2 => Display_3 <= "1110011";
      when 3 => Display_3 <= "1100111";
      when 4 => Display_3 <= "1001111";
      when 5 => Display_3 <= "1011110";
      when others => Display_3 <= "1111110"; 
    end case;
end process;

Display_Drive : process(D)
begin
case D is 
  when "00" => 
     Seg7  <= Display_0;
     anode <= "1110";
  when "01" => 
    Seg7  <= "1111111";
    anode <= "1101";
  when "10" => 
   Seg7  <= Display_3;
   anode <= "1011";
 when "11" => 
  Seg7  <= Display_4;
  anode <= "0111";
end case;
end process;
  

end Behavioral;
