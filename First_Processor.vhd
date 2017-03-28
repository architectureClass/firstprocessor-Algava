----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:42 03/27/2017 
-- Design Name: 
-- Module Name:    First_Processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity First_Processor is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ALUresult : out  STD_LOGIC_VECTOR(31 downto 0));
end First_Processor;

architecture Behavioral of First_Processor is

	component Adder
	 Port ( OP1 : in  STD_LOGIC_Vector(31 downto 0);
           OP2 : in  STD_LOGIC_Vector(31 downto 0);
           RESULT : out  STD_LOGIC_Vector(31 downto 0));
	end component;
	
	component Program_Counter
	 Port ( Data : in  STD_LOGIC_VECTOR(31 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR(31 downto 0) );
	end component;
	
	component Instruction_Memory
	 Port ( Address : in  STD_LOGIC_VECTOR(31 downto 0);
           rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
	component Register_File
	 Port ( RS1 : in  STD_LOGIC_VECTOR(4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR(4 downto 0);
           RD : in  STD_LOGIC_VECTOR(4 downto 0);
           RST : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR(31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR(31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
	component ControlUnit
	 Port ( OP3 : in  STD_LOGIC_VECTOR(5 downto 0);
           OP : in  STD_LOGIC_VECTOR(1 downto 0);
           ALUop : out  STD_LOGIC_VECTOR(5 downto 0));
	end component;
	
	component ALU
	 Port ( ALUop : in  STD_LOGIC_VECTOR(5 downto 0);
           Dato1 : in  STD_LOGIC_VECTOR(31 downto 0);
           Dato2 : in  STD_LOGIC_VECTOR(31 downto 0);
           ALUresult : out  STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
	signal nPC_in, nPC_out, PC_out, Instruction_out, ALUresult_out, CRs1_out, CRs2_out : STD_LOGIC_VECTOR(31 downto 0);
	signal ALUop_out : STD_LOGIC_VECTOR(5 downto 0);

begin

	nPC : Program_Counter
		port map(Data => nPC_in,
					RST =>RST,
					CLK =>CLK,
					DataOut => nPC_out
		);
		
	PC : Program_Counter
		port map(Data => nPC_out,
					RST =>RST,
					CLK =>CLK,
					DataOut => PC_out
		);
		
	Sumador : Adder
		port map(OP1 => x"00000001",
					OP2 => nPC_out,
					RESULT => nPC_in
		);
		
	IM : Instruction_Memory
		port map(Address => PC_out,
					rst => RST,
					Instruction => Instruction_out
		);
	
	CU : ControlUnit
		port map(OP => Instruction_out(31 downto 30),
					OP3 => Instruction_out(24 downto 19),
					ALUop => ALUop_out
		);
		
	RF : Register_File
		port map(RS1 => Instruction_out(18 downto 14),
					RS2 => Instruction_out(4 downto 0),
					RD => Instruction_out(29 downto 25),
					RST => RST,
					DWR => ALUresult_out,
					CRs1 => CRs1_out,
					CRs2 => CRs2_out
		);
		
	ALU1 : ALU
		port map(Dato1 => CRs1_out,
					Dato2 => CRs2_out,
					ALUop => ALUop_out,
					ALUresult => ALUresult_out
		);

	ALUresult <= ALUresult_out;
end Behavioral;

