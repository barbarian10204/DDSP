----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:09:08 PM
-- Design Name: 
-- Module Name: reg_pipo_8b_rw - Behavioral
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

entity reg_pipo_8b is
    Port ( data_out : out STD_LOGIC_VECTOR (7 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           clk, rst, load : in std_logic);
end reg_pipo_8b;

architecture Behavioral of reg_pipo_8b is

begin
    syncronious: process (clk, rst) is
    begin
        if rst = '1' then
            data_out <= "00000000";
        elsif rising_edge(clk) and load = '1' then
            data_out <=data_in;
        end if;
    end process;

end Behavioral;

