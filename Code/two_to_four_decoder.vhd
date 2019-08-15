library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity two_to_four_decoder is
	port(
		byte_offset: in std_logic_vector(1 downto 0);
		d : out std_logic_vector(3 downto 0));
	end two_to_four_decoder;

	architecture structural of two_to_four_decoder is

		component inverter
			port(
				input : in std_logic;
				output : out std_logic);
		end component;

		component and2
			port(
				input1 : in std_logic;
				input2 : in std_logic;
				output : out std_logic);
		end component;

		for inverter1,inverter2: inverter use entity work.inverter(structural);
		for and2_1,and2_2,and2_3,and2_4: and2 use entity work.and2(structural);

		signal temp1,temp2: std_logic;

		begin
		inverter2: inverter port map(byte_offset(0),temp2);
		inverter1: inverter port map(byte_offset(1),temp1);
		and2_1: and2 port map(temp1,temp2,d(0));
		and2_2: and2 port map(temp1,byte_offset(0),d(1));
		and2_3: and2 port map(byte_offset(1),temp2,d(2));
		and2_4: and2 port map(byte_offset(1),byte_offset(0),d(3));

		end structural;