----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:14:34 AM
-- Design Name: 
-- Module Name: updown8bit - Behavioral
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

entity updown8bit is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           flag : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0);
           carryover : inout  STD_LOGIC);
end updown8bit;

architecture Behavioral of updown8bit is
signal counter : STD_LOGIC_VECTOR (7 downto 0);
signal direction : STD_LOGIC;
--signal carryover : STD_LOGIC;
begin
    process (clk, rst) begin
        if rst = '1' then
            counter <= "00000000";
            flag <= '0';
        end if;
        if falling_edge(clk) then
        ---if clk = '1' then
            carryover <= '1';
            flag <= '0';
            for i in 0 to 7 loop
                if (counter(i) = '1') then
                    counter(i) <= '0';
                elsif (counter(i) = '0') then
                    counter(i) <= '1';
                    carryover <= '0';
                    exit;
                end if;
            end loop;
            flag <= carryover;
            output <= counter;     
        end if;
    end process;
end Behavioral;
