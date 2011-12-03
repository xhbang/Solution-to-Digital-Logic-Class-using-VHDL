----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:16 06/10/2010 
-- Design Name: 
-- Module Name:    Counter10 - Behavioral 
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

entity Counter10 is
port(clk,en,rst:in std_logic;
		do:out std_logic_vector(3 downto 0);
		cout:out std_logic);
end Counter10;

architecture Behavioral of Counter10 is
variable cq:std_logic_vector(3 downto 0);
begin
process(clk,rst,en)
begin
if rst='1' then cq:='0';
	else if clk'event and clk='1' then
		if en='1' then
			if cq<"1001" then cq:=cq+1;
			else cq:='0';
			end if;
		end if;
		if cq="1001" then cout<='1';
	end if;
end if;
do<=cq;
end process;
end Behavioral;

