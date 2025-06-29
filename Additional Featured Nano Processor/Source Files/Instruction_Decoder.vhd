----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 15:44:51
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port (
        InstructionBus : in STD_LOGIC_VECTOR (12 downto 0);
        RegCheckForJump : in STD_LOGIC_VECTOR (3 downto 0);
        
        AddSubSelect : out STD_LOGIC;
        
        Mode : out STD_LOGIC; --add/sub or comp
        TS : out STD_LOGIC; -- greater or lesser value to be displayed
        Sign : out STD_LOGIC; -- greater or lesser value to be displayed
        
        RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
        RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
        
        ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
        LoadSelect : out STD_LOGIC;
        
        RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
        
        JumpFlag : out STD_LOGIC;
        AddressToJump : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin
    process(InstructionBus, RegCheckForJump)
    begin
        -- Default values
        AddSubSelect <= '0';
        JumpFlag <= '0';
        LoadSelect <= '1';
        RegSel1 <= "000";
        RegSel2 <= "000";
        ImmediateValue <= "0000";
        RegEnable <= "000";
        AddressToJump <= "000";
        MODE <= '0';
        TS <= '0';
        Sign <= '0';

        case InstructionBus(12 downto 10) is
            when "000" =>  -- ADD
                RegSel1 <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(6 downto 4);
                RegEnable <= InstructionBus(9 downto 7);
                --LoadSelect <= '1';
            when "001" =>  -- NEG
                RegEnable <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(9 downto 7);
                AddSubSelect <= '1';
                --LoadSelect <= '1';
            when "010" =>  -- MOVI
                ImmediateValue <= InstructionBus(3 downto 0);
                RegEnable <= InstructionBus(9 downto 7);
                LoadSelect <= '0';
            when "011" =>  -- JZR
                AddressToJump <= InstructionBus(2 downto 0);
                RegSel1 <= InstructionBus(9 downto 7);
                if RegCheckForJump = "0000" then
                    JumpFlag <= '1';
                end if;
                
            when "100" => --UNSIGNED 
            
                RegSel1 <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(6 downto 4);
                RegEnable <= InstructionBus(9 downto 7);
                --LoadSelect <= '1';
                MODE <= '1';
                TS <= '0';
                Sign <= '0';
                
            when "101" => --UNSIGNED LESSER
                RegSel1 <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(6 downto 4);
                RegEnable <= InstructionBus(9 downto 7);
                --LoadSelect <= '1';
                MODE <= '1';
                TS <= '1';
                Sign <= '0';
                
            when "110" => --SIGNED GREATER
                RegSel1 <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(6 downto 4);
                RegEnable <= InstructionBus(9 downto 7);
                --LoadSelect <= '1';
                MODE <= '1';
                TS <= '0';
                Sign <= '1';
                
            when "111" => --SIGNED LESSER
                RegSel1 <= InstructionBus(9 downto 7);
                RegSel2 <= InstructionBus(6 downto 4);
                RegEnable <= InstructionBus(9 downto 7);
                --LoadSelect <= '1';
                MODE <= '1';
                TS <= '1';
                Sign <= '1';
                
            when others =>
                null;
        end case;
    end process;
end Behavioral;