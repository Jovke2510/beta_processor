library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers_tb is 
end registers_tb;

architecture Behavioral of registers_tb is
	
	component registers
	port(
		iCLK  : in STD_LOGIC; 
	   inRST : in STD_LOGIC;
	   iD 	: in STD_LOGIC_VECTOR (31 downto 0 );
	   iWE	: in STD_LOGIC;
	   oQ 	: out STD_LOGIC_VECTOR (31 downto 0 )
		);
	end component;

	signal iCLK  	: std_logic := '0';
	signal inRST  	: std_logic := '0';
	signal iD  		: std_logic_vector (31 downto 0) := (others => '0');
	signal iWE  	: std_logic := '0';
	signal oQ  		: std_logic_vector (31 downto 0);
	
	constant iCLK_period : time := 10 ns;
	
begin
	
	uut: registers port map (
				iCLK => iCLK,
				inRST => inRST,
				iD => iD,
				iWE => iWE,
				oQ => oQ
			);
			
	iCLK_proc: process
	begin
		iCLK <= '0';
		wait for iCLK_period/2;
		iCLK <= '1';
		wait for iCLK_period/2;
	end process;
			
	stim_proc: process
	begin
		 wait for 10 ns;
        
        inRST <= '1';
        wait for 10 ns;
        
        inRST <= '0';
        wait for 10 ns;
        
        iD <= "01010101010101010101010101010101";
        iWE <= '1';
        wait for 10 ns;
       
        
        iD <= "10101010101010101010101010101010";
       
        wait for 10 ns;
        
        
        
        iD <= "00001111000011110000111100001111";
        
        wait for 10 ns;
        
        
        
        iD <= "11110000111100001111000011110000";
   
        wait for 10 ns;
        
        iWE <= '0';
        wait for 10 ns;
        
        wait;
	end process;
end;