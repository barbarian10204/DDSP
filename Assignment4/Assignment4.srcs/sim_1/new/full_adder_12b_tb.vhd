----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2025 11:27:45 AM
-- Design Name: 
-- Module Name: full_adder_12b_tb - Behavioral
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

entity full_adder_12b_tb is
--  Port ( );
end full_adder_12b_tb;

architecture Behavioral of full_adder_12b_tb is
    component full_adder_12b is
        generic(
            bits_to_sum : integer := 11
        );
        Port (
            term1 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
            term2 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
            carry_in : in STD_LOGIC;
            sum : out STD_LOGIC_VECTOR(bits_to_sum downto 0);
            carry_out : out STD_LOGIC
        );
    end component full_adder_12b;
    constant bits_to_sum: integer := 11;
    signal term1 : std_logic_vector(bits_to_sum downto 0) := "000000000000";
    signal term2 : std_logic_vector(bits_to_sum downto 0) := "000000000000";
    signal carry_in : std_logic := '0';
    signal sum : std_logic_vector(bits_to_sum downto 0) := "000000000000";
    signal carry_out : std_logic := '0';

begin
    uut: component full_adder_12b
    port map (
      term1     => term1,
      term2     => term2,
      carry_in  => carry_in,
      sum       => sum,
      carry_out => carry_out
    );
    process begin
        wait for 100 ns;
        term1 <= "010101010101";
        term2 <= "010101010101";
        wait for 20 ns;
        carry_in <= '1';
        wait for 20 ns;
        carry_in <= '0';
        wait for 20 ns;
        term1 <= "001100110011";
        term2 <= "000011110000";
        wait for 20 ns;
        carry_in <= '1';
        wait for 20 ns;
        carry_in <= '0';
        wait for 20 ns;
        term1 <= "101100110011";
        term2 <= "100011110000";
        wait;
    end process;

end Behavioral;
