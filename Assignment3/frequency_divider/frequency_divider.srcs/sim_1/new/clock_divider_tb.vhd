----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2025 12:53:57 PM
-- Design Name: 
-- Module Name: clock_divider_tb - Behavioral
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
  use IEEE.STD_LOGIC_1164.all;

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  --use IEEE.NUMERIC_STD.ALL;
  -- Uncomment the following library declaration if instantiating
  -- any Xilinx leaf cells in this code.
  --library UNISIM;
  --use UNISIM.VComponents.all;

entity clock_divider_tb is
  --  Port ( );
end entity;

architecture Behavioral of clock_divider_tb is
  component clock_divider is
    generic (N : integer := 50000);
    port (clk_in  : in  STD_LOGIC;
          clk_out : out STD_LOGIC;
          rst     : in  STD_LOGIC);
  end component;
  signal clk_in, clk_out, rst : std_logic := '0';
  constant clk_T : time := 20 ns;

begin
  uut: component clock_divider
    port map (
      clk_in  => clk_in,
      clk_out => clk_out,
      rst     => rst
    );

  clock: process
  begin
    wait for clk_T / 2;
    clk_in <= not clk_in;
  end process;
--  testing: process
--  begin
--    wait for clk_T*10;
--    rst <= '1';
--    wait for clk_T*5;
--    rst <= '0';
--    wait;
--  end process;

end architecture;
