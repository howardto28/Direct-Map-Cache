library STD;
library IEEE;
use IEEE.std_logic_1164.all;


entity comparator is
	port (	
			address : in std_logic_vector (7 downto 5);
			valid: in std_logic;
			tag	: in  std_logic_vector (2 downto 0);
			hit_miss: out std_logic);
end comparator;

architecture structural of comparator is

component and4
    port (  input1   : in std_logic;
            input2  :  in std_logic;
            input3 : in std_logic;
            input4: in std_logic;
            output  : out std_logic);
end component;

component xnor2
	port(input1 : in std_logic;
		input2: in std_logic;
		output: out std_logic);
end component;

for all: and4 use entity work.and4(structural);

for all: xnor2 use entity work.xnor2(structural);


signal temp1,temp2,temp3: std_logic;

begin

	xnor2_1: xnor2 port map(tag(2),address(7),temp1);
	xnor2_2: xnor2 port map(tag(1),address(6),temp2);
	xnor2_3: xnor2 port map(tag(0),address(5),temp3);
	and4_1: and4 port map(temp1,temp2,temp3,valid,hit_miss);

end structural;