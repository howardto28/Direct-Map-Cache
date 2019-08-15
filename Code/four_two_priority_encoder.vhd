library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity four_two_priority_encoder is
port(
		i0: in std_logic;
		i1: in std_logic;
		i2: in std_logic;
		i3: in std_logic;
		o: out std_logic_vector(1 downto 0)
);
end four_two_priority_encoder;

architecture structural of four_two_priority_encoder is

component or2
port(
	input1: in std_logic;
	input2: in std_logic;
	output: out std_logic);
end component;


for all: or2 use entity work.or2(structural);

begin
	or2_1: or2 port map(i1,i3,o(0));
	or2_2: or2 port map(i2,i3,o(1));

end structural;
