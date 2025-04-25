----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 03:07:10 PM
-- Design Name: 
-- Module Name: average_calculator - Behavioral
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
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity average_calculator is
    generic (
        window_size : integer := 4; -- should work for 1, 2, 4, 8
        sum_size : integer := 10 -- shold be 8, 9, 10, 11
    );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        data_line : in std_logic_vector(7 downto 0);
        average : out std_logic_vector(7 downto 0)
    );
end average_calculator;

architecture Behavioral of average_calculator is
    component full_adder_12b is
        generic(
            bits_to_sum : integer := sum_size-1
        );
        Port (
            term1 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
            term2 : in STD_LOGIC_VECTOR(bits_to_sum downto 0);
            carry_in : in STD_LOGIC;
            sum : out STD_LOGIC_VECTOR(bits_to_sum downto 0);
            carry_out : out STD_LOGIC
            );
    end component full_adder_12b;
    signal term1_add : std_logic_vector(sum_size-1 downto 0);
    signal term2_add : std_logic_vector(sum_size-1 downto 0);
    signal carry_in_add : std_logic;
    signal sum_add : std_logic_vector(sum_size-1 downto 0);
    signal carry_out_add : std_logic;

    signal sum: std_logic_vector(sum_size-1 downto 0) := (others => '0');

    -- set up the array for average calculating
    type window is array (0 to window_size) of std_logic_vector(7 downto 0);
    signal data_window : window := (others => (others => '0'));

begin
    -- set up the adder
    adder: component full_adder_12b
      port map (
        term1     => term1_add,
        term2     => term2_add,
        carry_in  => carry_in_add,
        sum       => sum_add,
        carry_out => carry_out_add
      );

    calculation : process (clk, rst)
        variable iSum : std_logic_vector(sum_size-1 downto 0) := (others => '0');
        variable iCarry: std_logic := '0';
        begin
        if rst = '1' then
            sum <= (others => '0');
            average <= (others => '0');
        elsif rising_edge(clk) then
            -- get new data from data line
            for i in window_size downto 1 loop
                data_window(i) <= data_window(i-1);
            end loop;
            data_window(0) <= data_line;
            -- calculate the new average
            iCarry := '0';
            for i in 0 to window_size-1 loop
                -- summ the sum with data_in(i)
                term1_add <= EXT(data_window(i), sum_size);
                term2_add <= iSum;
                carry_in_add <= iCarry;
                iCarry := carry_out_add;
                iSum := sum_add;
            end loop;
            case window_size is
                when 1 =>
                    average <= iSum;
                when 2 =>
                    average <= iSum -- left shift by 1
            end case;
        end if;
    end process calculation;

end Behavioral;
