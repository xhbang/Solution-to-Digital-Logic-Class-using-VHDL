--����ͬ������Ԥ�ù��ܵ�8λ������λ�Ĵ���:SHIFT8R.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFT8R IS
  PORT( CLK , LOAD : IN STD_LOGIC ;  --CLK����λʱ���źš�LOAD�ǲ�������Ԥ��ʹ���ź�
        DIN  : IN STD_LOGIC_VECTOR(7 DOWNTO 0); --DIN��8λ����Ԥ�����ݶ˿�
        QB   : OUT STD_LOGIC ); --QB�Ǵ�������˿�
END ENTITY SHIFT8R;

ARCHITECTURE BEHAV OF SHIFT8R IS
   BEGIN
      PROCESS(CLK,LOAD)
         VARIABLE REG8 : STD_LOGIC_VECTOR( 7 DOWNTO 0);
           BEGIN
             IF CLK'EVENT AND CLK='1' THEN
                 IF LOAD='1' THEN
                    REG8 := DIN;  --װ��������
                 ELSE 
                    REG8(6 DOWNTO 0):= REG8(7 DOWNTO 1);
  -- ����������һ��ʱ�����ں���һʱ��������λ�Ĵ����еĸ�7λ
  -- �������������˼Ĵ����ĵ�7λ
                 END IF;
             END IF;
           QB <= REG8(0);
      END PROCESS;           -- ������λ
END ARCHITECTURE BEHAV;