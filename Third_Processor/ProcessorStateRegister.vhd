library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProcessorStateRegister is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  CLK : in STD_LOGIC;
           rst : in  STD_LOGIC;
           Carry : out  STD_LOGIC := '0' );
end ProcessorStateRegister;

architecture Behavioral of ProcessorStateRegister is
	
	signal PSR : std_logic_vector(31 downto 0) := (others => '0');

begin
	
	process(CLK)	
	begin
	
		if rising_edge(CLK) then
			if (rst = '1') then
				PSR <= (others => '0');
			else
				
				PSR(23 downto 20) <= nzvc;
				
			end if;
		
		end if;
		
	end process;
	
	Carry <= PSR(20);

end Behavioral;

