--ªÚ√≈¬ﬂº≠√Ë ˆ
        LIBRARY  IEEE ;
         USE IEEE.STD_LOGIC_1164.ALL;
         ENTITY or2 IS
            PORT (a,b :IN STD_LOGIC; c : OUT STD_LOGIC );
        END ENTITY or2
         ARCHITECTURE fu1 OF or2 IS
         BEGIN
           c <= a OR b ;    
         END ARCHITECTURE fu1;