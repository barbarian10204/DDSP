----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 11:30:37 AM
-- Design Name: 
-- Module Name: Mux - Behavioral
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

entity Mux is
	Port (A : in std_logic_vector(7 downto 0);
	      B : in std_logic_vector(7 downto 0);
	      C : in std_logic_vector(7 downto 0);
	      D : in std_logic_vector(7 downto 0);
	      Sel : in std_logic_vector(1 downto 0);
	      E : out std_logic_vector(7 downto 0));
	
end Mux;

architecture Behavioral of Mux is

begin

process (A,B,C,D,Sel)
begin
   case Sel is
      when "00" => E <= A;
      when "01" => E <= B;
      when "10" => E <= C;
      when "11" => E <= D;
      when others => E <= "00000000";
   end case;
end process;

end Behavioral;
