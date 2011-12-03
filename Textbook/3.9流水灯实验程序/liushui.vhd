--流水灯状态机的设计：LIUSHUI.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY LIUSHUI IS
  PORT(  CLK ,RST  :  IN   STD_LOGIC;
         DOUT   :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0));
END ENTITY LIUSHUI;

ARCHITECTURE BEHV OF LIUSHUI IS
   TYPE STATES IS (ST0,ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8,ST9,ST10,ST11,
                   ST12,ST13,ST14,ST15,ST16,ST17,ST18,ST19,ST20,
                   ST21,ST22,ST23,ST24,ST25,ST26,ST27,ST28,ST29,ST30,
                   ST31);
   SIGNAL CURRENT_STATE,NEXT_STATE:STATES ; 
   SIGNAL DATA : STD_LOGIC_VECTOR(15 DOWNTO 0);
  BEGIN
    SWITCH_ORDER:PROCESS(CLK,RST)  --主控时序进程：负责状态机运转和在时钟
                           --驱动下负责状态转换的进程
          BEGIN
            IF RST ='1' THEN   CURRENT_STATE <=ST0 ;
               ELSIF CLK='1' AND CLK'EVENT
             THEN CURRENT_STATE <= NEXT_STATE;
            END IF;
    END PROCESS ;  
   
    CONTROL_S: PROCESS(CURRENT_STATE ,DATA)--主控组合进程：根据外部输入的控制信号
             --或（和）当前状态的状态值确定下一状态的取向，即Next_State的取值内容
          BEGIN    --以及确定对外输出或对内部其他组合和时序进程输出控制信号的内容
               CASE CURRENT_STATE IS
                 WHEN ST0  =>  DATA<="1000000000000001" ; NEXT_STATE<= ST1;                                                 
                 WHEN ST1  =>  DATA<="1100000000000011" ; NEXT_STATE<= ST2;
                 WHEN ST2  =>  DATA<="1110000000000111" ; NEXT_STATE<= ST3;
                 WHEN ST3  =>  DATA<="1111000000001111" ; NEXT_STATE<= ST4;
                 WHEN ST4  =>  DATA<="1111100000011111" ; NEXT_STATE<= ST5;
                 WHEN ST5  =>  DATA<="1111110000111111" ; NEXT_STATE<= ST6;
                 WHEN ST6  =>  DATA<="1111111001111111" ; NEXT_STATE<= ST7;
                 WHEN ST7  =>  DATA<="1111111111111111" ; NEXT_STATE<= ST8;
                 WHEN ST8  =>  DATA<="0111111111111110" ; NEXT_STATE<= ST9;
                 WHEN ST9  =>  DATA<="0011111111111100" ; NEXT_STATE<= ST10;
                 WHEN ST10 =>  DATA<="0001111111111000" ; NEXT_STATE<= ST11;
                 WHEN ST11 =>  DATA<="0000111111110000" ; NEXT_STATE<= ST12;
                 WHEN ST12 =>  DATA<="0000011111100000" ; NEXT_STATE<= ST13;
                 WHEN ST13 =>  DATA<="0000001111000000" ; NEXT_STATE<= ST14;
                 WHEN ST14 =>  DATA<="0000000110000000" ; NEXT_STATE<= ST15;
                 WHEN ST15 =>  DATA<="0000000000000000" ; NEXT_STATE<= ST16;
                 WHEN ST16 =>  DATA<="0000000110000000" ; NEXT_STATE<= ST17;
                 WHEN ST17 =>  DATA<="0000001111000000" ; NEXT_STATE<= ST18;
                 WHEN ST18 =>  DATA<="0000011111100000" ; NEXT_STATE<= ST19;
                 WHEN ST19 =>  DATA<="0000111111110000" ; NEXT_STATE<= ST20;
                 WHEN ST20 =>  DATA<="0001111111111000" ; NEXT_STATE<= ST21;
                 WHEN ST21 =>  DATA<="0011111111111100" ; NEXT_STATE<= ST22;
                 WHEN ST22 =>  DATA<="0111111111111110" ; NEXT_STATE<= ST23;
                 WHEN ST23 =>  DATA<="1111111111111111" ; NEXT_STATE<= ST24;
                 WHEN ST24 =>  DATA<="1111111001111111" ; NEXT_STATE<= ST25;
                 WHEN ST25 =>  DATA<="1111110000111111" ; NEXT_STATE<= ST26;
                 WHEN ST26 =>  DATA<="1111100000011111" ; NEXT_STATE<= ST27;
                 WHEN ST27 =>  DATA<="1111000000001111" ; NEXT_STATE<= ST28;
                 WHEN ST28 =>  DATA<="1110000000000111" ; NEXT_STATE<= ST29;
                 WHEN ST29 =>  DATA<="1100000000000011" ; NEXT_STATE<= ST30;
                 WHEN ST30 =>  DATA<="1000000000000001" ; NEXT_STATE<= ST31;
                 WHEN ST31 =>  DATA<="0000000000000000" ; NEXT_STATE<= ST0;
                 WHEN OTHERS=> DATA<="0000000011111111" ; NEXT_STATE<= ST0;
               END CASE;
    END PROCESS  ;
         DOUT <= DATA;
  END ARCHITECTURE BEHV;
