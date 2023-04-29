library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity register_file_tb is
end register_file_tb;

architecture behavior of register_file_tb is

    component register_file
    Generic ( WIDTH : integer := 32);
    port(
        iCLK     : in std_logic;
        inRST    : in std_logic;
        iWA      : in std_logic_vector (4 downto 0);
        iWE      : in std_logic;
        iD       : in std_logic_vector (WIDTH-1 downto 0);
        iRA1     : in std_logic_vector (4 downto 0);
        iRA2     : in std_logic_vector (4 downto 0);
        oRD1     : out std_logic_vector (WIDTH-1 downto 0);
        oRD2     : out std_logic_vector (WIDTH-1 downto 0)
    );
    end component;

    signal iCLK, rst, we: std_logic := '0';
    signal wa, ra1, ra2:  std_logic_vector(4 downto 0);
	 signal d, rd1, rd2:   std_logic_vector(31 downto 0);
	 constant iCLK_period : time := 10 ns;

begin

    uut: register_file
    port map (
        iCLK => iCLK,
        inRST => rst,
        iWA => wa,
        iWE => we,
        iD => d,
        iRA1 => ra1,
        iRA2 => ra2,
        oRD1 => rd1,
        oRD2 => rd2
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
        rst <= '1';
        wait for 11 ns;
        rst <= '0';
        wait for 16 ns;

        -- Test Case 1
        d <= x"DEADBEEF";
        we <= '1';
        wa <= "00000";
        ra1 <= "00000";
        ra2 <= "00000";
        wait for 11 ns;
        assert rd1 = x"DEADBEEF" and rd2 = x"00000000"
            report "Test Case 1 failed" severity error;

        -- Test Case 2
        d <= x"12345678";
        wa <= "00001";
        wait for 11 ns;
        ra1 <= "00001";
        ra2 <= "00000";
        wait for 11 ns;
        assert rd1 = x"12345678" and rd2 = x"DEADBEEF"
            report "Test Case 2 failed" severity error;

        -- Test Case 3
        d <= x"ABCDEF01";
        wa <= "00010";
        wait for 11 ns;
        ra1 <= "00010";
        ra2 <= "00000";
        wait for 11 ns;
        assert rd1 = x"ABCDEF01" and rd2 = x"12345678"
            report "Test Case 3 failed" severity error;

        wait for 11 ns;
		  ra2 <= "00001";
		  wait for 11 ns;
		  ra2 <= "00010";
		  wait;
	 end process;
	
end behavior;
