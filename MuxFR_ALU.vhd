----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:26 03/30/2017 
-- Design Name: 
-- Module Name:    MuxFR_ALU - Behavioral 
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

entity MuxFR_ALU is
    Port ( CRs2_in : in  STD_LOGIC_VECTOR(31 downto 0);
           Imm : in  STD_LOGIC_VECTOR(31 downto 0);
			  i : in STD_LOGIC;
           CRs2_out : out  STD_LOGIC_VECTOR( 31 downto 0));
end MuxFR_ALU;

architecture Behavioral of MuxFR_ALU is

	signal CRs2_out_aux : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

	process(CRs2_in, Imm, i)
	
	begin
			
		if (i = '0') then
		
			CRs2_out_aux <= CRs2_in;
		
		elsif (i = '1') then
		
			CRs2_out_aux <= Imm;		
		
		end if;
		
	end process;

	CRs2_out <= CRs2_out_aux;

end Behavioral;

