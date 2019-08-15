--
-- Entity: dff
-- Architecture : structural
-- Author: cpatel2
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff_pos is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic
         ); 
end dff_pos;                          

architecture structural of dff_pos is 

  
begin
  
  output: process                 

  begin                           
    wait until ( clk'EVENT and clk = '1' ); 
    q <= d;
   
  end process output;        

                             
end structural;  


