--������һ�������첽��λ��ͬ��ʱ��ʹ�ܵ�ʮ���Ƽӷ�������
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

  ENTITY COUNT10 IS
    PORT( CLK,RST,EN :  IN  STD_LOGIC;
               CQ    :  OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           COUT      :  OUT STD_LOGIC);
  END ENTITY COUNT10;

ARCHITECTURE BEH OF COUNT10 IS
  BEGIN
    PROCESS(CLK,RST,EN)
      VARIABLE CQI  : STD_LOGIC_VECTOR(3 DOWNTO 0); --Ϊ���γ��ڲ��ļĴ���ʱ���·����CQI����Ϊ��������û�а�ͨ���ķ���������źš�
        BEGIN         --�źŵĸ�ֵ������"<=" �����ĸ�ֵ������" := "
          IF RST='1' THEN CQI:=(OTHERS=>'0'); --��������λ�����ֲ����Ƕ�����CLK�ģ������Ϊ�첽
                         -- ʡ�Ը�ֵ������
           ELSIF CLK'EVENT AND CLK='1'  THEN    --���ʱ��������
            IF EN='1' THEN                   --����Ƿ�������� ����乹���˶����������
               IF CQI < "1001" THEN CQI:= CQI + 1;--������� �����˱Ƚ���
                 ELSE CQI:=(OTHERS =>'0');   --����9����ֵ���� ����乹�ɶ�ѡһ�Ķ�·ѡ����
               END IF;
            END IF;
          END IF;
          IF CQI="1001" THEN COUT<='1'; --��������9�������λ�ź�
             ELSE COUT<='0';
          END IF;
              CQ<=CQI;                  --������ֵ��˿����
    END PROCESS;
END ARCHITECTURE BEH;