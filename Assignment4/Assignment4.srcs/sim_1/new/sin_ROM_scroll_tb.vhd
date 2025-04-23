----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 12:42:16 PM
-- Design Name: 
-- Module Name: sin_ROM_scroll_tb - Behavioral
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

entity sin_ROM_scroll_tb is
--  Port ( );
end sin_ROM_scroll_tb;

architecture Behavioral of sin_ROM_scroll_tb is
    component sin_ROM_scroll is
        Port (
            clk : in std_logic;
            rst : in std_logic;
            sin_wave : out std_logic_vector(7 downto 0)
        );
    end component sin_ROM_scroll;
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal sin_wave : std_logic_vector(7 downto 0) := "00000000";
    constant clk_T: time := 1 ns;

begin
    uut : component sin_ROM_scroll
    port map (
      clk      => clk,
      rst      => rst,
      sin_wave => sin_wave
    );
        clock : process begin
            wait for clk_T/2;
            clk <= not clk;
        end process clock;
        process begin
            wait for clk_T*20;
            rst <= '1';
            wait for clk_T*20;
            rst <= '0';
            wait;
        end process;

end Behavioral;
