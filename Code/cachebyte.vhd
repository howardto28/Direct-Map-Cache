library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cachebyte is
	port(
		row_en: in std_logic;
		column_en: in std_logic;
		wr_data: in std_logic_vector(7 downto 0);
		rd_wr_en: in std_logic;
		rd_data: out std_logic_vector(7 downto 0)
	);
	end cachebyte;

	architecture structural of cachebyte is
	component cachecell	
		port(
			en: in std_logic;
			wr_data: in std_logic;
			rd_wr_en: in std_logic;
			rd_data: out std_logic);
	end component;

	component and2
		port(
			input1: in std_logic;
			input2: in std_logic;
			output: out std_logic);
	end component;

	for all: cachecell use entity work.cachecell(structural);
	for all: and2 use entity work.and2(structural);


	signal temp1: std_logic;
	begin


	and2_1: and2 port map(row_en,column_en,temp1);
	cachecell1: cachecell port map(temp1,wr_data(0),rd_wr_en,rd_data(0));
	cachecell2: cachecell port map(temp1,wr_data(1),rd_wr_en,rd_data(1));
	cachecell3: cachecell port map(temp1,wr_data(2),rd_wr_en,rd_data(2));
	cachecell4: cachecell port map(temp1,wr_data(3),rd_wr_en,rd_data(3));
	cachecell5: cachecell port map(temp1,wr_data(4),rd_wr_en,rd_data(4));
	cachecell6: cachecell port map(temp1,wr_data(5),rd_wr_en,rd_data(5));
	cachecell7: cachecell port map(temp1,wr_data(6),rd_wr_en,rd_data(6));
	cachecell8: cachecell port map(temp1,wr_data(7),rd_wr_en,rd_data(7));



	end structural;