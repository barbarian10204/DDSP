----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 11:55:18 AM
-- Design Name: 
-- Module Name: Mux_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_test is
--  Port ( );
end Mux_test;

architecture Behavioral of Mux_test is
    component Mux is
	Port (A : in std_logic_vector(7 downto 0);
	      B : in std_logic_vector(7 downto 0);
	      C : in std_logic_vector(7 downto 0);
	      D : in std_logic_vector(7 downto 0);
	      Sel : in std_logic_vector(1 downto 0);
	      E : out std_logic_vector(7 downto 0));
	 end component;
	 signal Ain : std_logic_vector(7 downto 0);
	 signal Bin : std_logic_vector(7 downto 0);
	 signal Cin : std_logic_vector(7 downto 0);
	 signal Din : std_logic_vector(7 downto 0);
	 signal Eout : std_logic_vector(7 downto 0);
	 signal Sin : std_logic_vector(1 downto 0);

begin

    uut: Mux port map
        (A=>Ain, B=>Bin, C=>Cin, D=>Din, Sel=>Sin, E=>Eout);
        process
            begin
            wait for 100 ns;
            Ain <= "11000000";
            Bin <= "00110000";
            Cin <= "00001100";
            Din <= "00000011";
            Sin <= "00";
            wait for 100 ns;
            Sin <= "01";
            wait for 100 ns;
            Sin <= "10";
            wait for 100 ns;
            Sin <= "11";
            wait for 100 ns;
        end process; 

end Behavioral;
