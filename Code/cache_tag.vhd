library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_tag is
	port(
		row_en: in std_logic;
		rd_wr_en: in std_logic;
		wr_tag: in std_logic_vector(2 downto 0);
		rd_tag: out std_logic_vector(2 downto 0)
	);
end cache_tag;

architecture structural of cache_tag is 


component DLatch
	port(
		d: in std_logic;
		clk: in std_logic;
		q: out std_logic);
end component;

component tx
	port(
		sel: in std_logic;
		selnot: in std_logic;
		input: in std_logic;
		output: out std_logic);
end component;

component and2
	port(
		input1: in std_logic;
		input2: in std_logic;
		output: out std_logic);
end component;

component inverter
	port(
		input: in std_logic;
		output: out std_logic);
end component;


for all: DLatch use entity work.DLatch(structural);
for all: inverter use entity work.inverter(structural);
for all: and2 use entity work.and2(structural);
for all: tx use entity work.tx(structural);

signal temp1,temp2,temp3,temp4,temp5,temp6: std_logic;

begin
	
	and2_1: and2 port map(rd_wr_en,row_en,temp1);
	latch1: DLatch port map(wr_tag(0),temp1,temp2);
	inverter1: inverter port map(row_en,temp4);
	tx1: tx port map(row_en,temp4,temp2,rd_tag(0));

	latch2: DLatch port map(wr_tag(1),temp1,temp5);
	tx2: tx port map(row_en,temp4,temp5,rd_tag(1));

	latch3: DLatch port map(wr_tag(2),temp1,temp6);
	tx3: tx port map(row_en,temp4,temp6,rd_tag(2));


end structural;