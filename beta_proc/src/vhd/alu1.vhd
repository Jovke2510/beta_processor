library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	Generic ( WIDTH : integer := 32);
	port(
		iA			: in std_logic_vector (WIDTH-1 downto 0);
		iB			: in std_logic_vector (WIDTH-1 downto 0);
		iALUFN	: in std_logic_vector (5 downto 0);
		oQ			: out std_logic_vector(WIDTH-1 downto 0)
	);
end entity alu;

architecture arch of alu is
	
begin

	oQ <= sA + sB 				when iALUFN = "100000" else
			sA - sB 				when iALUFN = "100001" else
			x"00000001"			when iALUFN = "100100" and sA = sB else
			(others => '0')	when iALUFN = "100100" and sA /= sB else
			x"00000001"			when iALUFN = "100101" and sA < sB else
			(others => '0')	when iALUFN = "100101" and sA >= sB else
			x"00000001"			when iALUFN = "100110" and sA <= sB else
			(others => '0') 	when iALUFN = "100110" and sA > sB else
			sA and sB			when iALUFN = "101000" else
			sA or sB				when iALUFN = "101001" else
			sA xor sB 			when iALUFN = "101010" else
			sA xnor sB			when iALUFN = "101011" else
			sA						when iALUFN = "101100" and sB(4 downto 0) = "00000" else
			sA(30 downto 0) & '0' when iALUFN = "101100" and sB(4 downto 0) = "00001" else
			sA(29 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00010" else
			sA(28 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00011" else
			sA(27 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00100" else
			sA(26 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00101" else
			sA(25 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00110" else
			sA(24 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "00111" else
			sA(23 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01000" else
			sA(22 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01001" else
			sA(21 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01010" else
			sA(20 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01011" else
			sA(19 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01100" else
			sA(18 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01101" else
			sA(17 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01110" else
			sA(16 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "01111" else
			sA(15 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10000" else
			sA(14 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10001" else
			sA(13 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10010" else
			sA(12 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10011" else
			sA(11 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10100" else
			sA(10 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10101" else
			sA(9 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "10110" else
			sA(8 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11000" else
			sA(7 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11001" else
			sA(6 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11010" else
			sA(5 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11011" else
			sA(4 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11100" else
			sA(3 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11101" else
			sA(2 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11110" else
			sA(1 downto 0) & "00" when iALUFN = "101100" and sB(4 downto 0) = "11111" else
			(others => '0') when iALUFN = "101100" and sB(4 downto 0) = "00010" else
			
			


end architecture;