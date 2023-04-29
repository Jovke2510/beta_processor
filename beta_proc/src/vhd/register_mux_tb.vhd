library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_mux_tb is
end register_mux_tb;

architecture Behavioral of register_mux_tb is

	-- Component Declaration for Unit Under Test (UUT)
	component register_mux
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
	end component;

	-- Inputs
	signal iD0 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD2 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD3 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD4 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD5 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD6 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD7 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD8 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD9 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD10 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD11 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD12 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD13 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD14 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD15 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD16 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD17 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD18 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD19 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD20 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD21 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD22 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD23 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD24 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD25 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD26 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD27 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD28 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD29 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD30 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iD31 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iSEL : STD_LOGIC_VECTOR(4 downto 0)  := (others => '0');
	signal oQ   : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin
	
	uut: register_mux
	port map(
		iD0 => iD0,
		iD1 => iD1,
		iD2 => iD2,
		iD3 => iD3,
		iD4 => iD4,
		iD5 => iD5,
		iD6 => iD6,
		iD7 => iD7,
		iD8 => iD8,
		iD9 => iD9,
		iD10 => iD10,
		iD11 => iD11,
		iD12 => iD12,
		iD13 => iD13,
		iD14 => iD14,
		iD15 => iD15,
		iD16 => iD16,
		iD17 => iD17,
		iD18 => iD18,
		iD19 => iD19,
		iD20 => iD20,
		iD21 => iD21,
		iD22 => iD22,
		iD23 => iD23,
		iD24 => iD24,
		iD25 => iD25,
		iD26 => iD26,
		iD27 => iD27,
		iD28 => iD28,
		iD29 => iD29,
		iD30 => iD30,
		iD31 => iD31,
		iSEL => iSEL,
		oQ   => oQ
	);
	
	stim_proc: process
	begin
		iD0 <= x"DEADBEEF";
		iD1 <= x"ABCDEF12";
		wait for 10 ns;
		iSEL <= "00001";
		wait for 10 ns;
		iSEL <= "00000";
		wait;
	
	end process;
end Behavioral;
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
