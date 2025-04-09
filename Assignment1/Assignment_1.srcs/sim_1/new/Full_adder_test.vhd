----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2025 06:57:53 PM
-- Design Name: 
-- Module Name: Full_adder_test - Behavioral
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

entity Full_adder_test is
--  Port ( );
end Full_adder_test;

architecture Behavioral of Full_adder_test is

    component Full_adder is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(7 downto 0);
           C : out STD_LOGIC);
    end component;
    signal Ain : STD_LOGIC_VECTOR(7 downto 0) := "11111111";
    signal Bin : STD_LOGIC_VECTOR(7 downto 0) := "11111111";
    signal Cin : STD_LOGIC := '1';
    signal Sout : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout : STD_LOGIC;

begin

    uut: Full_adder port map
        (A=>Ain, B=>Bin, Ci=>Cin, S=>Sout, C=>Cout);
            process
                begin
                wait for 100ns;
                Ain <= "10101010";
                Bin <= "00000111";
                Cin <= '0';
                wait for 100ns;
                Ain <= "10101010";
                Bin <= "00000111";
                Cin <= '1';
                wait for 100ns;
                Ain <= "10101010";
                Bin <= "00000110";
                Cin <= '1';
                wait for 100ns;
                Ain <= "10101011";
                Bin <= "10000111";
                Cin <= '1';
                wait for 100 ns;
            end process;


end Behavioral;
