-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/06/2022 13:10:44"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FSM IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	A : IN std_logic;
	B : OUT std_logic;
	C : OUT std_logic
	);
END FSM;

-- Design Ports Information
-- B	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FSM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL \B~output_o\ : std_logic;
SIGNAL \C~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \y_present.S2~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \y_present.S2~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_A <= A;
B <= ww_B;
C <= ww_C;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;

-- Location: IOOBUF_X0_Y24_N2
\B~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector2~0_combout\,
	devoe => ww_devoe,
	o => \B~output_o\);

-- Location: IOOBUF_X0_Y25_N2
\C~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Selector3~0_combout\,
	devoe => ww_devoe,
	o => \C~output_o\);

-- Location: IOIBUF_X0_Y25_N15
\clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\A~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

-- Location: LCCOMB_X1_Y25_N16
\Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\A~input_o\) # (\y_present.S2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~input_o\,
	datad => \y_present.S2~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X1_Y25_N0
\y_present.S2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y_present.S2~0_combout\ = !\Selector3~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector3~0_combout\,
	combout => \y_present.S2~0_combout\);

-- Location: IOIBUF_X0_Y26_N1
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X1_Y25_N1
\y_present.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \y_present.S2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_present.S2~q\);

-- Location: LCCOMB_X1_Y25_N30
\Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\y_present.S2~q\ & !\A~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \y_present.S2~q\,
	datad => \A~input_o\,
	combout => \Selector2~0_combout\);

ww_B <= \B~output_o\;

ww_C <= \C~output_o\;
END structure;


