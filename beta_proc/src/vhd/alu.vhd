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

	signal sA : std_logic_vector(WIDTH-1 downto 0);
	signal sB : std_logic_vector(WIDTH-1 downto 0);
	signal sQ : std_logic_vector(WIDTH-1 downto 0);

begin

	sA <= iA;
	sB <= iB;
	
	process (iALUFN, sA, sB) 
	begin
		if(iALUFN = "100000") then
			sQ <= sA + sB;
			
		elsif(iALUFN = "100001") then
			sQ <= sA - sB;
			
		elsif(iALUFN = "100100" and sA = sB) then
			sQ <= x"00000001";
			
		elsif(iALUFN = "100100" and sA /= sB) then
			sQ <= (others => '0');
			
		elsif(iALUFN = "100101" and sA < sB) then
			sQ <= x"00000001";
			
		elsif(iALUFN = "100101" and sA >= sB) then
			sQ <= (others => '0');
			
		elsif(iALUFN = "100110" and sA <= sB) then
			sQ <= x"00000001";
			
		elsif(iALUFN = "100110" and sA > sB) then
			sQ <= (others => '0');
			
		elsif(iALUFN = "101000") then
			sQ <= sA and sB;
			
		elsif(iALUFN = "101001") then
			sQ <= sA or sB;
			
		elsif(iALUFN = "101010") then 
			sQ <= sA xor sB;
			
		elsif(iALUFN = "101011") then
			sQ <= sA xnor sB;
			
		elsif(iALUFN = "101100") then
			if(sB(4 downto 0) = "00000") then
				sQ <= sA;
			elsif(sB(4 downto 0) = "00001") then
				sQ <= sA(30 downto 0) & '0';
			elsif(sB(4 downto 0) = "00010") then
				sQ <= sA(29 downto 0) & "00";
			elsif(sB(4 downto 0) = "00011") then
				sQ <= sA(28 downto 0) & "000";
			elsif(sB(4 downto 0) = "00100") then
				sQ <= sA(27 downto 0) & "0000";
			elsif(sB(4 downto 0) = "00101") then
				sQ <= sA(26 downto 0) & "00000";
			elsif(sB(4 downto 0) = "00110") then
				sQ <= sA(25 downto 0) & "000000";
			elsif(sB(4 downto 0) = "00111") then
				sQ <= sA(24 downto 0) & "0000000";
			elsif(sB(4 downto 0) = "01000") then
				sQ <= sA(23 downto 0) & "00000000";
			elsif(sB(4 downto 0) = "01001") then
				sQ <= sA(22 downto 0) & "000000000";
			elsif(sB(4 downto 0) = "01010") then
				sQ <= sA(21 downto 0) & "0000000000";
			elsif(sB(4 downto 0) = "01011") then
				sQ <= sA(20 downto 0) & "00000000000";
			elsif(sB(4 downto 0) = "01100") then
				sQ <= sA(19 downto 0) & "000000000000";
			elsif(sB(4 downto 0) = "01101") then
				sQ <= sA(18 downto 0) & "0000000000000";
			elsif(sB(4 downto 0) = "01110") then
				sQ <= sA(17 downto 0) & "00000000000000";
			elsif(sB(4 downto 0) = "01111") then
				sQ <= sA(16 downto 0) & "000000000000000";
			elsif(sB(4 downto 0) = "10000") then
				sQ <= sA(15 downto 0) & "0000000000000000";
			elsif(sB(4 downto 0) = "10001") then
				sQ <= sA(14 downto 0) & "00000000000000000";
			elsif(sB(4 downto 0) = "10010") then
				sQ <= sA(13 downto 0) & "000000000000000000";
			elsif(sB(4 downto 0) = "10011") then
				sQ <= sA(12 downto 0) & "0000000000000000000";
			elsif(sB(4 downto 0) = "10100") then
				sQ <= sA(11 downto 0) & "00000000000000000000";
			elsif(sB(4 downto 0) = "10101") then
				sQ <= sA(10 downto 0) & "000000000000000000000";
			elsif(sB(4 downto 0) = "10110") then
				sQ <= sA(9 downto 0) & "00000000000000000000000";
			elsif(sB(4 downto 0) = "10111") then
				sQ <= sA(8 downto 0) & "000000000000000000000000";
			elsif(sB(4 downto 0) = "11000") then
				sQ <= sA(7 downto 0) & "0000000000000000000000000";
			elsif(sB(4 downto 0) = "11001") then
				sQ <= sA(6 downto 0) & "00000000000000000000000000";
			elsif(sB(4 downto 0) = "11010") then
				sQ <= sA(5 downto 0) & "000000000000000000000000000";
			elsif(sB(4 downto 0) = "11011") then
				sQ <= sA(4 downto 0) & "0000000000000000000000000000";
			elsif(sB(4 downto 0) = "11100") then
				sQ <= sA(4 downto 0) & "00000000000000000000000000000";
			elsif(sB(4 downto 0) = "11101") then
				sQ <= sA(2 downto 0) & "000000000000000000000000000000";
			elsif(sB(4 downto 0) = "11110") then
				sQ <= sA(1 downto 0) & "0000000000000000000000000000000";
			else
				sQ <= (others => '0');
			end if;
			
		elsif(iALUFN = "101101") then
			if(sB(4 downto 0) = "00000") then
				sQ <= sA;
			elsif(sB(4 downto 0) = "00001") then
				sQ <= '0' & sA(31 downto 1);
			elsif(sB(4 downto 0) = "00010") then
				sQ <= "00" & sA(31 downto 2);
			elsif(sB(4 downto 0) = "00011") then
				sQ <= "000" & sA(31 downto 3);
			elsif(sB(4 downto 0) = "00100") then
				sQ <= "0000" & sA(31 downto 4);
			elsif(sB(4 downto 0) = "00101") then
				sQ <= "00000" & sA(31 downto 5);
			elsif(sB(4 downto 0) = "00110") then
				sQ <= "000000" & sA(31 downto 6);
			elsif(sB(4 downto 0) = "00111") then
				sQ <= "0000000" & sA(31 downto 7);
			elsif(sB(4 downto 0) = "01000") then
				sQ <= "00000000" & sA(31 downto 8);
			elsif(sB(4 downto 0) = "01001") then
				sQ <= "000000000" & sA(31 downto 9);
			elsif(sB(4 downto 0) = "01010") then
				sQ <= "0000000000" & sA(31 downto 10);
			elsif(sB(4 downto 0) = "01011") then
				sQ <= "00000000000" & sA(31 downto 11);
			elsif(sB(4 downto 0) = "01100") then
				sQ <= "000000000000" & sA(31 downto 12);
			elsif(sB(4 downto 0) = "01101") then
				sQ <= "0000000000000" & sA(31 downto 13);
			elsif(sB(4 downto 0) = "01110") then
				sQ <= "00000000000000" & sA(31 downto 14);
			elsif(sB(4 downto 0) = "01111") then
				sQ <= "000000000000000" & sA(31 downto 15);
			elsif(sB(4 downto 0) = "10000") then
				sQ <= "0000000000000000" & sA(31 downto 16);
			elsif(sB(4 downto 0) = "10001") then
				sQ <= "00000000000000000" & sA(31 downto 17);
			elsif(sB(4 downto 0) = "10010") then
				sQ <= "000000000000000000" & sA(31 downto 18);
			elsif(sB(4 downto 0) = "10011") then
				sQ <= "0000000000000000000" & sA(31 downto 19);
			elsif(sB(4 downto 0) = "10100") then
				sQ <= "00000000000000000000" & sA(31 downto 20);
			elsif(sB(4 downto 0) = "10101") then
				sQ <= "000000000000000000000" & sA(31 downto 21);
			elsif(sB(4 downto 0) = "10110") then
				sQ <= "0000000000000000000000" & sA(31 downto 22);
			elsif(sB(4 downto 0) = "10111") then
				sQ <= "00000000000000000000000" & sA(31 downto 23);
			elsif(sB(4 downto 0) = "11000") then
				sQ <= "000000000000000000000000" & sA(31 downto 24);
			elsif(sB(4 downto 0) = "11001") then
				sQ <= "0000000000000000000000000" & sA(31 downto 25);
			elsif(sB(4 downto 0) = "11010") then
				sQ <= "00000000000000000000000000" & sA(31 downto 26);
			elsif(sB(4 downto 0) = "11011") then
				sQ <= "000000000000000000000000000" & sA(31 downto 27);
			elsif(sB(4 downto 0) = "11100") then
				sQ <= "0000000000000000000000000000" & sA(31 downto 28);
			elsif(sB(4 downto 0) = "11101") then
				sQ <= "00000000000000000000000000000" & sA(31 downto 29);
			elsif(sB(4 downto 0) = "11110") then
				sQ <= "000000000000000000000000000000" & sA(31 downto 30);
			else
				sQ <= (others => '0');
			end if;
				
		elsif(iALUFN = "101110") then
			if(sB(4 downto 0) = "00000") then
				sQ <= sA;
			elsif(sB(4 downto 0) = "00001") then
				sQ <= sA(31) & sA(31 downto 1);
			elsif(sB(4 downto 0) = "00010") then
				sQ <= sA(31) & sA(31) & sA(31 downto 2);
			elsif(sB(4 downto 0) = "00011") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31 downto 3);
			elsif(sB(4 downto 0) = "00100") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 4);
			elsif(sB(4 downto 0) = "00101") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 5);
			elsif(sB(4 downto 0) = "00110") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 6);
			elsif(sB(4 downto 0) = "00111") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 7);
			elsif(sB(4 downto 0) = "01000") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 8);
			elsif(sB(4 downto 0) = "01001") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 9);
			elsif(sB(4 downto 0) = "01010") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 10);
			elsif(sB(4 downto 0) = "01011") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 11);
			elsif(sB(4 downto 0) = "01100") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 12);
			elsif(sB(4 downto 0) = "01101") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 13);
			elsif(sB(4 downto 0) = "01110") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 14);
			elsif(sB(4 downto 0) = "01111") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 15);
			elsif(sB(4 downto 0) = "10000") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 16);
			elsif(sB(4 downto 0) = "10001") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 17);
			elsif(sB(4 downto 0) = "10010") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 18);
			elsif(sB(4 downto 0) = "10011") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 19);
			elsif(sB(4 downto 0) = "10100") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 20);
			elsif(sB(4 downto 0) = "10101") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 21);
			elsif(sB(4 downto 0) = "10110") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 22);
			elsif(sB(4 downto 0) = "10111") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 23);
			elsif(sB(4 downto 0) = "11000") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 24);
			elsif(sB(4 downto 0) = "11001") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 25);
			elsif(sB(4 downto 0) = "11010") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 26);
			elsif(sB(4 downto 0) = "11011") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 27);
			elsif(sB(4 downto 0) = "11100") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 28);
			elsif(sB(4 downto 0) = "11101") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 29);
			elsif(sB(4 downto 0) = "11110") then
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31 downto 30);
			else
				sQ <= sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31) & sA(31);
			end if;
		
		else
			sQ <= (others => '0');
		
		end if;
		
	
	end process;
	
	oQ <= sQ;
		
end architecture;