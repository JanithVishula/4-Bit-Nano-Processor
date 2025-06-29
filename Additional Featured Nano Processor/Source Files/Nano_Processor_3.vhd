----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2025 08:59:49
-- Design Name: 
-- Module Name: Nano_Processor_3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL; -- Added for arithmetic operations

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nano_Processor_3 is
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk_Step : in STD_LOGIC;
           Clk_Mode : in STD_LOGIC;
           ROM_Sel  : in STD_LOGIC;
           Target_Reg : in STD_LOGIC_VECTOR (2 downto 0); 
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg7Out : out STD_LOGIC_VECTOR (6 downto 0);
           Reg7Out : out STD_LOGIC_VECTOR (3 downto 0);
           AnodeOut : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor_3;

architecture Behavioral of Nano_Processor_3 is

-- Component declarations
component Slow_Clk is
    Generic ( N : Integer := 26);
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component PC is
    Port ( NextAddress : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           ROM_Sel : in STD_LOGIC;     
           InstructionBus : out STD_LOGIC_VECTOR (12 downto 0));--InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;


component ALU is
    Port (
    MODE : in STD_LOGIC; 
    AddSubSelect : in STD_LOGIC; 
    TS   : in STD_LOGIC; 
    Sign : in STD_LOGIC; 
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0); 
    Overflow : out STD_LOGIC;
    Zero : out STD_LOGIC; 
    Output : out STD_LOGIC_VECTOR (3 downto 0)); 
    
end component;

component R7_7seg is
    Port ( Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           Clk_In : in STD_LOGIC;
           Q : in STD_LOGIC_VECTOR (2 downto 0);
           Seg7 : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Instruction_Decoder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (12 downto 0);
           RegCheckForJump : in STD_LOGIC_VECTOR (3 downto 0);
           
           AddSubSelect : out STD_LOGIC;
           Mode : out STD_LOGIC; 
           TS   : out STD_LOGIC; 
           Sign : out STD_LOGIC; 
           
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC;
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
           
           JumpFlag : out STD_LOGIC;
           AddressToJump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_8W_4B is
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
end component;

component RegBank is
    Port ( Value : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegEN : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2W_4B is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2W_3B is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
           
end component;



-- Signal declarations
signal S_Clk, Current_Clk  : STD_LOGIC;

signal value_to_reg : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR (2 downto 0);

signal Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, Display_Reg : STD_LOGIC_VECTOR (3 downto 0);
signal Register_Select_1, Register_Select_2 : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_A, Reg_B : STD_LOGIC_VECTOR (3 downto 0);

signal Mode_select : STD_LOGIC;
signal Display_Greater_or_Lesser_Val : STD_LOGIC;
signal Sign : STD_LOGIC;

signal AddSub_Select : STD_LOGIC;
signal Display_Out : STD_LOGIC_VECTOR (3 downto 0);

signal Instruction_Bus : STD_LOGIC_VECTOR (12 downto 0); 

signal Load_Select : STD_LOGIC;
signal Jump_Flag : STD_LOGIC;
signal Address_to_Jump : STD_LOGIC_VECTOR (2 downto 0);
signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal PC_Prev_Address, PC_Next_Address : STD_LOGIC_VECTOR (2 downto 0);
signal To_Next_Program_Counter : STD_LOGIC_VECTOR (2 downto 0);
signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0);

begin


Slow_Clock: Slow_Clk
    Generic Map ( N => 26 )
    PORT MAP (
        Clk_in => Clk_in,
        Clk_out => S_Clk
    );

Program_Counter_0: PC
    PORT MAP (
        NextAddress => To_Next_Program_Counter,
        Res => Reset,
        Clk => Current_Clk,
        MemorySelect => Memory_Select
    );

Program_ROM_0: ROM
    PORT MAP (
        MemorySelect => Memory_Select,
        ROM_Sel => ROM_Sel,
        InstructionBus => Instruction_Bus
    );

PC_Next_Address <= std_logic_vector(unsigned(PC_Prev_Address) + 1);

Instruction_Decoder_0: Instruction_Decoder
    PORT MAP (
        InstructionBus => Instruction_Bus,
        RegCheckForJump => Reg_A,
        
        AddSubSelect => AddSub_Select,
        MODE => MODE_select ,
        TS => Display_Greater_or_Lesser_Val ,
        Sign => Sign ,
        
        RegSel1 => Register_Select_1,
        RegSel2 => Register_Select_2,
        ImmediateValue => Immediate_Value,
        LoadSelect => Load_Select,
        RegEnable => Reg_Enable,
        JumpFlag => Jump_Flag,
        AddressToJump => Address_to_Jump
    );

Mux_8way_4bit_A: MUX_8W_4B
    PORT MAP (
        RegSel => Register_Select_1,
        Reg0 => Reg0,
        Reg1 => Reg1,
        Reg2 => Reg2,
        Reg3 => Reg3,
        Reg4 => Reg4,
        Reg5 => Reg5,
        Reg6 => Reg6,
        Reg7 => Reg7,
        RegOut => Reg_A
    );

Mux_8way_4bit_B: MUX_8W_4B
    PORT MAP (
        RegSel => Register_Select_2,
        Reg0 => Reg0,
        Reg1 => Reg1,
        Reg2 => Reg2,
        Reg3 => Reg3,
        Reg4 => Reg4,
        Reg5 => Reg5,
        Reg6 => Reg6,
        Reg7 => Reg7,
        RegOut => Reg_B
    );


    
ALU_0 : ALU 
        Port MAP (
        MODE =>  Mode_Select,
        AddSubSelect => AddSub_Select,
        TS => Display_Greater_or_Lesser_Val ,
        Sign => Sign ,
        A => Reg_A,
        B => Reg_B,
        Overflow => Overflow,
        Zero => Zero,
        Output => Display_Out); 


Register_Bank: RegBank
    PORT MAP (
        Value => value_to_reg,
        Clk => Current_Clk,
        RegEN => Reg_Enable,
        Reset => Reset,
        Q0 => Reg0,
        Q1 => Reg1,
        Q2 => Reg2,
        Q3 => Reg3,
        Q4 => Reg4,
        Q5 => Reg5,
        Q6 => Reg6,
        Q7 => Reg7
    );

Mux_2way_4bit_0: MUX_2W_4B
    PORT MAP (
        A => Immediate_Value,
        B => Display_Out,
        Sel => Load_Select,
        Y => value_to_reg
    );

Mux_2way_3bit_0: MUX_2W_3B
    PORT MAP (
        A => PC_Next_Address,
        B => Address_to_Jump,
        Sel => Jump_Flag,
        Y => To_Next_Program_Counter
    );

R7_7seg_0: R7_7seg
    PORT MAP (
        Reg7 => Display_Reg,
        Clk_In => Clk_in,
        Q => Memory_Select,
        Seg7 => Seg7Out,
        anode => AnodeOut
    );

Reg7Out <= Reg7;
PC_Prev_Address <= Memory_Select;

Clk_Type : Process(Clk_Mode)
begin

case Clk_Mode is
  when '0' => Current_Clk <= S_Clk; 
  when '1' => Current_Clk <= Clk_Step; 
  when others => null;
end case;

end process;

Reg_Select : Process(Target_Reg)
begin

case Target_Reg is
  when "000" => Display_Reg <= Reg0; 
  when "001" => Display_Reg <= Reg1;
  when "010" => Display_Reg <= Reg2; 
  when "011" => Display_Reg <= Reg3; 
  when "100" => Display_Reg <= Reg4; 
  when "101" => Display_Reg <= Reg5; 
  when "110" => Display_Reg <= Reg6; 
  when "111" => Display_Reg <= Reg7; 
  when others => null;
end case;

end process;


end Behavioral;