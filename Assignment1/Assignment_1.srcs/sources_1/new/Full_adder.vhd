----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2025 05:36:53 PM
-- Design Name: 
-- Module Name: Full_adder - Behavioral
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

entity Full_adder is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(7 downto 0);
           C : out STD_LOGIC);
end Full_adder;

architecture Behavioral of Full_adder is

begin

process (A,B,Ci)
    -- internal sum and carry declaration vv 
    variable iSum : std_logic_vector(7 downto 0);
--    variable iCarry : std_logic := Ci;
    variable iCarry : std_logic;
    begin
       iCarry := Ci;
       for i in 0 to 7 loop 
            iSum(i) := iCarry xor (A(i) xor B(i));
            iCarry := (A(i) and B(i)) or (iCarry and (A(i) xor B(i)));
        end loop;
        S <= iSum;
        C <= iCarry;
    end process;

end Behavioral;
