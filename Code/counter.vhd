library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
  port(
    t : in std_logic;
    clk : in std_logic;
    rst : in std_logic;
    q : out std_logic_vector(4 downto 0));
end counter;



  architecture structural of counter is
    component TFF
      port(
        t : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        q : out std_logic);
      end component;

    component and2
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
      
      for TFF_1,TFF_2,TFF_3,TFF_4,TFF_5: TFF use entity work.TFF(structural);
      for and2_1,and2_2,and2_3: and2 use entity work.and2(structural);
      for all: buf use entity work.buf(structural);
      signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11: std_logic; 

      begin
      TFF_1: TFF port map(t,clk,rst,temp1);
      TFF_2: TFF port map(temp1,clk,rst,temp2);
      and2_1: and2 port map(temp1,temp2,temp3);
      TFF_3: TFF port map(temp3,clk,rst,temp4);
      and2_2: and2 port map(temp3,temp4,temp5);
      TFF_4: TFF port map(temp5,clk,rst,temp7);
      and2_3: and2 port map(temp5,temp7,temp6);
      TFF_5: TFF port map(temp6,clk,rst,q(4));
      buf1: buf port map(temp1,q(0));
      buf2: buf port map(temp2,q(1));
      buf3: buf port map(temp4,q(2));
      buf4: buf port map(temp7,q(3));
 

      end structural;
        
