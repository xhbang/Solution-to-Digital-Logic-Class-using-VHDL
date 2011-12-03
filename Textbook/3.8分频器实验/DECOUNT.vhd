--一个可预置系数的半整数分频器实现N=1~15的分频：DECOUNT.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DECOUNT IS
  PORT(CS       : IN  STD_LOGIC ;--使能
       INCLK    : IN  STD_LOGIC; --时钟输入
       PRESET   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);--预置分频值
       LED1,LED2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);--LED数码管
       OUTCLK : BUFFER STD_LOGIC --时钟输出
      );
END ENTITY DECOUNT;

ARCHITECTURE BEHAV OF DECOUNT IS
  SIGNAL CLK ,DIVIDE2 : STD_LOGIC;
  SIGNAL COUNT        : STD_LOGIC_VECTOR(3 DOWNTO 0);
    COMPONENT D_HEX   --子模块例化语句
       PORT(  CS    : IN  STD_LOGIC;
            DATA    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            HEX_OUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX_OUT1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
           );
    END COMPONENT;
    BEGIN
       CLK<= INCLK XOR DIVIDE2;
          PROCESS(CLK)
             BEGIN
                IF(CLK'EVENT AND CLK='1')THEN
                    IF(COUNT="0000")THEN
                          COUNT<=PRESET-1;
                          OUTCLK<='1';
                    ELSE
                          COUNT<=COUNT-1;
                          OUTCLK<='0';
                    END IF;
                END IF;
          END PROCESS;

      PROCESS(OUTCLK )
         BEGIN
             IF(OUTCLK'EVENT and OUTCLK='1') THEN
               DIVIDE2<=NOT DIVIDE2;
             END IF;
      END PROCESS;

DISPLAY1: D_HEX     --调用子模块
   PORT MAP(CS=>CS,DATA=>PRESET, 
      HEX_OUT =>LED1,HEX_OUT1=>LED2);
 END ARCHITECTURE BEHAV;