library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity block_decoder is
	port(
		block_offset: in std_logic_vector(2 downto 0);
		row: out std_logic_vector(7 downto 0));

end block_decoder;

architecture structural of block_decoder is

	component inverter
	port(
		input: in std_logic;
		output: out std_logic);
	end component;

	component and3
	port(
		input1: in std_logic;
		input2: in std_logic;
		input3: in std_logic;
		output: out std_logic);
	end component;

	for all: inverter use entity work.inverter(structural);
	for all: and3  use entity work.and3(structural);
	signal temp1,temp2,temp3: std_logic;

	begin

	inverter1: inverter port map(block_offset(2),temp1);
	inverter2: inverter port map(block_offset(1),temp2);
	inverter3: inverter port map(block_offset(0),temp3);

	and3_1: and3 port map(temp1,temp2,temp3,row(0));
	and3_2: and3 port map(temp1,temp2,block_offset(0),row(1));
	and3_3: and3 port map(temp1,block_offset(1),temp3,row(2));
	and3_4: and3 port map(temp1,block_offset(1),block_offset(0),row(3));
	and3_5: and3 port map(block_offset(2),temp2,temp3,row(4));
	and3_6: and3 port map(block_offset(2),temp2,block_offset(0),row(5));
	and3_7: and3 port map(block_offset(2),block_offset(1),temp3,row(6));
	and3_8: and3 port map(block_offset(2),block_offset(1),block_offset(0),row(7));

	end structural;






