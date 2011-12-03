----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:54:11 06/10/2010 
-- Design Name: 
-- Module Name:    Compare - Behavioral 
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

entity Compare is
port(a,b :in std_logic_vector(3 downto 0);
		EO,GO,LO: out std_logic);
end Compare;

architecture Behavioral of Compare is

begin
if(a>b) then
	EO='0' after 20ns;
	GO='1' after 20ns;
	LO='0' after 20ns;
	elsif (A < B) then LO <= ¡®1¡¯ after 10ns;  
							EO <= ¡®0¡¯ after 10ns; GO <= ¡®0¡¯ after 10ns;
	els EO <= ¡®1¡¯ after10ns; EO <= ¡®0¡¯ after10ns;  LO <= ¡®0¡¯ after10ns;
	end if;
end behavioral;


