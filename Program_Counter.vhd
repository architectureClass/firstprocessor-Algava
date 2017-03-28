----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:26 03/21/2017 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
    Port ( Data : in  STD_LOGIC_VECTOR(31 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR(31 downto 0) );
end Program_Counter;

architecture Behavioral of Program_Counter is

	signal DataOut_aux : STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');

begin

process(CLK,Data,RST)

begin
	
	if (RST = '1') then
	
		DataOut_aux <= (others =>'0');
		
	else
	
		if rising_edge(CLK) then
		
			DataOut_aux <= Data;
	
		end if;
		
	end if;
	
end process;

	DataOut <= DataOut_aux;

end Behavioral;

