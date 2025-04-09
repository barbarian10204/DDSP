----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2025 03:48:55 PM
-- Design Name: 
-- Module Name: reg_pipo_8b-tb - Behavioral
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

entity reg_pipo_8b_tb is
--  Port ( );
end reg_pipo_8b_tb;

architecture Behavioral of reg_pipo_8b_tb is
component reg_pipo_8b is
    Port ( data_out : out STD_LOGIC_VECTOR (7 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           clk, rst, load : in std_logic);
end component reg_pipo_8b;
signal din, dout : std_logic_vector (7 downto 0) :="00000000";
signal clk, rst, load : std_logic :='0';
constant clk_T : time := 20 ns;

begin
    uut : component reg_pipo_8b port map(
        data_in=>din,
        data_out=>dout,
        clk=>clk,
        rst=>rst,
        load=>load
    );
    clock : process begin
        wait for clk_T/2;
        clk <= not clk;
    end process clock;
    testing : process begin
        wait for clk_T*2;
        din <= "10101010";
        load <= '1';
        wait for clk_T; -- check if loading works
        din <= "11001100";
        wait for clk_T; -- check if load is 1 cicle long
        load <= '0';
        din <= "00001111";
        wait for clk_T; -- check if loading stops if load = 0
        wait for clk_T/10;
        rst <= '1';
        wait for clk_T*9/10; -- check if reset works asynchroniously
        rst <= '0';
        wait;
    end process testing;

end Behavioral;
