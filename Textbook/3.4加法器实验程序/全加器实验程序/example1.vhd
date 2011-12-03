library ieee;
use ieee.std_logic_1164.all;
entity example1 is 
  port(ai,bi,cin:in std_logic;
       si,ci:out std_logic);
end  example1;
architecture e8 of example1 is
begin
   si<=(ai xor bi)xor cin;
  ci<=(ai and bi)or(cin and ai)or(cin and bi);
end   e8;