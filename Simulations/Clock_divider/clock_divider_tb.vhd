----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 13:53:05
-- Design Name: 
-- Module Name: clock_divider_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_tb is
end clock_divider_tb;

architecture Behavioral of clock_divider_tb is

component clock_divider is
    port (
        clock_100MHz: in std_logic;
        clock_1000Hz: out std_logic;
        clock_1Hz:    out std_logic;
        clock_8000Hz: out std_logic
    );
end component;

signal clock_100MHz : std_logic := '0';
signal clock_1000Hz : std_logic;
signal clock_1Hz : std_logic;
signal clock_8000Hz : std_logic;

begin

uut: clock_divider port map (clock_100MHz => clock_100MHz, clock_1000Hz => clock_1000Hz, clock_1Hz => clock_1Hz, clock_8000Hz => clock_8000Hz);

clock: process
begin
    clock_100MHz <= '0';
    wait for 5ns;
    clock_100MHz <= '1';
    wait for 5ns;
end process;

end Behavioral;
