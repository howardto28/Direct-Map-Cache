library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cachecell is 
	port(
		en: in std_logic;
		wr_data: in std_logic;
		rd_wr_en: in std_logic;
		rd_data: out std_logic);
end cachecell;

architecture structural of cachecell is 

component inverter
	port(
		input: in std_logic;
		output: out std_logic);
end component;

component tx
	port(
		sel: in std_logic;
		selnot: in std_logic;
		input: in std_logic;
		output: out std_logic);
end component;

component DLatch
	port(
		d: in std_logic;
		clk: in std_logic;
		q: out std_logic);
end component;

component and2
	port(
		input1: in std_logic;
		input2: in std_logic;
		output: out std_logic);
end component;


for all: inverter use entity work.inverter(structural);
for all: tx use entity work.tx(structural);
for all: DLatch use entity work.DLatch(structural);
for all: and2 use entity work.and2(structural);

signal temp1,temp2,temp3,temp4,temp5,temp6: std_logic;

begin

	and2_1: and2 port map(en,rd_wr_en,temp3);
	inverter1: inverter port map(temp3,temp4);
	tx1: tx port map(temp3,temp4,temp1,rd_data);
	DLatch1: DLatch port map(wr_data,temp6,temp1);
	inverter2: inverter port map(rd_wr_en,temp5);
	and2_2: and2 port map(temp5,en,temp6);
	
end structural;