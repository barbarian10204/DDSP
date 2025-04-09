----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 02:17:57 AM
-- Design Name: 
-- Module Name: ALU_test - Behavioral
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

entity ALU_test is
--  Port ( );
end ALU_test;

architecture Behavioral of ALU_test is
    component ALU is
        Port ( Ain : in std_logic_vector(7 downto 0);
               Bin : in std_logic_vector(7 downto 0);
               CarryIn : in std_logic;
               Sel : in std_logic_vector(1 downto 0);
               CarryOut : out std_logic;
               AllOut : out std_logic_vector(7 downto 0));
    end component ALU;
    Signal Ain : std_logic_vector(7 downto 0);
    Signal Bin : std_logic_vector(7 downto 0);
    Signal Cin : std_logic;
    Signal Sel : std_logic_vector(1 downto 0);
    Signal Cout : std_logic;
    Signal AllOut : std_logic_vector(7 downto 0);

    Signal tested : std_logic;

begin

    uut: ALU port map
        (
        Ain=>Ain,
        Bin=>Bin,
        CarryIn=>Cin,
        Sel=>Sel,
        CarryOut=>Cout,
        AllOut=>AllOut
        );
        process begin
            wait for 100ns; -- initial values 1
            Ain <= "00000000";
            Bin <= "00000000";
            Cin <= '0';
            Sel <= "11";
            wait for 1ns;
            if (AllOut = "00000000") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- test for summer 2
            Ain <= "01001100";
            Bin <= "00101010";
            Cin <= '0';
            Sel <= "11";
            wait for 1ns;
            if (AllOut = "01110110") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- test for carry out 3
            Ain <= "11111111";
            Bin <= "11111111";
            Cin <= '0';
            Sel <= "11";
            wait for 1ns;
            if (AllOut = "11111110" and Cout = '1') then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- test for carry in 4
            Ain <= "11111111";
            Bin <= "11111111";
            Cin <= '1';
            Sel <= "11";
            wait for 1ns;
            if (AllOut = "11111111" and Cout = '1') then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- tests for mux 5
            Ain <= "11001100";
            Bin <= "10101010";
            Cin <= '0';
            Sel <= "00";
            wait for 1ns;
            if (AllOut = "10001000") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- 6
            Ain <= "11001100";
            Bin <= "10101010";
            Cin <= '0';
            Sel <= "01";
            wait for 1ns;
            if (AllOut = "11101110") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- 7
            Ain <= "11001100";
            Bin <= "10101010";
            Cin <= '0';
            Sel <= "10";
            wait for 1ns;
            if (AllOut = "00110011") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait for 99ns; -- 8
            Ain <= "11001100";
            Bin <= "10101010";
            Cin <= '0';
            Sel <= "11";
            wait for 1ns;
            if (AllOut = "00000000") then
                tested <= '1';
            else
                tested <= '0';
            end if;
            wait;
        end process;

end Behavioral;
