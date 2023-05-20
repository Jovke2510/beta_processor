library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_register is 
	Generic ( WIDTH : integer := 32);
	Port ( iCLK : in STD_LOGIC; 
			 inRST : in STD_LOGIC;
			 iD : in STD_LOGIC_VECTOR (WIDTH-1 downto 0 );
			 oQ : out STD_LOGIC_VECTOR (WIDTH-1 downto 0 ));
end pc_register;

architecture Behavioral of pc_register is
	signal sREG : std_logic_vector (WIDTH-1 downto 0);
	
begin

	process(iCLK, inRST) begin
		if(inRST = '1') then
			sREG <= (others => '0');
		elsif(iCLK'event and iCLK = '1') then
				sREG <= iD;
		end if;
	end process;
	
	oQ <= sREG;
	
end Behavioral;