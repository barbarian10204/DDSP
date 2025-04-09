----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2025 12:23:16 PM
-- Design Name: 
-- Module Name: reg_sel_2out_1in_tb - Behavioral
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

entity reg_sel_2out_1in_tb is
--  Port ( );
end reg_sel_2out_1in_tb;

architecture Behavioral of reg_sel_2out_1in_tb is

  component registers_sel_2out_1in is
    port (
      outA, outB                 : out std_logic_vector(7 downto 0);
      inA                        : in  std_logic_vector(7 downto 0);
      sel_in, sel_out1, sel_out2 : in  std_logic_vector(1 downto 0);
      clk, rst, write            : in  std_logic
    );
  end component registers_sel_2out_1in;
  signal outA, outB, inA: std_logic_vector(7 downto 0) := "00000000";
  signal selIn, selOut1, selOut2: std_logic_vector(1 downto 0) := "00";
  signal clk, rst, write: std_logic := '0';
  constant clk_T: time := 20 ns;

begin

    uut: component registers_sel_2out_1in port map(
        outA=>outA,
        outB=>outB,
        inA=>inA,
        sel_in=>selIn,
        sel_out1=>selOut1,
        sel_out2=>selOut2,
        clk=>clk,
        rst=>rst,
        write=>write
    );
      clock: process begin
        wait for clk_T/2;
        clk <= not clk;
      end process clock;
      testing: process begin
        wait for clk_T*4;
        inA <= "11000011";
        write <= '1';
        selIn <= "01";
        wait for clk_T;
        write <= '0';
        selOut1 <= "01";
        wait for clk_T; -- check if writing to register and reading from it will be fine

        wait for clk_T; -- check if loading only if write is true
      end process testing;

end Behavioral;
