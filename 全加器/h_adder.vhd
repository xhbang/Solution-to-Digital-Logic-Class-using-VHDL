 --���������
         LIBRARY  IEEE;
         USE IEEE.STD_LOGIC_1164.ALL;
          ENTITY h_adder IS
          PORT (a b : IN STD_LOGIC; co, so : OUT STD_LOGIC);
         END ENTITY h_adder
           ARCHITECTURE fh1 OF h_adder IS
            BEGIN
           so <= (a OR b)AND(a NAND b);
             co <= NOT( a NAND b);
           END ARCHITECTURE fh1;