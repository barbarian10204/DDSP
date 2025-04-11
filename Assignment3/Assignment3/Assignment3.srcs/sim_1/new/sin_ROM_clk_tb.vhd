----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 01:13:47 PM
-- Design Name: 
-- Module Name: sin_ROM_clk_tb - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_test_sim is
--  Port ( );
end rom_test_sim;

architecture Behavioral of rom_test_sim is
    component sin_ROM_clk
        Port ( clk : in STD_LOGIC;
            address : in STD_LOGIC_VECTOR (4 downto 0);
            data_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component sin_ROM_clk;
signal clk : STD_LOGIC := '0';
signal address : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal data_out : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
constant clk_T: time := 10 ns;
begin
    uut: sin_ROM_clk port map(
        clk => clk, address => address, data_out=> data_out
        );
        clksource : process begin
            clk <= not clk;
            wait for clk_T;
        end process;
        test : process begin
            for j in 0 to 0 loop
                for i in 0 to 31 loop
                    address <= std_logic_vector(to_unsigned(i, 5));
                    wait for clk_T;
                end loop;
            end loop;
            wait;
        end process;
end Behavioral;