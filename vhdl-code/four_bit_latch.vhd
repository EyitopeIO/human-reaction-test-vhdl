----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 15:07:40
-- Design Name: 
-- Module Name: four_bit_latch - latch_architecture
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_latch is
    port (
        D:  in std_logic_vector(3 downto 0);
        E:  in std_logic;
        Q:  out std_logic_vector(3 downto 0)
    );
end four_bit_latch;

architecture latch_architecture of four_bit_latch is
begin
    process (D, E) 
    begin
        if (E='1') then 
            if (D = "0001") then
                Q <= "1000";
            else
                Q(0)<=D(0);
                Q(1)<=D(1);
                Q(2)<=D(2);
                Q(3)<=D(3);
            end if;
        end if;
    end process;
end latch_architecture;
