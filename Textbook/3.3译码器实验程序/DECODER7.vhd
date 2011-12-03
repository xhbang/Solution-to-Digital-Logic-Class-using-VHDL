--BCD/七段译码器的设计：DECODER7.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY DECODER7 IS
   PORT
	(BCD4 : IN STD_LOGIC_VECTOR(3 downto 0);--四位BCD码输入
	LED7 : OUT STD_LOGIC_VECTOR(6 downto 0));--七位输出
END ENTITY DECODER7;

ARCHITECTURE BCD_LED OF DECODER7 IS	
BEGIN
  PROCESS( BCD4)
   BEGIN
   CASE BCD4 IS                --gfedcba
          WHEN "0000"  => LED7<="0111111" ;
          WHEN "0001"  => LED7<="0000110" ;
          WHEN "0010"  => LED7<="1011011" ;
          WHEN "0011"  => LED7<="1001111" ;
          WHEN "0100"  => LED7<="1100110" ;
          WHEN "0101"  => LED7<="1101101" ;
          WHEN "0110"  => LED7<="1111101" ;
          WHEN "0111"  => LED7<="0000111" ;
          WHEN "1000"  => LED7<="1111111" ;
          WHEN "1001"  => LED7<="1101111" ;
          WHEN OTHERS  => LED7<="0000000" ;
   END CASE;
 END PROCESS ;
END ARCHITECTURE BCD_LED;

