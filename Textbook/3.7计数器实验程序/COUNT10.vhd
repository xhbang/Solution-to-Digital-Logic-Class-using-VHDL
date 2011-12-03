--此例是一个带有异步复位和同步时钟使能的十进制加法计数器
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
      VARIABLE CQI  : STD_LOGIC_VECTOR(3 DOWNTO 0); --为了形成内部的寄存器时序电路，将CQI定义为变量，而没有按通常的方法定义成信号。
        BEGIN         --信号的赋值符号是"<=" 变量的赋值符号是" := "
          IF RST='1' THEN CQI:=(OTHERS=>'0'); --计数器复位，这种操作是独立于CLK的，因而称为异步
                         -- 省略赋值操作符
           ELSIF CLK'EVENT AND CLK='1'  THEN    --检测时钟上升沿
            IF EN='1' THEN                   --检测是否允许计数 此语句构成了二输入的与门
               IF CQI < "1001" THEN CQI:= CQI + 1;--允许计数 构成了比较器
                 ELSE CQI:=(OTHERS =>'0');   --大于9计数值清零 此语句构成二选一的多路选择器
               END IF;
            END IF;
          END IF;
          IF CQI="1001" THEN COUT<='1'; --计数等于9，输出进位信号
             ELSE COUT<='0';
          END IF;
              CQ<=CQI;                  --将计数值向端口输出
    END PROCESS;
END ARCHITECTURE BEH;