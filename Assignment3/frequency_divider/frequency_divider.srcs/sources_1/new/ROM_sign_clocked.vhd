----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 10:32:26 AM
-- Design Name: 
-- Module Name: ROM_sign_clocked - Behavioral
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

entity ROM_sign_clocked is
    Port (clk : in std_logic;
        address : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
        );
end ROM_sign_clocked;

architecture Behavioral of ROM_sign_clocked is
    type ROM_type is array (0 to 15) of std_logic_vector(7 downto 0); -- defines the data type for ROM
    constant ROM : ROM_type := ( -- values for sign wave as seperate 8 bit signed integers
        x"0A", x"1B", x"2C", x"3D",x"4E", x"5F", x"60", x"71",x"82", x"93", x"A4", x"B5",x"C6", x"D7", x"E8", x"F9"
        );

begin

    print_ROM_val : process (clk) begin
        if rising_edge(clk) then
            output <= ROM(to_integer(unsigned(address)));
        end if;
    end process print_ROM_val;

end Behavioral;
