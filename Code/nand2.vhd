
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nand2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end nand2;

architecture structural of nand2 is

begin

  output <= input2 nand input1;

end structural;