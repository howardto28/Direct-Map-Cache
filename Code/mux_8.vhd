library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_8 is

        port(
                M_D : in std_logic_vector(7 downto 0);
                C_D : in std_logic_vector(7 downto 0);
                D_Type : in std_logic;
                R_D : out std_logic_vector(7 downto 0)
                );
end mux_8;

architecture structural of mux_8 is

	component mux 
		port (
				s0: in std_logic; 
				s1: in std_logic; 
				B : in std_logic; 
				Y : out std_logic); 
	end component; 

for all: mux use entity work.mux(structural); 

begin


	mux_0: mux port map (C_D(0),M_D(0),D_Type,R_D(0));
	mux_1: mux port map (C_D(1),M_D(1),D_Type,R_D(1));
	mux_2: mux port map (C_D(2),M_D(2),D_Type,R_D(2));
	mux_3: mux port map (C_D(3),M_D(3),D_Type,R_D(3));
	mux_4: mux port map (C_D(4),M_D(4),D_Type,R_D(4));
	mux_5: mux port map (C_D(5),M_D(5),D_Type,R_D(5));
	mux_6: mux port map (C_D(6),M_D(6),D_Type,R_D(6));
	mux_7: mux port map (C_D(7),M_D(7),D_Type,R_D(7));




end structural; 


