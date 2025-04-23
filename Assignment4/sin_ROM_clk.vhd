----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 01:07:35 PM
-- Design Name: 
-- Module Name: sin_ROM_clk - Behavioral
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

entity sin_ROM_clk is
    Port( clk : in STD_LOGIC;
        address : in  STD_LOGIC_VECTOR (4 downto 0);
        data_out : out STD_LOGIC_VECTOR (7 downto 0)
        );
end sin_ROM_clk;

architecture Behavioral of sin_ROM_clk is
type ROM_TYPE is array (0 to 31) of STD_LOGIC_VECTOR(7 downto 0);
constant ROM : ROM_TYPE := ( -- values for sin wave
    x"80", x"98", x"B0", x"C7",
    x"DA", x"EA", x"F6", x"FD",
    x"FF", x"FD", x"F6", x"EA",
    x"DA", x"C7", x"B0", x"98",
    x"80", x"67", x"4F", x"38",
    x"25", x"15", x"09", x"02",
    x"00", x"02", x"09", x"15",
    x"25", x"38", x"4F", x"67"
    );
begin
    process (clk) begin
        if rising_edge(clk) then
            data_out <= ROM(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;
