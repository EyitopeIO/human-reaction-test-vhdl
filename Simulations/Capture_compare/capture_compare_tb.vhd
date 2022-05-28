----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 13:59:44
-- Design Name: 
-- Module Name: capture_compare_tb - Behavioral
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

entity capture_compare_tb is
--  Port ( );
end capture_compare_tb;

architecture Behavioral of capture_compare_tb is

component capture_compare is
    Port (
        clock_1Hz:      in std_logic;
        random_number:  in std_logic_vector(3 downto 0);
        control:        in std_logic;
        count_reached:  out std_logic
    );
end component;

signal clock_1Hz : std_logic := '0';
signal random_number : std_logic_vector(3 downto 0) := "0000";
signal control : std_logic := '1';
signal count_reached : std_logic;

begin

uut: capture_compare port map (clock_1Hz => clock_1Hz, random_number => random_number, control => control, count_reached => count_reached);

clock: process
begin
    clock_1Hz <= '0';
    wait for 500ms;
    clock_1Hz <= '1';
    wait for 500ms;
end process;

logic: process
begin
    random_number <="1010";
    control<= '1';
    wait for 1000ms;
    random_number <= "1100";
    wait for 1000ms;
    random_number <= "1001";
    wait for 16000ms;
    random_number <= "1110";
    wait for 1000ms;
    control <= '0';
    wait for 5000ms;
    random_number <= "1010";
    wait until count_reached = '1';
    wait for 1000ms;
    control <= '1';
    wait for 1000ms;
    random_number <= "0001";
    wait for 1000ms;
    control <= '0';
    wait until count_reached = '1';
    wait for 1000ms;
    
end process;

end Behavioral;
