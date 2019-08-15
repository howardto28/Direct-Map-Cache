library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux is 

	port(
		s0 : in std_logic;--input1 
		s1 : in std_logic;--input2
		B : in std_logic;--select
		Y : out std_logic
		);
end mux;

architecture structural of mux is 

component and2
	port(
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

component or2
	port(
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

component inverter
	port (
	input    : in  std_logic;
	output   : out std_logic);
end component;
	
for all: and2 use entity work.and2(structural);
for all: or2 use entity work.or2(structural);
for all: inverter use entity work.inverter(structural); 

signal temp1,temp2,temp3 : std_logic;

begin

and2_1 : and2 port map(s1,temp2,temp1);
and2_2 : and2 port map(s0,B,temp3);	

or2_1 : or2 port map(temp1,temp3,Y);	

inverter_1 : inverter port map(B,temp2);

end structural;



