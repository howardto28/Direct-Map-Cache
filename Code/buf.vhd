library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity buf is
    port(
      input : in std_logic;
      output : out std_logic);
end buf;

architecture structural of buf is

  component inverter
    port(
      input : in std_logic;
      output : out std_logic);
  end component;

  for inverter1, inverter2: inverter use entity work.inverter(structural);

  signal temp1: std_logic;

begin
  inverter1: inverter port map(input,temp1);
  inverter2: inverter port map(temp1,output);

 end structural;
