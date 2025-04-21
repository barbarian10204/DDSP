----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2025 01:15:25 PM
-- Design Name: 
-- Module Name: sin_ADC_with_PWM_tb - Behavioral
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

entity sin_ADC_with_PWM_tb is
--  Port ( );
end sin_ADC_with_PWM_tb;

architecture Behavioral of sin_ADC_with_PWM_tb is
    component sin_ADC_with_PWM is
        Port (
            rst : in std_logic;
            clk : in std_logic;
            PWM_sinus : out std_logic;
            frequency_div : in integer;
            dbg_duty : out std_logic_vector(7 downto 0)
        );
    end component sin_ADC_with_PWM;
    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal PWM_sinus : std_logic := '0';
    signal frequency_div : integer := 2;
    signal dbg_duty : std_logic_vector(7 downto 0);
    constant clk_T: time := 100 ps;

begin

    uut : component sin_ADC_with_PWM port map(
      rst           => rst,
      clk           => clk,
      PWM_sinus     => PWM_sinus,
      frequency_div => frequency_div,
      dbg_duty => dbg_duty
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*10;
        frequency_div <= 2;
        wait for clk_T*500;
        frequency_div <= 5;
        wait for clk_T*500;
        wait;
    end process testing;

end Behavioral;
