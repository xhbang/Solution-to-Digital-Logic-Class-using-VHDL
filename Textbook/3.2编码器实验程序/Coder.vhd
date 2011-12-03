
-- 8�ߣ�3�����ȱ���������ƣ�CODER.VHD

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CODER IS
   PORT( DATAIN:  IN STD_LOGIC_VECTOR(0 TO 7);
         DOUT  : OUT STD_LOGIC_VECTOR(0 TO 2));
END ENTITY CODER;

ARCHITECTURE BEHAV OF CODER IS
  SIGNAL SINT : STD_LOGIC_VECTOR(4 DOWNTO 0);
--signal<�ź���>{��...}��<������>[Լ����Χ][:=<���ʽ>]��
    BEGIN
       PROCESS(DATAIN)
          BEGIN                         
              IF(DATAIN(7)='1') THEN DOUT<="111";
           ELSIF(DATAIN(6)='1') THEN DOUT<="011";
           ELSIF(DATAIN(5)='1') THEN DOUT<="101";
           ELSIF(DATAIN(4)='1') THEN DOUT<="001";
           ELSIF(DATAIN(3)='1') THEN DOUT<="110";
           ELSIF(DATAIN(2)='1') THEN DOUT<="010";
           ELSIF(DATAIN(1)='1') THEN DOUT<="100";
              ELSE                   DOUT<="000";
              END IF;
       END PROCESS;
  END  ARCHITECTURE BEHAV;