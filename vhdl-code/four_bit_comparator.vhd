----------------------------------------------------------------------------------
-- For:     Coventry University 
-- Author:  Eyitope Adelowo 
-- 
-- Create Date: 31.03.2022 08:36:45
-- Module Name: comparator - comp_arch
-- Target Devices: xc7a100tcsg324-1 
-- Description: Trigger output high when input a greater than or equal to input b

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity comparator is
    port (
        a:      in std_logic_vector(3 downto 0);
        b:      in std_logic_vector(3 downto 0);
        gtoe:   out std_logic;
        clock:  in std_logic;
        pause:  in std_logic
    );
end comparator;

architecture comp_arch of comparator is
begin
    process(clock, pause, a, b)
    begin
        if (pause='1') then
            gtoe <= '0';
        elsif (a >= b) then
            gtoe <= '1';
        else
            gtoe <= '0';
        end if;
        --end if;
    end process;
end comp_arch;
