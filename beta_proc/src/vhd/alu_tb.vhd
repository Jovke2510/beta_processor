library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu_tb is
end entity alu_tb;

architecture testbench of alu_tb is

    -- Component declaration for the unit under test (UUT)
    component alu
        generic (
            WIDTH : integer := 32
        );
        port (
            iA      : in std_logic_vector(WIDTH-1 downto 0);
            iB      : in std_logic_vector(WIDTH-1 downto 0);
            iALUFN  : in std_logic_vector(5 downto 0);
            oQ      : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;

    -- Inputs
    signal sA : std_logic_vector(31 downto 0) := (others => '0');
    signal sB : std_logic_vector(31 downto 0) := (others => '0');
    signal sALUFN : std_logic_vector(5 downto 0) := (others => '0'); 

    -- Outputs
    signal sQ : std_logic_vector(31 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: alu generic map(WIDTH => 32) 
	 port map(
		iA => sA, 
		iB => sB, 
		iALUFN => sALUFN, 
		oQ => sQ
	);

    -- Stimulus process
    stim_proc: process
    begin
        -- wait a few clock cycles
        wait for 10 ns;
		  sA <= x"00000000";
        sB <= x"00000000";
        sALUFN <= "100000";
        wait for 10 ns;
        assert(sQ = x"00000000") report "Addition of 0 with 0 failed!" severity error;
        
        sA <= x"00000001";
        sB <= x"00000002";
        sALUFN <= "100001";
        wait for 10 ns;
        assert(sQ = x"FFFFFFFF") report "Subtraction of 1 from 2 failed!" severity error;
        
        sA <= x"00000000";
        sB <= x"00000000";
        sALUFN <= "100100";
        wait for 10 ns;
        assert(sQ = x"00000001") report "Comparison of 0 with 0 failed!" severity error;
        
        sA <= x"00000001";
        sB <= x"00000000";
        sALUFN <= "100100";
        wait for 10 ns;
        assert(sQ = x"00000000") report "Comparison of 1 with 0 failed!" severity error;
        
        sA <= x"00000001";
        sB <= x"00000002";
        sALUFN <= "100101";
        wait for 10 ns;
        assert(sQ = x"00000001") report "Less-than comparison of 1 with 2 failed!" severity error;
        
        sA <= x"00000002";
        sB <= x"00000001";
        sALUFN <= "100101";
        wait for 10 ns;
        assert(sQ = x"00000000") report "Less-than comparison of 2 with 1 failed!" severity error;
        
        sA <= x"00000001";
        sB <= x"00000002";
        sALUFN <= "100110";
        wait for 10 ns;
        assert(sQ = x"00000001") report "Less-than-or-equal-to comparison of 1 with 2 failed!" severity error;
        
        sA <= x"00000002";
        sB <= x"00000001";
        sALUFN <= "100110";
        wait for 10 ns;
        assert(sQ = x"00000000") report "Less-than-or-equal-to comparison of 2 with 1 failed!" severity error;
        
		  wait;

    end process;

end architecture testbench;
