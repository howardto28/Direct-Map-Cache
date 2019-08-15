library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_valid is 
	port(
		en: in std_logic;
		wr_valid: in std_logic;
		rd_wr_en: in std_logic;
		reset: in std_logic;
		rd_valid: out std_logic);
end cache_valid;

architecture structural of cache_valid is

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

component or2
	port(
		input1: in std_logic;
		input2: in std_logic;
		output: out std_logic);
end component;

for all: inverter use entity work.inverter (structural);
for all: tx use entity work.tx(structural);
for all: DLatch use entity work.DLatch(structural);
for all: and2 use entity work.and2(structural);
for all: or2 use entity work.or2(structural);

signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8: std_logic;

begin 


	inverter1: inverter port map(en,temp4);
	tx1: tx port map(en,temp4,temp1,rd_valid);
	DLatch1: DLatch port map(wr_valid,temp7,temp1);
	and2_2: and2 port map(rd_wr_en,en,temp6);
	or2_1: or2 port map(temp6,reset,temp7);
	

end structural;

