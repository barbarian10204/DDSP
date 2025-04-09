----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 11:13:38 AM
-- Design Name: 
-- Module Name: Logics_test - Behavioral
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

entity Logics_test is
--  Port ( );
end Logics_test;

architecture Behavioral of Logics_test is

    component Logics is
        Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
               B : in STD_LOGIC_VECTOR(7 downto 0);
               C : out STD_LOGIC_VECTOR(7 downto 0);
               D : out STD_LOGIC_VECTOR(7 downto 0);
               E : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    Signal Ain :std_logic_vector(7 downto 0);
    Signal Bin :std_logic_vector(7 downto 0);
    Signal Cout :std_logic_vector(7 downto 0);
    Signal Dout :std_logic_vector(7 downto 0);
    Signal Eout :std_logic_vector(7 downto 0);
begin

    uut: Logics port map
        (A=>Ain, B=>Bin, C=>Cout, D=>Dout, E=>Eout);
        process
        begin
            wait for 100 ns;
            Ain <= "00000000";
            Bin <= "00000000";
            wait for 100 ns;
            Ain <= "11111111";
            Bin <= "00000000";
            wait for 100 ns;
            Ain <= "00000000";
            Bin <= "11111111";
            wait for 100 ns;
            Ain <= "11111111";
            Bin <= "11111111";
            wait for 100 ns;
        end process;

end Behavioral;
