library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rw_sel_mux is 
	Port ( iD0 : in STD_LOGIC_VECTOR (3 downto 0);
			 iD1 : in STD_LOGIC_VECTOR (3 downto 0);
			 iSEL : in STD_LOGIC;
			 oQ : out STD_LOGIC_VECTOR (3 downto 0));
end rw_sel_mux;

architecture Behavioral of rw_sel_mux is

begin

	oQ <= iD0 when iSEL = '0' else
			iD1;
			
end Behavioral;
