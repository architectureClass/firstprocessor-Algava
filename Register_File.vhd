----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:05 03/21/2017 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( RS1 : in  STD_LOGIC_VECTOR(4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR(4 downto 0);
           RD : in  STD_LOGIC_VECTOR(4 downto 0);
           RST : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR(31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR(31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR(31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

	constant g0 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal g3,g4,g5,g6,g7 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal o0,o1,o2,o3,o4,o5,o6,o7 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal l0,l1,l2,l3,l4,l5,l6,l7 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal i0,i1,i2,i3,i4,i5,i6,i7 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal g1,g2 : STD_LOGIC_VECTOR(31 downto 0) := x"00000005";
	
	signal CRs1_aux, CRs2_aux : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	
begin
	
process(RST,RS1,RS2,RD,DWR)

	begin
	
	if (RST = '1') then
	
		CRs1_aux <= x"00000000";
		CRs2_aux <= x"00000000";
		
	else
		
		case (RS1) is
			when "00000" =>
				CRs1_aux <= g0;
				
			when "00001" =>
				CRs1_aux <= g1;
				
			when "00010" =>
				CRs1_aux <= g2;
			
			when "00011" =>
				CRs1_aux <= g3;
				
			when "00100" =>
				CRs1_aux <= g4;
				
			when "00101" =>
				CRs1_aux <= g5;
				
			when "00110" =>
				CRs1_aux <= g6;
			
			when "00111" =>
				CRs1_aux <= g7;
				
			when "01000" =>
				CRs1_aux <= o0;
				
			when "01001" =>
				CRs1_aux <= o1;
				
			when "01010" =>
				CRs1_aux <= o2;
				
			when "01011" =>
				CRs1_aux <= o3;
				
			when "01100" =>
				CRs1_aux <= o4;
			
			when "01101" =>
				CRs1_aux <= o5;
				
			when "01110" =>
				CRs1_aux <= o6;
				
			when "01111" =>
				CRs1_aux <= o7;
				
			when "10000" =>
				CRs1_aux <= l0;
				
			when "10001" =>
				CRs1_aux <= l1;
				
			when "10010" =>
				CRs1_aux <= l2;
				
			when "10011" =>
				CRs1_aux <= l3;
				
			when "10100" =>
				CRs1_aux <= l4;
				
			when "10101" =>
				CRs1_aux <= l5;
				
			when "10110" =>
				CRs1_aux <= l6;
				
			when "10111" =>
				CRs1_aux <= l7;
			
			when "11000" =>
				CRs1_aux <= i0;
				
			when "11001" =>
				CRs1_aux <= i1;
				
			when "11010" =>
				CRs1_aux <= i2;
				
			when "11011" =>
				CRs1_aux <= i3;
				
			when "11100" =>
				CRs1_aux <= i4;
				
			when "11101" =>
				CRs1_aux <= i5;
				
			when "11110" =>
				CRs1_aux <= i6;
				
			when others =>
				CRs1_aux <= i7;
				
		end case;
		
		case (RS2) is
			when "00000" =>
				CRs2_aux <= g0;
				
			when "00001" =>
				CRs2_aux <= g1;
				
			when "00010" =>
				CRs2_aux <= g2;
			
			when "00011" =>
				CRs2_aux <= g3;
			
			when "00100" =>
				CRs2_aux <= g4;
				
			when "00101" =>
				CRs2_aux <= g5;
				
			when "00110" =>
				CRs2_aux <= g6;
			
			when "00111" =>
				CRs2_aux <= g7;
				
			when "01000" =>
				CRs2_aux <= o0;
				
			when "01001" =>
				CRs2_aux <= o1;
				
			when "01010" =>
				CRs2_aux <= o2;
				
			when "01011" =>
				CRs2_aux <= o3;
				
			when "01100" =>
				CRs2_aux <= o4;
			
			when "01101" =>
				CRs2_aux <= o5;
				
			when "01110" =>
				CRs2_aux <= o6;
				
			when "01111" =>
				CRs2_aux <= o7;
				
			when "10000" =>
				CRs2_aux <= l0;
				
			when "10001" =>
				CRs2_aux <= l1;
				
			when "10010" =>
				CRs2_aux <= l2;
				
			when "10011" =>
				CRs2_aux <= l3;
				
			when "10100" =>
				CRs2_aux <= l4;
				
			when "10101" =>
				CRs2_aux <= l5;
				
			when "10110" =>
				CRs2_aux <= l6;
				
			when "10111" =>
				CRs2_aux <= l7;
			
			when "11000" =>
				CRs2_aux <= i0;
				
			when "11001" =>
				CRs2_aux <= i1;
				
			when "11010" =>
				CRs2_aux <= i2;
				
			when "11011" =>
				CRs2_aux <= i3;
				
			when "11100" =>
				CRs2_aux <= i4;
				
			when "11101" =>
				CRs2_aux <= i5;
				
			when "11110" =>
				CRs2_aux <= i6;
				
			when others =>
				CRs2_aux <= i7;
				
		end case;
		
		
		case (RD) is
			when "00000" =>
				
				
			when "00001" =>
				g1 <= DWR;
				
			when "00010" =>
				g2 <= DWR;
			
			when "00011" =>
				g3 <= DWR;
				
			when "00100" =>
				g4 <= DWR;
				
			when "00101" =>
				g5 <= DWR;
				
			when "00110" =>
				g6 <= DWR;
			
			when "00111" =>
				g7 <= DWR;
				
			when "01000" =>
				o0 <= DWR;
				
			when "01001" =>
				o1 <= DWR;
				
			when "01010" =>
				o2 <= DWR;
				
			when "01011" =>
				o3 <= DWR;
				
			when "01100" =>
				o4 <= DWR;
			
			when "01101" =>
				o5 <= DWR;
				
			when "01110" =>
				o6 <= DWR;
				
			when "01111" =>
				o7 <= DWR;
				
			when "10000" =>
				l0 <= DWR;
				
			when "10001" =>
				l1 <= DWR;
				
			when "10010" =>
				l2 <= DWR;
				
			when "10011" =>
				l3 <= DWR;
				
			when "10100" =>
				l4 <= DWR;
				
			when "10101" =>
				l5 <= DWR;
				
			when "10110" =>
				l6 <= DWR;
				
			when "10111" =>
				l7 <= DWR;
			
			when "11000" =>
				i0 <= DWR;
				
			when "11001" =>
				i1 <= DWR;
				
			when "11010" =>
				i2 <= DWR;
				
			when "11011" =>
				i3<= DWR;
				
			when "11100" =>
				i4 <= DWR;
				
			when "11101" =>
				i5 <= DWR;
				
			when "11110" =>
				i6 <= DWR;
				
			when others =>
				i7 <= DWR;
				
		end case;
		
	end if;

end process;
	
	


	CRs1 <= CRs1_aux;
	CRs2 <= CRs2_aux;

end Behavioral;

