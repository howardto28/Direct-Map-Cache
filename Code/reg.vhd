library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity reg is 
	port(
		d: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		q: out std_logic_vector(7 downto 0));
end reg;

architecture structural of reg is 

component dff
	port(
		d: in std_logic;
		clk: in std_logic;
		q: out std_logic
	);
end component;

for all: dff use entity work.dff(structural);

signal temp1: std_logic;

begin

dff1: dff port map(d(0),clk,q(0));
dff2: dff port map(d(1),clk,q(1));
dff3: dff port map(d(2),clk,q(2));
dff4: dff port map(d(3),clk,q(3));
dff5: dff port map(d(4),clk,q(4));
dff6: dff port map(d(5),clk,q(5));
dff7: dff port map(d(6),clk,q(6));
dff8: dff port map(d(7),clk,q(7));

end structural;