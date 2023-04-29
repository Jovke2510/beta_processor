library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_zero is 
	Generic ( WIDTH : integer := 32);
	Port ( iCLK : in STD_LOGIC; 
			 inRST : in STD_LOGIC;
			 iD : in STD_LOGIC_VECTOR (WIDTH-1 downto 0 );
			 iWE : in STD_LOGIC;
			 oQ : out STD_LOGIC_VECTOR (WIDTH-1 downto 0 ));
end register_zero;

architecture Behavioral of register_zero is
	signal sREG : std_logic_vector (WIDTH-1 downto 0);
	
begin

	process(iCLK, inRST) begin
		if(inRST = '1') then
			sREG <= (others => '0');
		elsif(iCLK'event and iCLK = '1') then
			if(iWE = '1') then
				sREG <= (others => '0');
			end if;
		end if;
	end process;
	
	oQ <= sREG;
	
end Behavioral;