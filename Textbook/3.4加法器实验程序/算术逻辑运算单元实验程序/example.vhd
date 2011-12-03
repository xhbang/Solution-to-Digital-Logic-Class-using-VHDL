library ieee;
use ieee.std_logic_1164.all;
entity example is 
  port(a,b:in std_logic;
       sum,carry:out std_logic);
end entity example ;
architecture e7 of example is
signal c,d :std_logic;
begin
    c<=a or b;
d<=a nand b;
carry<=not d;
sum<=c and d;
end architecture e7;