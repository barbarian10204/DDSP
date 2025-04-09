----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 01:14:03 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( Ain : in std_logic_vector(7 downto 0);
           Bin : in std_logic_vector(7 downto 0);
           CarryIn : in std_logic;
           Sel : in std_logic_vector(1 downto 0);
           CarryOut : out std_logic;
           AllOut : out std_logic_vector(7 downto 0));
end ALU;

architecture Structural of ALU is

component Full_adder is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(7 downto 0);
           C : out STD_LOGIC);
end component Full_adder;
Signal Ain_adder : std_logic_vector(7 downto 0);
Signal Bin_adder : std_logic_vector(7 downto 0);
Signal Cin_adder : std_logic;
Signal Sout_adder : std_logic_vector(7 downto 0);
Signal Cout_adder : std_logic;

component Mux is
    Port (A : in std_logic_vector(7 downto 0);
	      B : in std_logic_vector(7 downto 0);
	      C : in std_logic_vector(7 downto 0);
	      D : in std_logic_vector(7 downto 0);
	      Sel : in std_logic_vector(1 downto 0);
	      E : out std_logic_vector(7 downto 0));
end component Mux;
Signal Ain_mux : std_logic_vector(7 downto 0);
Signal Bin_mux : std_logic_vector(7 downto 0);
Signal Cin_mux : std_logic_vector(7 downto 0);
Signal Din_mux : std_logic_vector(7 downto 0);
Signal Eout_mux : std_logic_vector(7 downto 0);
Signal Sin_mux : std_logic_vector(1 downto 0);

component Logics is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           C : out STD_LOGIC_VECTOR(7 downto 0);
           D : out STD_LOGIC_VECTOR(7 downto 0);
           E : out STD_LOGIC_VECTOR(7 downto 0));
end component Logics;
Signal Ain_logic : std_logic_vector(7 downto 0);
Signal Bin_logic : std_logic_vector(7 downto 0);
Signal Cout_logic : std_logic_vector(7 downto 0);
Signal Dout_logic : std_logic_vector(7 downto 0);
Signal Eout_logic : std_logic_vector(7 downto 0);

begin

    adder : component Full_adder port map
        (
            A=>Ain_adder,
            B=>Bin_adder,
            Ci=>Cin_adder,
            S=>Sout_adder,
            C=>Cout_adder
        );
    multiplex : component Mux port map
    
        (
            A=>Ain_mux,
            B=>Bin_mux,
            C=>Cin_mux,
            D=>Din_mux,
            Sel=>Sin_mux,
            E=>Eout_mux
        );
    logic : component Logics port map
        (
            A=>Ain_logic,
            B=>Bin_logic,
            C=>Cout_logic,
            D=>Dout_logic,
            E=>Eout_logic
        );
    Ain_adder <= Ain;
    Bin_adder <= Bin;
    Cin_adder <= CarryIn;
    Ain_logic <= Ain;
    Bin_logic <= Bin;
    Ain_mux <= Cout_logic;
    Bin_mux <= Dout_logic;
    Cin_mux <= Eout_logic;
    Din_mux <= Sout_adder;
    Sin_mux <= Sel;
    AllOut <= Eout_mux;
    CarryOut <= Cout_adder;

end Structural;
