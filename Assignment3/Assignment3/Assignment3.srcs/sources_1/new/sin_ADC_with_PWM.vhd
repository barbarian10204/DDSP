----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2025 12:41:21 PM
-- Design Name: 
-- Module Name: sin_ADC_with_PWM - Behavioral
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

entity sin_ADC_with_PWM is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        PWM_sinus : out std_logic;
        frequency_div : in integer;
        dbg_duty : out std_logic_vector(7 downto 0)
    );
end sin_ADC_with_PWM;

architecture Structural of sin_ADC_with_PWM is
    component clock_divider is
        port (
            clk_in  : in  STD_LOGIC;
            clk_out : out STD_LOGIC;
            rst     : in  STD_LOGIC;
            division : in integer
        );
    end component clock_divider;
    signal clk_in_div : std_logic;
    signal clk_out_div : std_logic;
    signal rst_div : std_logic;
    signal division_div : integer;
    component PWM_8b is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        pulse_out : out std_logic;
        duty_cycle : in std_logic_vector(7 downto 0)
    );
    end component PWM_8b;
    signal rst_pwm : std_logic;
    signal clk_pwm : std_logic;
    signal pulse_out_pwm : std_logic;
    signal duty_cycle_pwm : std_logic_vector(7 downto 0);
    component frequency_dependend_sin_wave is
        Port (
            frequency_div : in integer;
            clk_in, rst : in std_logic;
            sin_out : out std_logic_vector(7 downto 0)
        );
    end component frequency_dependend_sin_wave;
    signal frequency_div_sin : integer;
    signal clk_in_sin : std_logic;
    signal rst_sin: std_logic;
    signal sin_out_sin : std_logic_vector(7 downto 0);

begin

    clk_div : component clock_divider port map(
        clk_in => clk_in_div,
        clk_out => clk_out_div,
        rst => rst_div,
        division => division_div
    );
    PWM : component PWM_8b port map(
        rst => rst_pwm,
        clk => clk_pwm,
        pulse_out => pulse_out_pwm,
        duty_cycle => duty_cycle_pwm
    );
    sinus_creation : component frequency_dependend_sin_wave port map(
        frequency_div => frequency_div_sin,
        clk_in => clk_in_sin,
        rst => rst_sin,
        sin_out => sin_out_sin
    );
    
    rst_div <= rst;
    rst_pwm <= rst;
    rst_sin <= rst;
    clk_in_sin <= clk;
    clk_pwm <= clk_out_div;
    clk_in_div <= clk;
    frequency_div_sin <= frequency_div*500;
    division_div <= frequency_div;
    -- using sinus value as duty cycle for PWM
    duty_cycle_pwm <= sin_out_sin;
    PWM_sinus <= pulse_out_pwm;
    dbg_duty <= sin_out_sin;

end Structural;
