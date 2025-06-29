----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:38:30 AM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is

component PC is
    Port ( NextAddress : in STD_LOGIC_VECTOR(2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal Clk : STD_LOGIC := '0';
signal Res : STD_LOGIC := '0';
signal MemorySelect, NextAddress : STD_LOGIC_VECTOR(2 downto 0);

begin

    UUT: PC port map (
        NextAddress => NextAddress,
        Res => Res,
        Clk => Clk,
        MemorySelect => MemorySelect
    );

    -- Clock process
    process
    begin
        Clk <= '0';
        wait for 50 ns;
        Clk <= '1';
        wait for 50 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Initial reset
        Res <= '1';
        wait for 100 ns;
        Res <= '0';
        wait for 100 ns;

        -- Test sequence based on 230467R (111 000 010 001 000 011)
        Res <= '1';
        NextAddress <= "111";
        wait for 100 ns;

        Res <= '0';
        NextAddress <= "000";
        wait for 100 ns;

        Res <= '0';
        NextAddress <= "010";
        wait for 100 ns;

        Res <= '0';
        NextAddress <= "001";
        wait for 100 ns;

        Res <= '0';
        NextAddress <= "000";
        wait for 100 ns;

        Res <= '0';
        NextAddress <= "011";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
