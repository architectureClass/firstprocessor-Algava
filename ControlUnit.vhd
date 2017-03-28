----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:46 03/27/2017 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( OP3 : in  STD_LOGIC_VECTOR(5 downto 0);
           OP : in  STD_LOGIC_VECTOR(1 downto 0);
           ALUop : out  STD_LOGIC_VECTOR(5 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

	signal ALUop_aux : STD_LOGIC_VECTOR(5 downto 0);

begin
	
	process(OP3,OP)
	
	begin 
	
		case (OP) is
			when "10" =>
				
				case (OP3) is
					when "000000" =>
					ALUop_aux <= "000000";
					when others =>
					ALUop_aux <= "111111";
				end case;
				
			when others =>
				
				ALUop_aux <= "111111";
				
		end case;
	
	end process;

	ALUop <= ALUop_aux;

end Behavioral;

