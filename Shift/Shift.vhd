----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:32:16 06/10/2010 
-- Design Name: 
-- Module Name:    Shift - Behavioral 
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

entity Shift is
	port(rst,load,clk: in std_logic_vector;
			di:in std_logic_vector(7 downto 0);
			do:out std_logic);
end Shift;

architecture Behavioral of Shift is
variable q:std_logic_vector(7 downto 0);
begin
process(rst,clk,load)
if rst='1' then q<="00000000"; do<="0";
	else if clk'event and clk='1'
		if load='0' then q<=di;do<=0;
		else
			for i in 0 to 7 loop
				q(i)=q(i+1);
			end loop;
			do<=q(0);
			--another way q(6 downto 0)<=q(7 downto 1)
		end if;
	end if;
end if;
end process;
end Behavioral;

