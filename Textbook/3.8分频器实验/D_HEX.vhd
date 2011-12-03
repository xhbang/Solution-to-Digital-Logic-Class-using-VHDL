--LEDÏÔÊ¾×ÓÄ£¿é£ºD_HEX.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY D_HEX IS
  PORT(CS      : IN STD_LOGIC;
       DATA    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
       HEX_OUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
       HEX_OUT1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
      );
END ENTITY D_HEX;

ARCHITECTURE BEHAV OF D_HEX IS
 SIGNAL COM    : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
   COM<=DATA;
   PROCESS(COM,CS)
      BEGIN
     IF(CS='1') THEN
         CASE COM IS    --GFEDCBA
          WHEN "0000"  => HEX_OUT <="0111111" ;--0
                          HEX_OUT1<="0111111" ;--0
          WHEN "0001"  => HEX_OUT <="0000110" ;--1
                          HEX_OUT1<="0111111" ;--0
          WHEN "0010"  => HEX_OUT<="1011011" ;--2
                          HEX_OUT1<="0111111" ;--0
          WHEN "0011"  => HEX_OUT<="1001111" ;--3
                          HEX_OUT1<="0111111" ;--0
          WHEN "0100"  => HEX_OUT<="1100110" ;--4
                          HEX_OUT1<="0111111" ;--0
          WHEN "0101"  => HEX_OUT<="1101101" ;--5
                          HEX_OUT1<="0111111" ;--0
          WHEN "0110"  => HEX_OUT<="1111101" ;--6
                          HEX_OUT1<="0111111" ;--0
          WHEN "0111"  => HEX_OUT<="0000111" ;--7
                          HEX_OUT1<="0111111" ;--0
          WHEN "1000"  => HEX_OUT<="1111111" ;--8
                          HEX_OUT1<="0111111" ;--0
          WHEN "1001"  => HEX_OUT<="1101111" ;--9
                          HEX_OUT1<="0111111" ;--0
          WHEN "1010"  => HEX_OUT <="0111111" ;--0
                          HEX_OUT1<="0000110" ;--1
          WHEN "1011"  => HEX_OUT <="0000110" ;--1
                          HEX_OUT1<="0000110" ;--1
          WHEN "1100"  => HEX_OUT<="1011011" ;--2
                          HEX_OUT1<="0000110" ;--1
          WHEN "1101"  => HEX_OUT<="1001111" ;--3
                          HEX_OUT1<="0000110" ;--1
          WHEN "1110"  => HEX_OUT<="1100110" ;--4
                          HEX_OUT1<="0000110" ;--1
          WHEN "1111"  => HEX_OUT<="1101101" ;--5
                          HEX_OUT1<="0000110" ;--1
          WHEN OTHERS  =>HEX_OUT<="1111111" ;--8
                          HEX_OUT1<="1111111" ;--8          
   END CASE;
END IF;
 IF(CS='0')  THEN
   CASE COM IS
         WHEN OTHERS=>HEX_OUT<="1111111" ;--8
                      HEX_OUT1<="1111111" ;--8          
   END CASE;
 END IF;
END PROCESS;
END ARCHITECTURE BEHAV;