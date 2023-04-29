library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_mux is 
	Port ( iD0 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD1 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD2 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD3 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD4 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD5 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD6 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD7 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD8 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD9 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD10 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD11 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD12 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD13 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD14 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD15 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD16 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD17 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD18 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD19 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD20 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD21 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD22 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD23 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD24 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD25 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD26 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD27 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD28 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD29 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD30 : in STD_LOGIC_VECTOR (31 downto 0);
			 iD31 : in STD_LOGIC_VECTOR (31 downto 0);
			 iSEL : in STD_LOGIC_VECTOR (4 downto 0);
			 oQ : out STD_LOGIC_VECTOR (31 downto 0));
end register_mux;

architecture Behavioral of register_mux is

begin

	oQ <= iD0 when iSEL = "00000" else
			iD1 when iSEL = "00001" else
			iD2 when iSEL = "00010" else
			iD3 when iSEL = "00011" else
			iD4 when iSEL = "00100" else
			iD5 when iSEL = "00101" else
			iD6 when iSEL = "00110" else
			iD7 when iSEL = "00111" else
			iD8 when iSEL = "01000" else
			iD9 when iSEL = "01001" else
			iD10 when iSEL = "01010" else
			iD11 when iSEL = "01011" else
			iD12 when iSEL = "01100" else
			iD13 when iSEL = "01101" else
			iD14 when iSEL = "01110" else
			iD15 when iSEL = "01111" else
			iD16 when iSEL = "10000" else
			iD17 when iSEL = "10001" else
			iD18 when iSEL = "10010" else
			iD19 when iSEL = "10011" else
			iD20 when iSEL = "10100" else
			iD21 when iSEL = "10101" else
			iD22 when iSEL = "10110" else
			iD23 when iSEL = "10111" else
			iD24 when iSEL = "11000" else
			iD25 when iSEL = "11001" else
			iD26 when iSEL = "11010" else
			iD27 when iSEL = "11011" else
			iD28 when iSEL = "11100" else
			iD29 when iSEL = "11101" else
			iD30 when iSEL = "11110" else
			iD31 when iSEL = "11111" else
			(others => '0');
		
end Behavioral;
