--串行输入并行输出寄存器:SHIFT8.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY Shift8 IS
  PORT( DI ,CLK : IN  STD_LOGIC;
        DOUT    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY Shift8;

ARCHITECTURE BEHA OF SHIFT8 IS
   SIGNAL TMP : STD_LOGIC_VECTOR(7 DOWNTO 0);
        BEGIN
          PROCESS(CLK)
              BEGIN
                IF(CLK'EVENT AND CLK='1') THEN
                    TMP(7)<=DI;
                     FOR I IN 1 TO 7 LOOP
                         TMP(7-I)<=TMP(8-I);
                     END LOOP;
                END IF;
           END PROCESS;
       DOUT<=TMP;
END ARCHITECTURE BEHA;