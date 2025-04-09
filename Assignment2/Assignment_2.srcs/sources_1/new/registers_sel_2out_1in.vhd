----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2025 04:23:22 PM
-- Design Name: 
-- Module Name: registers_sel_2out_1in - Structural
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

entity registers_sel_2out_1in is
    port(
        outA, outB : out std_logic_vector(7 downto 0);
        inA : in std_logic_vector(7 downto 0);
        sel_in, sel_out1, sel_out2 : in std_logic_vector(1 downto 0);
        clk, rst, write : in std_logic
    );
end registers_sel_2out_1in;

architecture Structural of registers_sel_2out_1in is
    component reg_pipo_8b is
        Port ( data_out : out STD_LOGIC_VECTOR (7 downto 0);
            data_in : in STD_LOGIC_VECTOR (7 downto 0);
            clk, rst, load : in std_logic);
    end component;
    signal dinA, dinB, dinC, dinD, doutA, doutB, doutC, doutD : std_logic_vector(7 downto 0);
    signal clk_reg, rst_reg, loadA, loadB, loadC, loadD : std_logic;
    component dmux_2to4 is
        port(
            input : in std_logic;
            out1, out2, out3, out4 : out std_logic;
            sel : in std_logic_vector(1 downto 0)
        );
    end component dmux_2to4;
    signal in_dmux, out1_dmux, out2_dmux, out3_dmux, out4_dmux : std_logic;
    signal sel_dmux : std_logic_vector(1 downto 0);

begin
    dmux : component dmux_2to4 port map(
        input=>in_dmux,
        out1=>out1_dmux,
        out2=>out2_dmux,
        out3=>out3_dmux,
        out4=>out4_dmux,
        sel=>sel_dmux
    );
    registerA : component reg_pipo_8b port map(
        data_out=>doutA,
        data_in=>dinA,
        clk=>clk_reg,
        rst=>rst_reg,
        load=>loadA
    );
    registerB : component reg_pipo_8b port map(
        data_out=>doutB,
        data_in=>dinB,
        clk=>clk_reg,
        rst=>rst_reg,
        load=>loadB
    );
    registerC : component reg_pipo_8b port map(
        data_out=>doutC,
        data_in=>dinC,
        clk=>clk_reg,
        rst=>rst_reg,
        load=>loadC
    );
    registerD : component reg_pipo_8b port map(
        data_out=>doutD,
        data_in=>dinD,
        clk=>clk_reg,
        rst=>rst_reg,
        load=>loadD
    );
    -- output multiplexers
    with sel_out1 select
    outA <= doutA when "00",
            doutB when "01",
            doutC when "10",
            doutD when "11";
    with sel_out2 select
    outB <= doutA when "00",
            doutB when "01",
            doutC when "10",
            doutD when "11";
    -- input demultiplexer
    sel_dmux <= sel_in;
    in_dmux <= write;
    loadA <= out1_dmux;
    loadB <= out2_dmux;
    loadC <= out3_dmux;
    loadD <= out4_dmux;
    -- data in
    dinA <= inA;
    dinB <= inA;
    dinC <= inA;
    dinD <= inA;
    -- clock, reset
    clk_reg <= clk;
    rst_reg <= rst;

end Structural;
