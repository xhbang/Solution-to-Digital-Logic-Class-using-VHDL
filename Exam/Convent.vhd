----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:00:55 06/10/2010 
-- Design Name: 
-- Module Name:    Convent - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Convent is
port(flag:in std_logic;
		i_code:in std_logic_vector(3 downto 0);
		3_code:in std_logic_vector(3 downto 0);
		2_code:in std_logic_vector(3 downto 0));
end Convent;

architecture Behavioral of Convent is

begin
2_code <=i_code when (i_code<="0100" and flag='0') else
	(i_code+6) when (i_code>="0101" and i_code<="1001") else
	'Z' when other;
3_code<=(i_code+3) when(i_code<="1001" and flag='1') else
	'Z' when others;

end Behavioral;

--the original kind
o2421_code <= i_code when(i_code <= ¡°0100¡± and cflag = '0') else
						i_code + 6 when(i_code >=¡°0101¡± and i_code <=¡°1001¡±)
					  else ¡®Z¡¯ when other;
o3_code <= i_code + 3 when(i_code <= ¡°1001¡± and cflag ='0') else
					  ¡®Z¡¯ when other;

