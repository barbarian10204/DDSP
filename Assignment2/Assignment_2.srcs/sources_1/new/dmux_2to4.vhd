----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2025 05:04:07 PM
-- Design Name: 
-- Module Name: dmux_2to4 - Behavioral
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

entity dmux_2to4 is
    port(
        input : in std_logic;
        out1, out2, out3, out4 : out std_logic;
        sel : in std_logic_vector(1 downto 0)
    );
end dmux_2to4;

architecture Behavioral of dmux_2to4 is
    signal decoded: std_logic_vector(3 downto 0);

begin
    with sel select
    decoded <= "0001" when "00",
            "0010" when "01",
            "0100" when "10",
            "1000" when "11";
    out1 <= decoded(0) and input;
    out2 <= decoded(1) and input;
    out3 <= decoded(2) and input;
    out4 <= decoded(3) and input;

end Behavioral;
