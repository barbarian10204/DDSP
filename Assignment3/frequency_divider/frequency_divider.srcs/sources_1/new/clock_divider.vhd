----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2025 12:08:47 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  --use IEEE.NUMERIC_STD.ALL;
  -- Uncomment the following library declaration if instantiating
  -- any Xilinx leaf cells in this code.
  --library UNISIM;
  --use UNISIM.VComponents.all;

entity clock_divider is
  -- generic (N : integer := 2);
  port (clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC;
        rst     : in  STD_LOGIC;
        division : in integer);
end entity;

architecture Behavioral of clock_divider is
  signal counter     : integer   := 0;
  signal clk_out_val : std_logic := '0';

begin
  divider: process (clk_in, rst)
--    variable counter     : integer   := 0;
--    variable clk_out_val : std_logic := '0';
  begin
    if rst = '1' then
      counter <= 0;
      clk_out_val <= '0';
    elsif rising_edge(clk_in) then
      if counter = (division / 2 - 1) then
        clk_out_val <= not clk_out_val;
        counter <= 0;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
    clk_out <= clk_out_val;
end architecture;
