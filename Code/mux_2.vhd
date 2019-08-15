library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2 is 
	port(
		cpu_offset: in std_logic_vector (1 downto 0);
		memory_offset: in std_logic_vector (1 downto 0);
		sel: in std_logic;
		offset: out std_logic_vector(1 downto 0)
	);
end mux_2;

architecture structural of mux_2 is 
	component mux 
		port(
			s0: in std_logic;
			s1: in std_logic;
			B: in std_logic;
			Y: out std_logic);
	end component;

for all: mux use entity work.mux(structural);

begin
	mux1: mux port map(cpu_offset(0),memory_offset(0),sel,offset(0));
	mux2: mux port map(cpu_offset(1),memory_offset(1),sel,offset(1));
end structural;