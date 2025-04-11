-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Fri Mar 21 13:31:44 2025
-- Host        : 5CG008 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/Work/Documents/Denmark/University/Semester
--               4/DDSP/frequency_divider/frequency_divider.sim/sim_1/impl/func/xsim/clock_divider_tb_func_impl.vhd}
-- Design      : clock_divider
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_divider is
  port (
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clock_divider : entity is true;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ of clock_divider : entity is std.standard.true;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ of clock_divider : entity is std.standard.true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of clock_divider : entity is "beb3dcbe";
  attribute N : integer;
  attribute N of clock_divider : entity is 2;
end clock_divider;

architecture STRUCTURE of clock_divider is
  signal clk_in_IBUF : STD_LOGIC;
  signal clk_in_IBUF_BUFG : STD_LOGIC;
  signal clk_out_OBUF : STD_LOGIC;
  signal clk_out_val_i_1_n_0 : STD_LOGIC;
  signal rst_IBUF : STD_LOGIC;
begin
clk_in_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_in_IBUF,
      O => clk_in_IBUF_BUFG
    );
clk_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in,
      O => clk_in_IBUF
    );
clk_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk_out_OBUF,
      O => clk_out
    );
clk_out_val_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_out_OBUF,
      O => clk_out_val_i_1_n_0
    );
clk_out_val_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => clk_out_val_i_1_n_0,
      Q => clk_out_OBUF
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
end STRUCTURE;
