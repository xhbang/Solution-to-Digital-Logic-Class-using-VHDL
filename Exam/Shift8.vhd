----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:06 06/10/2010 
-- Design Name: 
-- Module Name:    Shift8 - Behavioral 
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

entity Shift8 is
port(clk,load,en:in std_logic;
		di:in std_logic;
		do:out std_logic);
end Shift8;

architecture Behavioral of Shift8 is
variable reg:std_logic_vector(7 downto 0);
begin
if load='1' then reg<="ZZZZZZZZ";
	else if clk'event and clk='1' then reg(0)<=di;
	reg(7 downto 1)<=reg(6 downto 0);
	end if;
end if;
if en='1' then do<=reg(7);
end process;
end Behavioral;

