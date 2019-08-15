library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity decode_states is
	port(
	q : in std_logic_vector(4 downto 0);
	state : out std_logic_vector(13 downto 0));
end decode_states;

	architecture structural of decode_states is

	component inverter
	port(
		input : in std_logic;
		output : out std_logic);
	end component;

	component and3
	port(
		input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		output : out std_logic);
	end component;

	for inverter1: inverter use entity work.inverter(structural);
	for inverter2: inverter use entity work.inverter(structural);
	for inverter3: inverter use entity work.inverter(structural);
	for inverter4: inverter use entity work.inverter(structural);
	for inverter5: inverter use entity work.inverter(structural);
	for and3_1: and3 use entity work.and3(structural);
	for and3_2: and3 use entity work.and3(structural);
	for and3_3: and3 use entity work.and3(structural);
	for and3_4: and3 use entity work.and3(structural);
	for and3_5: and3 use entity work.and3(structural);
	for and3_6: and3 use entity work.and3(structural);
	for and3_7: and3 use entity work.and3(structural);
	for and3_8: and3 use entity work.and3(structural);
	for and3_9: and3 use entity work.and3(structural);
	for and3_10: and3 use entity work.and3(structural);
	for and3_11: and3 use entity work.and3(structural);
	for and3_12: and3 use entity work.and3(structural);
	for and3_13: and3 use entity work.and3(structural);
	for and3_14: and3 use entity work.and3(structural);
	for and3_15: and3 use entity work.and3(structural);
	for and3_16: and3 use entity work.and3(structural);
	for and3_17: and3 use entity work.and3(structural);
	for and3_18: and3 use entity work.and3(structural);

	

	signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9: std_logic;
	begin

	inverter1: inverter port map(q(4),temp1);
	inverter2: inverter port map(q(3),temp2);
	inverter3: inverter port map(q(2),temp3);
	inverter4: inverter port map(q(1),temp4);
	inverter5: inverter port map(q(0),temp5);

	and3_1: and3 port map(temp1,temp2,temp3,temp6);
	and3_2: and3 port map(temp6,temp4,temp5,state(0));--state0
	and3_3: and3 port map(temp6,temp4,q(0),state(1));--state1
	and3_4: and3 port map(temp6,q(1),temp5,state(2));--state2
	and3_5: and3 port map(temp6,q(1),q(0),state(3));--state3

	and3_6: and3 port map(temp1,q(3),temp3,temp7);
	and3_7: and3 port map(temp7,q(1),temp5,state(4));--state10
	and3_8: and3 port map(temp7,q(1),q(0),state(5));--state11

	and3_9: and3 port map(temp1,q(3),q(2),temp8);
	and3_10: and3 port map(temp8,temp4,temp5,state(6));--state12
	and3_11: and3 port map(temp8,temp4,q(0),state(7));--state13
	and3_12: and3 port map(temp8,q(1),temp5,state(8));--state14
	and3_13: and3 port map(temp8,q(1),q(0),state(9));--state15

	and3_14: and3 port map(q(4),temp2,temp3,temp9);
	and3_15: and3 port map(temp9,temp4,temp5,state(10));--state16
	and3_16: and3 port map(temp9,temp4,q(0),state(11));--state17
	and3_17: and3 port map(temp9,q(1),temp5,state(12));--state18
	and3_18: and3 port map(temp9,q(1),q(0),state(13));--state19




	end structural;








