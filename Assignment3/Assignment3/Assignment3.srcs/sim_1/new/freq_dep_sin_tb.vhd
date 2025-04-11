----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 02:06:23 PM
-- Design Name: 
-- Module Name: freq_dep_sin_tb - Behavioral
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

entity freq_dep_sin_tb is
--  Port ( );
end freq_dep_sin_tb;

architecture Behavioral of freq_dep_sin_tb is
    component frequency_dependend_sin_wave is
        Port (
            frequency_div : in integer;
            clk_in, rst : in std_logic;
            sin_out : out std_logic_vector(7 downto 0)
        );
    end component frequency_dependend_sin_wave;
    signal freq: integer := 2;
    signal clk, rst: std_logic := '0';
    signal sin_out: std_logic_vector(7 downto 0) := "00000000";
    constant clk_T: time := 5 ns;

begin

    uut : component frequency_dependend_sin_wave port map(
        frequency_div => freq,
        clk_in => clk,
        sin_out => sin_out,
        rst => rst
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*10;
        freq <= 2;
        wait for clk_T*100;
        freq <= 8;
        wait for clk_T*1000;
        freq <= 20;
        wait;
    end process testing;

end Behavioral;
