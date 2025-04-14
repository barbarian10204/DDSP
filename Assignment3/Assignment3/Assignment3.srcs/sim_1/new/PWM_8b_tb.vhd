----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2025 12:07:21 PM
-- Design Name: 
-- Module Name: PWM_8b_tb - Behavioral
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

entity PWM_8b_tb is
--  Port ( );
end PWM_8b_tb;

architecture Behavioral of PWM_8b_tb is
    component PWM_8b is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        pulse_out : out std_logic;
        duty_cycle : in std_logic_vector(7 downto 0)
    );
    end component PWM_8b;
    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal pulse_out : std_logic := '0';
    signal duty_cycle : std_logic_vector(7 downto 0) := "00000000";
    constant clk_T : time := 100 ps;

begin

    uut : component PWM_8b port map(
        rst => rst,
        clk => clk,
        pulse_out => pulse_out,
        duty_cycle => duty_cycle
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*10;
        duty_cycle <= "01111111";
        wait for clk_T*500;
        duty_cycle <= "11111110";
        rst <= '1';
        wait for clk_T;
        rst <= '0';
        wait for clk_T*500;
        duty_cycle <= "00000011";
        rst <= '1';
        wait for clk_T;
        rst <= '0';
        wait for clk_T*500;
        duty_cycle <= "00000000";
        rst <= '1';
        wait for clk_T;
        rst <= '0';
        wait for clk_T*500;
        wait;
    end process testing;

end Behavioral;
