----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 11:55:53 PM
-- Design Name: 
-- Module Name: counter_8b_tb - Behavioral
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

entity counter_8b_tb is
--  Port ( );
end counter_8b_tb;

architecture Behavioral of counter_8b_tb is
    component couter_8bit is
        Port (
            clk : in std_logic;
            count_val : out std_logic_vector(7 downto 0);
            rst : in std_logic
        );
    end component couter_8bit;
    signal clk : std_logic := '0';
    signal count_val : std_logic_vector(7 downto 0) := "00000000";
    signal rst : std_logic := '0';
    constant clk_T: time := 10 ns;

begin

    uut : component couter_8bit port map(
        clk => clk,
        count_val => count_val,
        rst => rst
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*10;
        wait for clk_T*50;
        rst <= '1';
        wait for clk_T*20;
        rst <= '0';
        wait;
    end process testing;

end Behavioral;
