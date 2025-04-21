----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2025 11:37:28 PM
-- Design Name: 
-- Module Name: couter_8bit - Behavioral
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
-- use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity couter_8bit is
    Port (
        clk : in std_logic;
        count_val : out std_logic_vector(7 downto 0);
        rst : in std_logic
    );
end couter_8bit;

architecture Behavioral of couter_8bit is
    signal counter: std_logic_vector(7 downto 0) := "00000000";

begin

    upcount : process (clk, rst) begin
        -- variable temp_count: std_logic(7 downnto 0) := counter;
        if rst = '1' then
            counter <= "00000000";
            count_val <= "00000000";
        elsif falling_edge(clk) then -- actually port updates on the other edge
            -- counter ++
            for i in 0 to 7 loop
                if counter(i) = '0' then
                    counter(i) <= '1';
                    exit;
                elsif counter(i) = '1' then
                    counter(i) <= '0';
                end if;
            end loop;
        end if;
    count_val <= counter;
    end process upcount;

end Behavioral;