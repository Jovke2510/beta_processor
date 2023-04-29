library ieee;
use ieee.std_logic_1164.all;

entity control_unit_tb is
end control_unit_tb;

architecture test of control_unit_tb is
    -- Component declaration
    component control_unit
        generic (
            WIDTH : integer := 32
        );
        port (
				inRST	  : in std_logic;
            iIRQ    : in std_logic;
            iZ      : in std_logic;
            iD      : in std_logic_vector(WIDTH-1 downto 0);
            oALUFN  : out std_logic_vector(5 downto 0);
            oASEL   : out std_logic;
            oBSEL   : out std_logic;
            oMOE    : out std_logic;
            oMWR    : out std_logic;
            oPCSEL  : out std_logic_vector(2 downto 0);
            oRA2SEL : out std_logic;
            oWASEL  : out std_logic;
            oWDSEL  : out std_logic_vector(1 downto 0);
            oWERF   : out std_logic
        );
    end component;

    -- Inputs
	 signal inRST	 : std_logic := '0';
    signal iIRQ    : std_logic := '0';
    signal iZ      : std_logic := '0';
    signal iD      : std_logic_vector(31 downto 0) := (others => '0');

    -- Outputs
    signal oALUFN  : std_logic_vector(5 downto 0);
    signal oASEL   : std_logic;
    signal oBSEL   : std_logic;
    signal oMOE    : std_logic;
    signal oMWR    : std_logic;
    signal oPCSEL  : std_logic_vector(2 downto 0);
    signal oRA2SEL : std_logic;
    signal oWASEL  : std_logic;
    signal oWDSEL  : std_logic_vector(1 downto 0);
    signal oWERF   : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: control_unit generic map(WIDTH => 32)
        port map(
				inRST   => inRST,
            iIRQ    => iIRQ,
            iZ      => iZ,
            iD      => iD,
            oALUFN  => oALUFN,
            oASEL   => oASEL,
            oBSEL   => oBSEL,
            oMOE    => oMOE,
            oMWR    => oMWR,
            oPCSEL  => oPCSEL,
            oRA2SEL => oRA2SEL,
            oWASEL  => oWASEL,
            oWDSEL  => oWDSEL,
            oWERF   => oWERF
        );

    -- Stimulus process
    process
    begin
		  wait for 10 ns;

        -- Clock cycle 1
        iD <= "10000000000000000000000000000001";  -- opcode = lw
        wait for 10 ns;
        assert oALUFN = "100000" report "Error: oALUFN" severity error;
        wait for 10 ns;
		  
		  iD <= "10010100000000000000000000000001";  -- opcode = lw
        wait for 10 ns;
        assert oALUFN = "100101" report "Error: oALUFN" severity error;
        wait for 10 ns;
		  
		  iD <= "10101000000000000000000000000001";  -- opcode = lw
        wait for 10 ns;
        assert oALUFN = "101010" report "Error: oALUFN" severity error;
        wait for 10 ns;
		  
		  iIRQ <= '1';
		  wait for 10 ns;
		  
		  wait;
	end process;
end test;