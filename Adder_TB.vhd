--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:04 03/21/2017
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/Projecto/Primerosmoludos/Adder_TB.vhd
-- Project Name:  Primerosmoludos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Adder_TB IS
END Adder_TB;
 
ARCHITECTURE behavior OF Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         OP1 : IN  std_logic_vector(31 downto 0);
         OP2 : IN  std_logic_vector(31 downto 0);
         RESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          OP1 => OP1,
          OP2 => OP2,
          RESULT => RESULT
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		OP1 <= "11111111111111110000000000000000";
		OP2 <= "00000000000000000000000000000001";
      wait for 100 ns;
		
		OP1 <= "11111111111111111111111111111101";
		OP2 <= "11111111111111111111111111111101";
      wait for 100 ns;
		

      wait;
   end process;

END;
