----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:36:10 AM
-- Design Name: 
-- Module Name: updown8bitsim - Behavioral
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

entity updown8bitsim is
--  Port ( );
end updown8bitsim;

architecture Behavioral of updown8bitsim is
component updown8bit is
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           flag : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0);
           carryover : inout STD_LOGIC);
end component updown8bit;
signal clk, rst, flag, carryover : std_logic;
signal output : std_logic_vector (7 downto 0);
constant clk_T : time := 4ns;
begin
    unit: updown8bit port map
        (clk=>clk, rst=>rst, flag=>flag, output=>output, carryover => carryover);
    clock: process begin
        wait for clk_T/2;
        clk <= '1';
        wait for clk_T/2;
        clk <= '0';
    end process clock;
    reset: process begin
        rst <= '1';
        wait for clk_T;
        rst <= '0';
        wait;
    end process reset;
end Behavioral;
