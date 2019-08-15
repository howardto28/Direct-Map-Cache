library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache is 

	port(
		row_en:in std_logic_vector(7 downto 0);
		column_en:in std_logic_vector(3 downto 0);
		wr_data: in std_logic_vector(7 downto 0);
		wr_tag: in std_logic_vector(2 downto 0);
		rd_wr_en: in std_logic;
		reset: in std_logic;
		tag_valid_en: in std_logic;
		rd_data: out std_logic_vector(7 downto 0);
		rd_tag: out std_logic_vector(2 downto 0);
		rd_valid: out std_logic


		);
end cache;

architecture structural of cache is

component cache_block
	port(
		row_en:in std_logic;
		column_en:in std_logic_vector(3 downto 0);
		wr_data: in std_logic_vector(7 downto 0);
		wr_tag: in std_logic_vector(2 downto 0);
		rd_wr_en: in std_logic;
		reset: in std_logic;
		tag_valid_en: in std_logic;
		rd_data: out std_logic_vector(7 downto 0);
		rd_tag: out std_logic_vector(2 downto 0);
		rd_valid: out std_logic

		);
end component;

for all: cache_block use entity work.cache_block(structural);

begin

	cache_block1: cache_block port map(row_en(0),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block2: cache_block port map(row_en(1),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block3: cache_block port map(row_en(2),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block4: cache_block port map(row_en(3),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block5: cache_block port map(row_en(4),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block6: cache_block port map(row_en(5),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block7: cache_block port map(row_en(6),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
	cache_block8: cache_block port map(row_en(7),column_en,wr_data,wr_tag,rd_wr_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);





end structural;
