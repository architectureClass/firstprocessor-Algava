----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:34 03/30/2017 
-- Design Name: 
-- Module Name:    SEU - Behavioral 
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

entity SEU is
    Port ( Imm13_in : in  STD_LOGIC_VECTOR(12 downto 0);
           Imm_out : out  STD_LOGIC_VECTOR(31 downto 0));
end SEU;

architecture Behavioral of SEU is

	signal Imm_out_aux : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	constant plus : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
	constant minus : STD_LOGIC_VECTOR(18 downto 0) := (others => '1');

begin
	
	process(Imm13_in)
	
	begin
		
		if(Imm13_in(12) = '0') then
		
			Imm_out_aux <= plus&Imm13_in;
		
		elsif(Imm13_in(12) = '1') then
		
			Imm_out_aux <= minus&Imm13_in;
		
		end if;
	
	end process;
	
	Imm_out <= Imm_out_aux;

end Behavioral;

