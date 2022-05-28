----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 13:59:44
-- Design Name: 
-- Module Name: four_bit_latch_tb - Behavioral
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

entity four_bit_latch_tb is
--  Port ( );
end four_bit_latch_tb;

architecture Behavioral of four_bit_latch_tb is

component four_bit_latch is
    port (
        D:  in std_logic_vector(3 downto 0);
        E:  in std_logic;
        Q:  out std_logic_vector(3 downto 0)
    );
end component;

signal D : std_logic_vector(3 downto 0) := "0000";
signal E : std_logic:= '0';
signal Q : std_logic_vector(3 downto 0);

begin

uut: four_bit_latch port map (D => D, E => E, Q => Q);

logic: process
begin
    D <= "1010";
    E <= '0';
    wait for 100ns;
    E <= '1';
    wait for 50ns;
    E <= '0';
    wait for 100ns;
    D <= "1111";
    wait for 100ns;
    D <= "0110";
    wait for 100ns;
    E <= '1';
    wait for 50ns;
    E <= '0';
    wait for 100ns;
    D <= "0001";
    wait for 100ns;
    E <= '1';
    wait for 50ns;
    E <= '0';
    wait for 100ns;
    
end process;


end Behavioral;
