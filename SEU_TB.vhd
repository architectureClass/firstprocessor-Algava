--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:27:53 03/30/2017
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/pp/pp/SEU_TB.vhd
-- Project Name:  pp
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SEU_TB IS
END SEU_TB;
 
ARCHITECTURE behavior OF SEU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         Imm13_in : IN  std_logic_vector(12 downto 0);
         Imm_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm13_in : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Imm_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          Imm13_in => Imm13_in,
          Imm_out => Imm_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      Imm13_in <= "1111111111001";
      wait for 100 ns;

		Imm13_in <= "0000000111001";
      wait for 100 ns;
		
		Imm13_in <= "1011010111001";
      wait for 100 ns;

      wait;
   end process;

END;
