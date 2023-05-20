library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcsel_mux is 
	Port ( iD0 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD1 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD2 : in STD_LOGIC_VECTOR (31 downto 0);
			 iSEL : in STD_LOGIC_VECTOR (1 downto 0);
			 oQ : out STD_LOGIC_VECTOR (31 downto 0));
end pcsel_mux;

architecture Behavioral of pcsel_mux is

begin

	oQ <= iD0 when iSEL = "000" else
			iD1 when iSEL = "001" else
			iD2 when iSEL = "010" else
			(others => '0');
			
end Behavioral;
