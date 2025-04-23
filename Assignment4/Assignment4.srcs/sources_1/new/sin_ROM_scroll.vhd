----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 12:35:40 PM
-- Design Name: 
-- Module Name: sin_ROM_scroll - Behavioral
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

entity sin_ROM_scroll is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        sin_wave : out std_logic_vector(7 downto 0)
    );
end sin_ROM_scroll;

architecture Behavioral of sin_ROM_scroll is
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

    sinus : component sin_ROM_clk port map(
        clk => clk_rom,
        address => adr_rom,
        data_out => out_rom
    );

    sin_wave <= out_rom;
    clk_rom <= clk;

    sinus_wave : process (clk, rst) begin
        if rst = '1' then
            address <= 0;
            adr_rom <= "00000";
        elsif falling_edge(clk) then
            adr_rom <= std_logic_vector(to_unsigned(address+1, 5));
            address <= address + 1;
        end if;
    end process sinus_wave;

end Behavioral;
