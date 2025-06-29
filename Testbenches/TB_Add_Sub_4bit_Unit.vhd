----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:07:04 AM
-- Design Name: 
-- Module Name: TB_Add_Sub_4bit_Unit - Behavioral
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

entity TB_Add_Sub_4bit_Unit is
--  Port ( );
end TB_Add_Sub_4bit_Unit;

architecture Behavioral of TB_Add_Sub_4bit_Unit is
component Add_Sub_4bit_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
signal Overflow : STD_LOGIC;
signal Zero : STD_LOGIC;
signal AddSubSelect : STD_LOGIC;

begin
    UUT: Add_Sub_4bit_Unit
    PORT MAP (
        A => A,
        B => B,
        AddSubSelect => AddSubSelect,
        S => S,
        Overflow => Overflow,
        Zero => Zero
    );

    process
    begin
        -- Initialize inputs to avoid undefined state
        A <= "0000";
        B <= "0000";
        AddSubSelect <= '0';
        WAIT FOR 100 ns;

        A <= "0001";
        B <= "1001";
        AddSubSelect <= '0';
        WAIT FOR 100 ns;

        A <= "0110";
        B <= "0011";
        AddSubSelect <= '1';
        WAIT FOR 100 ns;

        A <= "0011";
        B <= "1011";
        AddSubSelect <= '0';
        WAIT FOR 100 ns;

        A <= "0101";
        B <= "0011";
        AddSubSelect <= '1';
        WAIT FOR 100 ns;

        A <= "0100";
        B <= "0100";
        AddSubSelect <= '1';
        WAIT FOR 100 ns;

        A <= "0111";
        B <= "0111";
        AddSubSelect <= '0';
        WAIT FOR 100 ns;

        wait;
    end process;
end Behavioral;