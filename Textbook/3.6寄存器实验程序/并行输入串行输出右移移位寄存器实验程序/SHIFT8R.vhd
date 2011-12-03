--带有同步并行预置功能的8位右移移位寄存器:SHIFT8R.VHD
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFT8R IS
  PORT( CLK , LOAD : IN STD_LOGIC ;  --CLK是移位时钟信号、LOAD是并行数据预置使能信号
        DIN  : IN STD_LOGIC_VECTOR(7 DOWNTO 0); --DIN是8位并行预置数据端口
        QB   : OUT STD_LOGIC ); --QB是串行输出端口
END ENTITY SHIFT8R;

ARCHITECTURE BEHAV OF SHIFT8R IS
   BEGIN
      PROCESS(CLK,LOAD)
         VARIABLE REG8 : STD_LOGIC_VECTOR( 7 DOWNTO 0);
           BEGIN
             IF CLK'EVENT AND CLK='1' THEN
                 IF LOAD='1' THEN
                    REG8 := DIN;  --装载新数据
                 ELSE 
                    REG8(6 DOWNTO 0):= REG8(7 DOWNTO 1);
  -- 此语句表明：一个时钟周期后将上一时钟周期移位寄存器中的高7位
  -- 二进制数赋给此寄存器的低7位
                 END IF;
             END IF;
           QB <= REG8(0);
      END PROCESS;           -- 输出最低位
END ARCHITECTURE BEHAV;