----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 11:05:54 AM
-- Design Name: 
-- Module Name: Logics - Behavioral
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

entity Logics is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           C : out STD_LOGIC_VECTOR(7 downto 0);
           D : out STD_LOGIC_VECTOR(7 downto 0);
           E : out STD_LOGIC_VECTOR(7 downto 0));
end Logics;

architecture Behavioral of Logics is

begin

    C <= A and B;
    D <= A or B;
    E <= not A;

end Behavioral;
