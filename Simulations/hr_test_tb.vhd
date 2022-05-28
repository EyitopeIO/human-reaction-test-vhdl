library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hr_test_tb is
end hr_test_tb;

architecture Behavioral of hr_test_tb is
component HR_Test is 
    port (
        
        button_clear: in std_logic;
        button_stop: in std_logic;
        button_start: in std_logic;
        clock_100MHz: in std_logic;

        seven_seg_anode: out std_logic_vector(7 downto 0);
        seven_seg_cathode: out std_logic_vector(7 downto 0);
        led:        out std_logic_vector(2 downto 0)
        
    );
end component;
signal button_clear : std_logic := '0';
signal button_stop : std_logic := '0';
signal button_start : std_logic := '0';
signal clock_100MHz : std_logic := '0';
signal seven_seg_anode : std_logic_vector(7 downto 0) := "11111111";
signal seven_seg_cathode : std_logic_vector(7 downto 0) := "11111111";
signal led : std_logic_vector(2 downto 0) := "000";
begin

uut: HR_Test port map (button_clear => button_clear, button_stop => button_stop, button_start => button_start, clock_100MHz => clock_100MHz, seven_seg_anode => seven_seg_anode, seven_seg_cathode => seven_seg_cathode, led => led);

process
begin
clock_100MHz <= '0';
wait for 5ns;
clock_100MHz <= '1';
wait for 5ns;
end process;

process
begin
button_clear <= '0';
button_stop <= '0';
button_start <= '0';
wait for 100ms;
button_start <= '1';
wait until led = "111";
wait for 1001ms;
end process;

end Behavioral;
