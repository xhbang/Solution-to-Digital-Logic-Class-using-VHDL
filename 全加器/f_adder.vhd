 --1λ������ȫ���������������
          LIBRARY  IEEE;
          USE IEEE.STD_LOGIC_1164.ALL;
          ENTITY f_adder IS
           PORT (   ain bin cin  : IN STD_LOGIC;
                    cout sum   : OUT STD_LOGIC );
         END ENTITY f_adder;
          ARCHITECTURE fd1 OF f_adder IS
           COMPONENT h_adder
              PORT (    a b :  IN STD_LOGIC;
                       co so :  OUT STD_LOGIC);
           END COMPONENT 
           COMPONENT or2
            PORT (a b : IN STD_LOGIC; c : OUT STD_LOGIC);
             END COMPONENT
             SIGNAL d e f  :  STD_LOGIC;
         BEGIN
         u1 : h_adder PORT MAP( a =>ain b =>bin co=>d so =>e);
        u2 : h_adder PORT MAP( a =>e b =>cin co =>f so =>sum);
         u3 :   or2    PORT MAP(a =>d  b =>f c =>cout);
          END ARCHITECTURE fd1 ;