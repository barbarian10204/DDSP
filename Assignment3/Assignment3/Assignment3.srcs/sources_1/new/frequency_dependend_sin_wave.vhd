----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 01:37:32 PM
-- Design Name: 
-- Module Name: frequency_dependend_sin_wave - Behavioral
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

entity frequency_dependend_sin_wave is
    Port (
        frequency_div : in integer;
        clk_in, rst : in std_logic;
        sin_out : out std_logic_vector(7 downto 0)
    );
end frequency_dependend_sin_wave;

architecture Behavioral of frequency_dependend_sin_wave is
    component clock_divider is
      port (
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC;
        rst     : in  STD_LOGIC;
        division : in integer
        );
    end component clock_divider;
    signal clk_in_div, clk_out_div, rst_div: std_logic;
    signal div_div: integer;
    component sin_ROM_clk is
        Port(
        clk : in STD_LOGIC;
        address : in  STD_LOGIC_VECTOR (4 downto 0);
        data_out : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component sin_ROM_clk;
    signal clk_rom: std_logic;
    signal adr_rom: std_logic_vector(4 downto 0);
    signal out_rom: std_logic_vector(7 downto 0);

    -- signals for sinus wave creation
    signal address: integer := 0;

begin

    clk_div : component clock_divider port map(
        clk_in => clk_in_div,
        clk_out => clk_out_div,
        rst => rst_div,
        division => div_div
    );
    sinus : component sin_ROM_clk port map(
        clk => clk_rom,
        address => adr_rom,
        data_out => out_rom
    );

    div_div <= frequency_div;
    clk_in_div <= clk_in;
    rst_div <= rst;
    sin_out <=out_rom;
    clk_rom <= clk_out_div;

    sinus_wave : process (clk_rom) begin
        adr_rom <= std_logic_vector(to_unsigned(address+1, 5));
        address <= address + 1;
    end process sinus_wave;

end Behavioral;
