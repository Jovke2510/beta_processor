library ieee;
use ieee.std_logic_1164.all;

library work;

entity register_file is
	Generic ( WIDTH : integer := 32);
	port(
		iCLK		: in std_logic;
		inRST		: in std_logic;
		iWA		: in std_logic_vector (4 downto 0);
		iWE		: in std_logic;
		iD			: in std_logic_vector (WIDTH-1 downto 0);
		iRA1		: in std_logic_vector (4 downto 0);
		iRA2		: in std_logic_vector (4 downto 0);
		oRD1		: out std_logic_vector (WIDTH-1 downto 0);
		oRD2		: out std_logic_vector (WIDTH-1 downto 0)
		
	);
end entity register_file;

architecture arch of register_file is
	signal sR0, sR1, sR2, sR3, sR4, sR5, sR6, sR7, sR8, sR9, sR10, sR11, sR12, sR13, sR14, sR15, sR16, sR17, sR18, sR19, sR20, sR21, sR22, sR23, sR24, sR25, sR26, sR27, sR28, sR29, sR30, sR31 : std_logic_vector(31 downto 0);
	signal sR_MUXA, sR_MUXB : std_logic_vector(WIDTH-1 downto 0);
	signal sREG_WE : std_logic_vector(WIDTH-1 downto 0);
begin 
	
	r_muxa_i : entity work.register_mux
	port map(
		iD0 => sR0,
		iD1 => sR1,
		iD2 => sR2,
		iD3 => sR3,
		iD4 => sR4,
		iD5 => sR5,
		iD6 => sR6,
		iD7 => sR7,
		iD8 => sR8,
		iD9 => sR9,
		iD10 => sR10,
		iD11 => sR11,
		iD12 => sR12,
		iD13 => sR13,
		iD14 => sR14,
		iD15 => sR15,
		iD16 => sR16,
		iD17 => sR17,
		iD18 => sR18,
		iD19 => sR19,
		iD20 => sR20,
		iD21 => sR21,
		iD22 => sR22,
		iD23 => sR23,
		iD24 => sR24,
		iD25 => sR25,
		iD26 => sR26,
		iD27 => sR27,
		iD28 => sR28,
		iD29 => sR29,
		iD30 => sR30,
		iD31 => sR31,
		iSEL => iRA1,
		oQ => sR_MUXA
	);
	
	r_muxb_i : entity work.register_mux
	port map(
		iD0 => sR0,
		iD1 => sR1,
		iD2 => sR2,
		iD3 => sR3,
		iD4 => sR4,
		iD5 => sR5,
		iD6 => sR6,
		iD7 => sR7,
		iD8 => sR8,
		iD9 => sR9,
		iD10 => sR10,
		iD11 => sR11,
		iD12 => sR12,
		iD13 => sR13,
		iD14 => sR14,
		iD15 => sR15,
		iD16 => sR16,
		iD17 => sR17,
		iD18 => sR18,
		iD19 => sR19,
		iD20 => sR20,
		iD21 => sR21,
		iD22 => sR22,
		iD23 => sR23,
		iD24 => sR24,
		iD25 => sR25,
		iD26 => sR26,
		iD27 => sR27,
		iD28 => sR28,
		iD29 => sR29,
		iD30 => sR30,
		iD31 => sR31,
		iSEL => iRA2,
		oQ => sR_MUXB
	);
	
	---koder uraditi kombinaciono
	sREG_WE <=
		"00000000000000000000000000000001" when iWE = '1' and iWA = "00000" else
		"00000000000000000000000000000010" when iWE = '1' and iWA = "00001" else
		"00000000000000000000000000000100" when iWE = '1' and iWA = "00010" else
		"00000000000000000000000000001000" when iWE = '1' and iWA = "00011" else
		"00000000000000000000000000010000" when iWE = '1' and iWA = "00100" else
		"00000000000000000000000000100000" when iWE = '1' and iWA = "00101" else
		"00000000000000000000000001000000" when iWE = '1' and iWA = "00110" else
		"00000000000000000000000010000000" when iWE = '1' and iWA = "00111" else
		"00000000000000000000000100000000" when iWE = '1' and iWA = "01000" else
		"00000000000000000000001000000000" when iWE = '1' and iWA = "01001" else
		"00000000000000000000010000000000" when iWE = '1' and iWA = "01010" else
		"00000000000000000000100000000000" when iWE = '1' and iWA = "01011" else
		"00000000000000000001000000000000" when iWE = '1' and iWA = "01100" else
		"00000000000000000010000000000000" when iWE = '1' and iWA = "01101" else
		"00000000000000000100000000000000" when iWE = '1' and iWA = "01110" else
		"00000000000000001000000000000000" when iWE = '1' and iWA = "01111" else
		"00000000000000010000000000000000" when iWE = '1' and iWA = "10000" else
		"00000000000000100000000000000000" when iWE = '1' and iWA = "10001" else
		"00000000000001000000000000000000" when iWE = '1' and iWA = "10010" else
		"00000000000010000000000000000000" when iWE = '1' and iWA = "10011" else
		"00000000000100000000000000000000" when iWE = '1' and iWA = "10100" else
		"00000000001000000000000000000000" when iWE = '1' and iWA = "10101" else
		"00000000010000000000000000000000" when iWE = '1' and iWA = "10110" else
		"00000000100000000000000000000000" when iWE = '1' and iWA = "10111" else
		"00000001000000000000000000000000" when iWE = '1' and iWA = "11000" else
		"00000010000000000000000000000000" when iWE = '1' and iWA = "11001" else
		"00000100000000000000000000000000" when iWE = '1' and iWA = "11010" else
		"00001000000000000000000000000000" when iWE = '1' and iWA = "11011" else
		"00010000000000000000000000000000" when iWE = '1' and iWA = "11100" else
		"00100000000000000000000000000000" when iWE = '1' and iWA = "11101" else
		"01000000000000000000000000000000" when iWE = '1' and iWA = "11110" else
		"10000000000000000000000000000000" when iWE = '1' and iWA = "11111" else
		(others => '0');
	
	
	r0_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(0),
		oQ => sR0
	);
	
	r1_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(1),
		oQ => sR1
	);
	
	r2_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(2),
		oQ => sR2
	);
	
	r3_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(3),
		oQ => sR3
	);
	
	r4_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(4),
		oQ => sR4
	);
	
	r5_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(5),
		oQ => sR5
	);
	
	r6_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(6),
		oQ => sR6
	);
	
	r7_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(7),
		oQ => sR7
	);
	
	r8_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(8),
		oQ => sR8
	);
	
	r9_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(9),
		oQ => sR9
	);
	
	r10_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(10),
		oQ => sR10
	);
	
	r11_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(11),
		oQ => sR11
	);
	
	r12_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(12),
		oQ => sR12
	);
	
	r13_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(13),
		oQ => sR13
	);
	
	r14_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(14),
		oQ => sR14
	);
	
	r15_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(15),
		oQ => sR15
	);
	
	r16_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(16),
		oQ => sR16
	);
	
	r17_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(17),
		oQ => sR17
	);
	
	r18_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(18),
		oQ => sR18
	);
	
	r19_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(19),
		oQ => sR19
	);
	
	r20_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(20),
		oQ => sR20
	);
	
	r21_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(21),
		oQ => sR21
	);
	
	r22_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(22),
		oQ => sR22
	);
	
	r23_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(23),
		oQ => sR23
	);
	
	r24_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(24),
		oQ => sR24
	);
	
	r25_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(25),
		oQ => sR25
	);
	
	r26_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(26),
		oQ => sR26
	);
	
	r27_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(27),
		oQ => sR27
	);
	
	r28_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(28),
		oQ => sR28
	);
	
	r29_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(29),
		oQ => sR29
	);
	
	r30_i : entity work.registers
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(30),
		oQ => sR30
	);
	
	r31_i : entity work.register_zero
	port map(
		iCLK => iCLK,
		inRST => inRST,
		iD => iD,
		iWE => sREG_WE(31),
		oQ => sR31
	);
		
	oRD1 <= sR_MUXA;
	oRD2 <= sR_MUXB;

end architecture;