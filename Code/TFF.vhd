library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity TFF is
  port(
    t : in std_logic;
    clk : in std_logic;
    rst : in std_logic;
    q : out std_logic);
end TFF;

architecture structural of TFF is

component dff
  port(
    d : in std_logic;
    clk : in std_logic;
    q : out std_logic
    );
  end component;

  component xor2
  port(
    input1 : in std_logic;
    input2 : in std_logic;
    output : out std_logic);
  end component;

  component buf
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

  component inverter
  port(
  		input : in std_logic;
  		output : out std_logic);
  end component;



  for dff_1: dff use entity work.dff(structural);
  for xor2_1: xor2 use entity work.xor2(structural);
  for buf1: buf use entity work.buf(structural);
  for and2_1: and2 use entity work.and2(structural);
  for inverter1: inverter use entity work.inverter(structural);

  signal temp1,temp2,temp3,temp4,temp5,temp6: std_logic :='0';

begin

  xor2_1: xor2 port map(temp2,t,temp1);
  and2_1: and2 port map(temp1,temp6,temp5);
  dff_1: dff port map(temp5,clk,temp2);
  buf1: buf port map(temp2,q);
  inverter1: inverter port map(rst,temp6);


  end structural;
  
