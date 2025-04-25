----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2025 11:18:42 AM
-- Design Name: 
-- Module Name: full_adder_12b - Behavioral
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

entity full_adder_12b is
    generic(
        bits_to_sum : integer := 11
    );
    Port ( term1 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
           term2 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR(bits_to_sum downto 0);
           carry_out : out STD_LOGIC);
end full_adder_12b;

architecture Behavioral of full_adder_12b is

begin

process (term1, term2, carry_in)
    -- internal sum and carry declaration vv 
    variable iSum : std_logic_vector(bits_to_sum downto 0);
--    variable iCarry : std_logic := Ci;
    variable iCarry : std_logic;
    begin
       iCarry := carry_in;
       for i in 0 to bits_to_sum loop 
            iSum(i) := iCarry xor (term1(i) xor term2(i));
            iCarry := (term1(i) and term2(i)) or (iCarry and (term1(i) xor term2(i)));
        end loop;
        sum <= iSum;
        carry_out <= iCarry;
    end process;

end Behavioral;
