----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:39:41
-- Design Name: 
-- Module Name: MUX_8W_4B - Behavioral
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

entity MUX_8W_4B is
    Port ( Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           RegOut : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8W_4B;

architecture Behavioral of MUX_8W_4B is
begin
    process(RegSel, Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7)
    begin
        case RegSel is
            when "000" => RegOut <= Reg0;
            when "001" => RegOut <= Reg1;
            when "010" => RegOut <= Reg2;
            when "011" => RegOut <= Reg3;
            when "100" => RegOut <= Reg4;
            when "101" => RegOut <= Reg5;
            when "110" => RegOut <= Reg6;
            when "111" => RegOut <= Reg7;
            when others => RegOut <= (others => '0');
        end case;
    end process;
end Behavioral;
