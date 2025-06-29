----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:52:14 AM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is
component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

signal Clk : std_logic := '0';
signal D : std_logic := '0';
signal Res : std_logic := '0';
signal Q: std_logic;
signal Qbar : std_logic;

begin
UUT: D_FF port map(
    D => D,
    Res => Res,
    Clk => Clk,
    Q => Q,
    Qbar => Qbar);
    
process
begin
    while now< 500ns loop
        Clk <= not Clk;
        wait for 10ns;
    end loop;
    wait;
end process;

process
begin 
    D <= '0';
    Res <= '0';
    WAIT FOR 50ns;
    
    D <= '1';
    WAIT FOR 20ns;
    
    D <= '0';
    WAIT FOR 30ns;
    
    D <= '1';
    Res <= '1';
    WAIT FOR 15ns;
    
    D <= '0';
    Res <= '0';
    WAIT FOR 40ns;
    
    D <= '1';
    WAIT FOR 25ns;
    
    D <= '0';
    WAIT FOR 30ns;
    
    D <= '1';
    WAIT FOR 40ns;
    
    D <= '0';
    WAIT FOR 5ns;
    
    D <= '0';
    WAIT FOR 30ns;
    
    D <= '1';
    WAIT FOR 25ns;
    
    D <= '0';
    
    WAIT;
end process;
end Behavioral;
