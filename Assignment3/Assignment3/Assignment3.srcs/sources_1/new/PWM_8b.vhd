----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2025 11:37:56 AM
-- Design Name: 
-- Module Name: PWM_8b - Behavioral
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

entity PWM_8b is
Port (
    rst : in std_logic;
    clk : in std_logic;
    pulse_out : out std_logic;
    duty_cycle : in std_logic_vector(7 downto 0)
);
end PWM_8b;

architecture Behavioral of PWM_8b is
    component couter_8bit is
        Port (
            clk : in std_logic;
            count_val : out std_logic_vector(7 downto 0);
            rst : in std_logic
        );
    end component couter_8bit;
    signal clk_cnt : std_logic := '0';
    signal count_val_cnt : std_logic_vector(7 downto 0) := "00000000";
    signal rst_cnt : std_logic := '0';

begin

    counter : component couter_8bit port map(
        clk => clk_cnt,
        count_val => count_val_cnt,
        rst => rst_cnt
    );
    rst_cnt <= rst;
    clk_cnt <= clk;
    PWM : process (clk, rst) begin
        if rst = '1' then
            pulse_out <= '0';
        elsif rising_edge(clk) then
            if duty_cycle < count_val_cnt then -- creates 1 clk_T spike when duty cycle = 0
                pulse_out <= '0';
            else
                pulse_out <= '1';
            end if;
        end if;
    end process PWM;

end Behavioral;
