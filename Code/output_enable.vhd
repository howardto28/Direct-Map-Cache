library STD;
library IEEE;
use IEEE.std_logic_1164.all;


entity output_enable is 
port(
		cpu_data_in: in std_logic_vector(7 downto 0);
		en: in std_logic;
		cpu_data_out: out std_logic_vector(7 downto 0)
	);
end output_enable;

architecture structural of output_enable is
	component tx
		port(

			sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output:out std_logic);
        end component; 

    component inverter
    	port(
    		input: in std_logic;
    		output: out std_logic);
    end component;

    for all: tx use entity work.tx(structural);
    for all: inverter use entity work.inverter(structural);
    signal temp1: std_logic;
    
    begin

    inverter1: inverter port map(en,temp1);
    tx1: tx port map(en,temp1,cpu_data_in(0),cpu_data_out(0));
    tx2: tx port map(en,temp1,cpu_data_in(1),cpu_data_out(1));
    tx3: tx port map(en,temp1,cpu_data_in(2),cpu_data_out(2));
    tx4: tx port map(en,temp1,cpu_data_in(3),cpu_data_out(3));
    tx5: tx port map(en,temp1,cpu_data_in(4),cpu_data_out(4));
    tx6: tx port map(en,temp1,cpu_data_in(5),cpu_data_out(5));
    tx7: tx port map(en,temp1,cpu_data_in(6),cpu_data_out(6));
    tx8: tx port map(en,temp1,cpu_data_in(7),cpu_data_out(7));




    end structural;