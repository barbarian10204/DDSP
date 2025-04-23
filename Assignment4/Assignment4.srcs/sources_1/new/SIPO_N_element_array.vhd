----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 02:12:26 PM
-- Design Name: 
-- Module Name: SIPO_N_element_array - Behavioral
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

entity SIPO_N_element_array is
    generic ( window_size : integer := 4 );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        serial_in : in std_logic_vector(7 downto 0);
        paralel_out0 : out std_logic_vector(7 downto 0);
        paralel_out1 : out std_logic_vector(7 downto 0);
        paralel_out2 : out std_logic_vector(7 downto 0);
        paralel_out3 : out std_logic_vector(7 downto 0)
    );
end SIPO_N_element_array;
    
architecture Behavioral of SIPO_N_element_array is
    type window is array (0 to window_size) of std_logic_vector(7 downto 0);
    signal data_window : window;

begin
    process (clk, rst) begin
        if rst = '1' then
            data_window <= (others => "00000000");
        elsif rising_edge(clk) then
            for i in window_size downto 1 loop
                data_window(i) <= data_window(i-1);
            end loop;
            data_window(0) <= serial_in;
        end if;
    end process;

    paralel_out0 <= data_window(0);
    paralel_out1 <= data_window(1);
    paralel_out2 <= data_window(2);
    paralel_out3 <= data_window(3);

end Behavioral;
