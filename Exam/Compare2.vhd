----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:14 06/10/2010 
-- Design Name: 
-- Module Name:    Compare2 - Behavioral 
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

entity Compare2 is
      port(A, B      :in std_logic_vector(3 downto 0);
              EI,   GI,  LI       :in std_logic；    _ _低位比较的三种结果
              EO, GO, LO      :out std_logic);
end Compare2;

architecture Behavioral of Compare2 is

begin
            if (A > B) then GO <= ‘1’ after 10ns;  
                                      EO <= ‘0’ after 10ns;  LO <= ‘0’ after 10ns;
            elsif (A < B) then LO <= ‘1’ after 10ns;  
                                      EO <= ‘0’ after 10ns; GO <= ‘0’ after 10ns;
            else
                  if (EI = ‘1’  then EO <= ‘1’ after 10ns;  LO <= ‘0’ after 10ns;
                                               GO <= ‘0’ after 10ns;
                 elsif(GI = ‘1’  then EO <= ‘0’ after 10ns;  LO <= ‘0’ after 10ns;
                                               GO <= ‘1’ after 10ns;
                 elsif(LI = ‘1’  then EO <= ‘0’ after 10ns;  LO <= ‘1’ after 10ns;
                                               GO <= ‘0’ after 10ns;
                 end if;
            end if;   

end Behavioral;

