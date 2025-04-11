----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 10:42:27 AM
-- Design Name: 
-- Module Name: ROM_sin_tb - Behavioral
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

entity ROM_sin_tb is
--  Port ( );
end ROM_sin_tb;

architecture Behavioral of ROM_sin_tb is

component ROM_sign_clocked is
    Port (clk : in std_logic;
        address : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
        );
end component ROM_sign_clocked;
signal clk: std_logic := '0';
signal adr: std_logic_vector(3 downto 0) := "0000";
signal Dout: std_logic_vector(7 downto 0) := "00000000";
constant clk_T: time := 10 ns;

begin
    uut : component ROM_sign_clocked port map(
        clk => clk,
        address => adr,
        output => Dout
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*10;
        for i in 0 to 15 loop
            adr <= std_logic_vector(to_unsigned(i,4));
            wait for clk_T;
        end loop;
        wait;
    end process testing;

end Behavioral;
