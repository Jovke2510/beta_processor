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
	
	process (iALUFN, iA, iB) 
	begin
		if(iALUFN = "100000") then
			oQ <= iA + iB;
			
		elsif(iALUFN = "100001") then
			oQ <= iA - iB;
			
		elsif(iALUFN = "100100" and iA = iB) then
			oQ <= x"00000001";
			
		elsif(iALUFN = "100100" and iA /= iB) then
			oQ <= (others => '0');
			
		elsif(iALUFN = "100101" and iA < iB) then
			oQ <= x"00000001";
			
		elsif(iALUFN = "100101" and iA >= iB) then
			oQ <= (others => '0');
			
		elsif(iALUFN = "100110" and iA <= iB) then
			oQ <= x"00000001";
			
		elsif(iALUFN = "100110" and iA > iB) then
			oQ <= (others => '0');
			
		elsif(iALUFN = "101000") then
			oQ <= iA and iB;
			
		elsif(iALUFN = "101001") then
			oQ <= iA or iB;
			
		elsif(iALUFN = "101010") then 
			oQ <= iA xor iB;
			
		elsif(iALUFN = "101011") then
			oQ <= iA xnor iB;
			
		elsif(iALUFN = "101100") then
			if(iB(4 downto 0) = "00000") then
				oQ <= iA;
			elsif(iB(4 downto 0) = "00001") then
				oQ <= iA(30 downto 0) & '0';
			elsif(iB(4 downto 0) = "00010") then
				oQ <= iA(29 downto 0) & "00";
			elsif(iB(4 downto 0) = "00011") then
				oQ <= iA(28 downto 0) & "000";
			elsif(iB(4 downto 0) = "00100") then
				oQ <= iA(27 downto 0) & "0000";
			elsif(iB(4 downto 0) = "00101") then
				oQ <= iA(26 downto 0) & "00000";
			elsif(iB(4 downto 0) = "00110") then
				oQ <= iA(25 downto 0) & "000000";
			elsif(iB(4 downto 0) = "00111") then
				oQ <= iA(24 downto 0) & "0000000";
			elsif(iB(4 downto 0) = "01000") then
				oQ <= iA(23 downto 0) & "00000000";
			elsif(iB(4 downto 0) = "01001") then
				oQ <= iA(22 downto 0) & "000000000";
			elsif(iB(4 downto 0) = "01010") then
				oQ <= iA(21 downto 0) & "0000000000";
			elsif(iB(4 downto 0) = "01011") then
				oQ <= iA(20 downto 0) & "00000000000";
			elsif(iB(4 downto 0) = "01100") then
				oQ <= iA(19 downto 0) & "000000000000";
			elsif(iB(4 downto 0) = "01101") then
				oQ <= iA(18 downto 0) & "0000000000000";
			elsif(iB(4 downto 0) = "01110") then
				oQ <= iA(17 downto 0) & "00000000000000";
			elsif(iB(4 downto 0) = "01111") then
				oQ <= iA(16 downto 0) & "000000000000000";
			elsif(iB(4 downto 0) = "10000") then
				oQ <= iA(15 downto 0) & "0000000000000000";
			elsif(iB(4 downto 0) = "10001") then
				oQ <= iA(14 downto 0) & "00000000000000000";
			elsif(iB(4 downto 0) = "10010") then
				oQ <= iA(13 downto 0) & "000000000000000000";
			elsif(iB(4 downto 0) = "10011") then
				oQ <= iA(12 downto 0) & "0000000000000000000";
			elsif(iB(4 downto 0) = "10100") then
				oQ <= iA(11 downto 0) & "00000000000000000000";
			elsif(iB(4 downto 0) = "10101") then
				oQ <= iA(10 downto 0) & "000000000000000000000";
			elsif(iB(4 downto 0) = "10110") then
				oQ <= iA(9 downto 0) & "00000000000000000000000";
			elsif(iB(4 downto 0) = "10111") then
				oQ <= iA(8 downto 0) & "000000000000000000000000";
			elsif(iB(4 downto 0) = "11000") then
				oQ <= iA(7 downto 0) & "0000000000000000000000000";
			elsif(iB(4 downto 0) = "11001") then
				oQ <= iA(6 downto 0) & "00000000000000000000000000";
			elsif(iB(4 downto 0) = "11010") then
				oQ <= iA(5 downto 0) & "000000000000000000000000000";
			elsif(iB(4 downto 0) = "11011") then
				oQ <= iA(4 downto 0) & "0000000000000000000000000000";
			elsif(iB(4 downto 0) = "11100") then
				oQ <= iA(4 downto 0) & "00000000000000000000000000000";
			elsif(iB(4 downto 0) = "11101") then
				oQ <= iA(2 downto 0) & "000000000000000000000000000000";
			elsif(iB(4 downto 0) = "11110") then
				oQ <= iA(1 downto 0) & "0000000000000000000000000000000";
			else
				oQ <= (others => '0');
			end if;
			
		elsif(iALUFN = "101101") then
			if(iB(4 downto 0) = "00000") then
				oQ <= iA;
			elsif(iB(4 downto 0) = "00001") then
				oQ <= '0' & iA(31 downto 1);
			elsif(iB(4 downto 0) = "00010") then
				oQ <= "00" & iA(31 downto 2);
			elsif(iB(4 downto 0) = "00011") then
				oQ <= "000" & iA(31 downto 3);
			elsif(iB(4 downto 0) = "00100") then
				oQ <= "0000" & iA(31 downto 4);
			elsif(iB(4 downto 0) = "00101") then
				oQ <= "00000" & iA(31 downto 5);
			elsif(iB(4 downto 0) = "00110") then
				oQ <= "000000" & iA(31 downto 6);
			elsif(iB(4 downto 0) = "00111") then
				oQ <= "0000000" & iA(31 downto 7);
			elsif(iB(4 downto 0) = "01000") then
				oQ <= "00000000" & iA(31 downto 8);
			elsif(iB(4 downto 0) = "01001") then
				oQ <= "000000000" & iA(31 downto 9);
			elsif(iB(4 downto 0) = "01010") then
				oQ <= "0000000000" & iA(31 downto 10);
			elsif(iB(4 downto 0) = "01011") then
				oQ <= "00000000000" & iA(31 downto 11);
			elsif(iB(4 downto 0) = "01100") then
				oQ <= "000000000000" & iA(31 downto 12);
			elsif(iB(4 downto 0) = "01101") then
				oQ <= "0000000000000" & iA(31 downto 13);
			elsif(iB(4 downto 0) = "01110") then
				oQ <= "00000000000000" & iA(31 downto 14);
			elsif(iB(4 downto 0) = "01111") then
				oQ <= "000000000000000" & iA(31 downto 15);
			elsif(iB(4 downto 0) = "10000") then
				oQ <= "0000000000000000" & iA(31 downto 16);
			elsif(iB(4 downto 0) = "10001") then
				oQ <= "00000000000000000" & iA(31 downto 17);
			elsif(iB(4 downto 0) = "10010") then
				oQ <= "000000000000000000" & iA(31 downto 18);
			elsif(iB(4 downto 0) = "10011") then
				oQ <= "0000000000000000000" & iA(31 downto 19);
			elsif(iB(4 downto 0) = "10100") then
				oQ <= "00000000000000000000" & iA(31 downto 20);
			elsif(iB(4 downto 0) = "10101") then
				oQ <= "000000000000000000000" & iA(31 downto 21);
			elsif(iB(4 downto 0) = "10110") then
				oQ <= "0000000000000000000000" & iA(31 downto 22);
			elsif(iB(4 downto 0) = "10111") then
				oQ <= "00000000000000000000000" & iA(31 downto 23);
			elsif(iB(4 downto 0) = "11000") then
				oQ <= "000000000000000000000000" & iA(31 downto 24);
			elsif(iB(4 downto 0) = "11001") then
				oQ <= "0000000000000000000000000" & iA(31 downto 25);
			elsif(iB(4 downto 0) = "11010") then
				oQ <= "00000000000000000000000000" & iA(31 downto 26);
			elsif(iB(4 downto 0) = "11011") then
				oQ <= "000000000000000000000000000" & iA(31 downto 27);
			elsif(iB(4 downto 0) = "11100") then
				oQ <= "0000000000000000000000000000" & iA(31 downto 28);
			elsif(iB(4 downto 0) = "11101") then
				oQ <= "00000000000000000000000000000" & iA(31 downto 29);
			elsif(iB(4 downto 0) = "11110") then
				oQ <= "000000000000000000000000000000" & iA(31 downto 30);
			else
				oQ <= (others => '0');
			end if;
				
		elsif(iALUFN = "101110") then
			if(iB(4 downto 0) = "00000") then
				oQ <= iA;
			elsif(iB(4 downto 0) = "00001") then
				oQ <= iA(31) & iA(31 downto 1);
			elsif(iB(4 downto 0) = "00010") then
				oQ <= iA(31) & iA(31) & iA(31 downto 2);
			elsif(iB(4 downto 0) = "00011") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31 downto 3);
			elsif(iB(4 downto 0) = "00100") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 4);
			elsif(iB(4 downto 0) = "00101") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 5);
			elsif(iB(4 downto 0) = "00110") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 6);
			elsif(iB(4 downto 0) = "00111") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 7);
			elsif(iB(4 downto 0) = "01000") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 8);
			elsif(iB(4 downto 0) = "01001") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 9);
			elsif(iB(4 downto 0) = "01010") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 10);
			elsif(iB(4 downto 0) = "01011") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 11);
			elsif(iB(4 downto 0) = "01100") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 12);
			elsif(iB(4 downto 0) = "01101") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 13);
			elsif(iB(4 downto 0) = "01110") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 14);
			elsif(iB(4 downto 0) = "01111") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 15);
			elsif(iB(4 downto 0) = "10000") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 16);
			elsif(iB(4 downto 0) = "10001") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 17);
			elsif(iB(4 downto 0) = "10010") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 18);
			elsif(iB(4 downto 0) = "10011") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 19);
			elsif(iB(4 downto 0) = "10100") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 20);
			elsif(iB(4 downto 0) = "10101") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 21);
			elsif(iB(4 downto 0) = "10110") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 22);
			elsif(iB(4 downto 0) = "10111") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 23);
			elsif(iB(4 downto 0) = "11000") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 24);
			elsif(iB(4 downto 0) = "11001") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 25);
			elsif(iB(4 downto 0) = "11010") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 26);
			elsif(iB(4 downto 0) = "11011") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 27);
			elsif(iB(4 downto 0) = "11100") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 28);
			elsif(iB(4 downto 0) = "11101") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 29);
			elsif(iB(4 downto 0) = "11110") then
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31 downto 30);
			else
				oQ <= iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31) & iA(31);
			end if;
		
		else
			oQ <= (others => '0');
		
		end if;
		
	end process;
	
		
end architecture;