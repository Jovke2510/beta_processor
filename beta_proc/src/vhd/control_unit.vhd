library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity control_unit is
	Generic ( WIDTH : integer := 32);
	port(
		inRST		: in std_logic;
		iIRQ		: in std_logic;
		iZ			: in std_logic;
		iD			: in std_logic_vector (WIDTH-1 downto 0);
		oALUFN	: out	std_logic_vector(5 downto 0);
		oASEL		: out std_logic;
		oBSEL		: out	std_logic;
		oMOE		: out	std_logic;
		oMWR		: out	std_logic;
		oPCSEL	: out	std_logic_vector(2 downto 0);
		oRA2SEL	: out std_logic;
		oWASEL	: out std_logic;
		oWDSEL	: out	std_logic_vector(1 downto 0);
		oWERF		: out	std_logic
	
	);
end control_unit;
		
		
		
architecture arch of control_unit is
	signal sInstr		:	std_logic_vector(5 downto 0);
	signal sZ			:  std_logic;
	-- Declarations (optional)

begin
	sInstr 	<= iD(31 downto 26);
	sZ			<= iZ;
	
	oALUFN <= 
		-----OP
		"100000" when	sInstr = "100000" else
		"100001" when	sInstr = "100001" else
		"100100" when	sInstr = "100100" else
		"100101" when	sInstr = "100101" else
		"100110" when	sInstr = "100110" else
		"101000" when	sInstr = "101000" else
		"101001" when	sInstr = "101001" else
		"101010" when	sInstr = "101010" else
		"101011" when	sInstr = "101011" else
		"101100" when	sInstr = "101100" else
		"101101" when 	sInstr = "101101" else
		"101110" when  sInstr = "101110" else
		-----OPC
		"100000" when	sInstr = "110000" else
		"100001" when	sInstr = "110001" else
		"100100" when	sInstr = "110100" else
		"100101" when	sInstr = "110101" else
		"100110" when	sInstr = "110110" else
		"101000" when	sInstr = "111000" else
		"101001" when	sInstr = "111001" else
		"101010" when	sInstr = "111010" else
		"101011" when	sInstr = "111011" else
		"101100" when	sInstr = "111100" else
		"101101" when 	sInstr = "111101" else
		"101110" when  sInstr = "111110" else
		-----LD
		"100000" when	sInstr = "011000" else
		-----LDR
		-----		when  sInstr = "011111" else
		-----ST
		"100000" when 	sInstr = "011001" else
		-----
		"------";
	
	oASEL <=
		-----OP
		'0' when sInstr = "100000" else 
		'0' when sInstr = "100001" else
		'0' when sInstr = "100100" else
		'0' when sInstr = "100101" else
		'0' when sInstr = "100110" else
		'0' when sInstr = "101000" else
		'0' when sInstr = "101001" else
		'0' when sInstr = "101010" else
		'0' when sInstr = "101011" else
		'0' when sInstr = "101100" else
		'0' when sInstr = "101101" else
		'0' when sInstr = "101110" else
		-----OPC
		'0' when sInstr = "110000" else 
		'0' when sInstr = "110001" else
		'0' when sInstr = "110100" else
		'0' when sInstr = "110101" else
		'0' when sInstr = "110110" else
		'0' when sInstr = "111000" else
		'0' when sInstr = "111001" else
		'0' when sInstr = "111010" else
		'0' when sInstr = "111011" else
		'0' when sInstr = "111100" else
		'0' when sInstr = "111101" else
		'0' when sInstr = "111110" else
		-----LD
		'0' when sInstr = "011000" else
		-----LDR
		'1' when sInstr = "011111" else
		-----ST
		'0' when sInstr = "011001" else
		'-';
		
	oBSEL <=
		-----OP
		'0' when sInstr = "100000" else 
		'0' when sInstr = "100001" else
		'0' when sInstr = "100100" else
		'0' when sInstr = "100101" else
		'0' when sInstr = "100110" else
		'0' when sInstr = "101000" else
		'0' when sInstr = "101001" else
		'0' when sInstr = "101010" else
		'0' when sInstr = "101011" else
		'0' when sInstr = "101100" else
		'0' when sInstr = "101101" else
		'0' when sInstr = "101110" else
		-----OPC
		'1' when sInstr = "110000" else 
		'1' when sInstr = "110001" else
		'1' when sInstr = "110100" else
		'1' when sInstr = "110101" else
		'1' when sInstr = "110110" else
		'1' when sInstr = "111000" else
		'1' when sInstr = "111001" else
		'1' when sInstr = "111010" else
		'1' when sInstr = "111011" else
		'1' when sInstr = "111100" else
		'1' when sInstr = "111101" else
		'1' when sInstr = "111110" else
		-----LD
		'1' when sInstr = "011000" else
		-----ST
		'1' when sInstr = "011001" else
		'-';
		
	oMOE <=
		-----LD
		'1' when sInstr = "011000" else
		-----LDR
		'1' when sInstr = "011111" else
		-----ST
		'0' when sInstr = "011001" else
		'-';
		
	oMWR <=
		-----RESET
		'0' when inRST  = '1' 		else
		-----IRQ
		'0' when iIRQ 	 = '1' 		else
		-----OP
		'0' when sInstr = "100000" else 
		'0' when sInstr = "100001" else
		'0' when sInstr = "100100" else
		'0' when sInstr = "100101" else
		'0' when sInstr = "100110" else
		'0' when sInstr = "101000" else
		'0' when sInstr = "101001" else
		'0' when sInstr = "101010" else
		'0' when sInstr = "101011" else
		'0' when sInstr = "101100" else
		'0' when sInstr = "101101" else
		'0' when sInstr = "101110" else
		-----OPC
		'0' when sInstr = "110000" else 
		'0' when sInstr = "110001" else
		'0' when sInstr = "110100" else
		'0' when sInstr = "110101" else
		'0' when sInstr = "110110" else
		'0' when sInstr = "111000" else
		'0' when sInstr = "111001" else
		'0' when sInstr = "111010" else
		'0' when sInstr = "111011" else
		'0' when sInstr = "111100" else
		'0' when sInstr = "111101" else
		'0' when sInstr = "111110" else
		-----LD
		'0' when sInstr = "011000" else
		-----LDR
		'0' when sInstr = "011111" else
		-----ST
		'1' when sInstr = "011001" else
		-----JMP
		'0' when sInstr = "011011" else
		-----BEQ
		'0' when sInstr = "011100" else
		-----BNE
		'0' when sInstr = "011101" else
		'0';
		
	oPCSEL <=
		-----IRQ
		"100" when  iIRQ   = '1' 		else
		-----OP
		"000" when	sInstr = "100000" else
		"000" when	sInstr = "100001" else
		"000" when	sInstr = "100100" else
		"000" when	sInstr = "100101" else
		"000" when	sInstr = "100110" else
		"000" when	sInstr = "101000" else
		"000" when	sInstr = "101001" else
		"000" when	sInstr = "101010" else
		"000" when	sInstr = "101011" else
		"000" when	sInstr = "101100" else
		"000" when 	sInstr = "101101" else
		"000" when  sInstr = "101110" else
		-----OPC
		"000" when	sInstr = "110000" else
		"000" when	sInstr = "110001" else
		"000" when	sInstr = "110100" else
		"000" when	sInstr = "110101" else
		"000" when	sInstr = "110110" else
		"000" when	sInstr = "111000" else
		"000" when	sInstr = "111001" else
		"000" when	sInstr = "111010" else
		"000" when	sInstr = "111011" else
		"000" when	sInstr = "111100" else
		"000" when 	sInstr = "111101" else
		"000" when  sInstr = "111110" else
		-----LD
		"000" when  sInstr = "011000" else
		-----LDR
		"000" when  sInstr = "011111" else
		-----ST
		"000" when 	sInstr = "011001" else
		-----JMP
		"010" when  sInstr = "011011" else
		-----BEQ
		"00" & sZ when  sInstr = "011100" else
		-----BNE
		"00" & sZ when  sInstr = "011101" else
		-----ILLOP
		----- "011" when nesto
		"---";
		
	oRA2SEL <=	
		-----OP
		'0' when sInstr = "100000" else 
		'0' when sInstr = "100001" else
		'0' when sInstr = "100100" else
		'0' when sInstr = "100101" else
		'0' when sInstr = "100110" else
		'0' when sInstr = "101000" else
		'0' when sInstr = "101001" else
		'0' when sInstr = "101010" else
		'0' when sInstr = "101011" else
		'0' when sInstr = "101100" else
		'0' when sInstr = "101101" else
		'0' when sInstr = "101110" else
		-----ST
		'1' when sInstr = "011001" else
		'-';
		
	oWASEL <=
		-----IRQ
		'1' when iIRQ 	 = '1' 		else
		-----OP
		'0' when sInstr = "100000" else 
		'0' when sInstr = "100001" else
		'0' when sInstr = "100100" else
		'0' when sInstr = "100101" else
		'0' when sInstr = "100110" else
		'0' when sInstr = "101000" else
		'0' when sInstr = "101001" else
		'0' when sInstr = "101010" else
		'0' when sInstr = "101011" else
		'0' when sInstr = "101100" else
		'0' when sInstr = "101101" else
		'0' when sInstr = "101110" else
		-----OPC
		'0' when sInstr = "110000" else 
		'0' when sInstr = "110001" else
		'0' when sInstr = "110100" else
		'0' when sInstr = "110101" else
		'0' when sInstr = "110110" else
		'0' when sInstr = "111000" else
		'0' when sInstr = "111001" else
		'0' when sInstr = "111010" else
		'0' when sInstr = "111011" else
		'0' when sInstr = "111100" else
		'0' when sInstr = "111101" else
		'0' when sInstr = "111110" else
		-----LD
		'0' when sInstr = "011000" else
		-----LDR
		'0' when sInstr = "011111" else
		-----JMP
		'0' when sInstr = "011011" else
		-----BEQ
		'0' when sInstr = "011100" else
		-----BNE
		'0' when sInstr = "011101" else
		-----ILLOP
		-----'1' when nesto
		'-';
	
	oWDSEL <=
		-----IRQ
		"00" when   iIRQ   = '1' 		else
		-----OP
		"01" when	sInstr = "100000" else
		"01" when	sInstr = "100001" else
		"01" when	sInstr = "100100" else
		"01" when	sInstr = "100101" else
		"01" when	sInstr = "100110" else
		"01" when	sInstr = "101000" else
		"01" when	sInstr = "101001" else
		"01" when	sInstr = "101010" else
		"01" when	sInstr = "101011" else
		"01" when	sInstr = "101100" else
		"01" when 	sInstr = "101101" else
		"01" when   sInstr = "101110" else
		-----OPC
		"01" when	sInstr = "110000" else
		"01" when	sInstr = "110001" else
		"01" when	sInstr = "110100" else
		"01" when	sInstr = "110101" else
		"01" when	sInstr = "110110" else
		"01" when	sInstr = "111000" else
		"01" when	sInstr = "111001" else
		"01" when	sInstr = "111010" else
		"01" when	sInstr = "111011" else
		"01" when	sInstr = "111100" else
		"01" when 	sInstr = "111101" else
		"01" when   sInstr = "111110" else
		-----LD
		"10" when   sInstr = "011000" else
		-----LDR
		"10" when   sInstr = "011111" else
		-----JMP
		"00" when   sInstr = "011011" else
		-----BEQ
		"00" when   sInstr = "011100" else
		-----BNE
		"00" when   sInstr = "011101" else
		-----ILLOP
		----- "01" when nesto
		"--";
		
	oWERF <=
		-----IRQ
		'1' when iIRQ 	 = '1' 		else
		-----OP
		'1' when sInstr = "100000" else 
		'1' when sInstr = "100001" else
		'1' when sInstr = "100100" else
		'1' when sInstr = "100101" else
		'1' when sInstr = "100110" else
		'1' when sInstr = "101000" else
		'1' when sInstr = "101001" else
		'1' when sInstr = "101010" else
		'1' when sInstr = "101011" else
		'1' when sInstr = "101100" else
		'1' when sInstr = "101101" else
		'1' when sInstr = "101110" else
		-----OPC
		'1' when sInstr = "110000" else 
		'1' when sInstr = "110001" else
		'1' when sInstr = "110100" else
		'1' when sInstr = "110101" else
		'1' when sInstr = "110110" else
		'1' when sInstr = "111000" else
		'1' when sInstr = "111001" else
		'1' when sInstr = "111010" else
		'1' when sInstr = "111011" else
		'1' when sInstr = "111100" else
		'1' when sInstr = "111101" else
		'1' when sInstr = "111110" else
		-----LD
		'1' when sInstr = "011000" else
		-----LDR
		'1' when sInstr = "011111" else
		-----ST
		'0' when sInstr = "011001" else
		-----JMP
		'1' when sInstr = "011011" else
		-----BEQ
		'1' when sInstr = "011100" else
		-----BNE
		'1' when sInstr = "011101" else
		-----ILLOP
		-----'1' when nesto
		'-';

end arch;
