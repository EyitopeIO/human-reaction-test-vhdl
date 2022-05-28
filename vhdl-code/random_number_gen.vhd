----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 21:22:17
-- Design Name: 
-- Module Name: random_number_gen - random_gen_arch
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


entity random_number_gen is
    port (
        rand:   out std_logic_vector(3 downto 0);
        clock:  in std_logic
    );
end random_number_gen;

architecture random_gen_arch of random_number_gen is
    signal state_now, state_next:   std_logic_vector(3 downto 0) := "1010";
    signal feedback:                std_logic;
    signal clock_line:              std_logic;           
begin
    process(clock_line, state_now, state_next)
    begin
        if rising_edge(clock_line) then
            state_now <= state_next;
        end if;
    end process;
    rand <= state_now;
    clock_line <= clock;
    feedback <= state_now(1) xor state_now(0);
    state_next <= feedback & state_now(3 downto 1);
    
end random_gen_arch;