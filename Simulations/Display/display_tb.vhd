library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_tb is
end display_tb;

architecture display_tb_arch of display_tb is

component display is
    Port (clk_8KHz : in std_logic;  
          one_mil : in integer; 
          ten_mil : in integer; 
          hundred_mil : in integer; 
          one_sec : in integer; 
          hr_state : in std_logic_vector(2 downto 0);  
          anode : out std_logic_vector(7 downto 0);
          cathode : out std_logic_vector(7 downto 0) 
          );
end component;

signal clk_8KHz : std_logic := '0';
signal one_mil : integer := 0;
signal ten_mil : integer := 0;
signal hundred_mil : integer := 0;
signal one_sec : integer := 0;
signal hr_state : std_logic_vector(2 downto 0) := "000";
signal anode : std_logic_vector(7 downto 0);
signal cathode : std_logic_vector(7 downto 0);

begin

uut: display port map (clk_8KHz => clk_8KHz, one_mil => one_mil, ten_mil => ten_mil, hundred_mil => hundred_mil, one_sec => one_sec, hr_state => hr_state, anode => anode, cathode => cathode);

clock: process
begin
clk_8KHz <= '0';
wait for 62500ns;
clk_8KHz <= '1';
wait for 62500ns;
end process;

logic: process
begin
    one_mil <= 0;
    ten_mil <= 0;
    hundred_mil <= 0;
    one_sec <= 0;
    hr_state <= "000"; --Inital state.
    wait for 500us;
    one_mil <= 3;
    ten_mil <=5;
    hundred_mil <= 2;
    one_sec <= 9;
    wait for 500us;
    hr_state <= "001"; --Random wait state.
    one_mil <= 0;
    ten_mil <= 0;
    hundred_mil <= 0;
    one_sec <= 0;
    wait for 500us;
    one_mil <= 5;
    ten_mil <= 2;
    hundred_mil <= 8;
    wait for 500us;
    hr_state <= "010"; --Count state.
    one_mil <= 0;
    ten_mil <= 0;
    hundred_mil <= 0;
    one_sec <= 0;
    wait for 500us;
    one_mil <= 10;
    ten_mil <= 11;
    hundred_mil <= 12;
    one_sec <= 13;
    wait for 500us;
    one_mil <= 6;
    ten_mil <= 7;
    hundred_mil <= 2;
    one_sec <= 1;
    wait for 500us;
    hr_state <= "100";
    wait for 500us;
    hr_state <= "011";
    one_mil <= 0;
    ten_mil <= 0;
    hundred_mil <= 0;
    one_sec <= 0;
    wait for 500us;
    one_mil <= 3;
    ten_mil <= 5;
    hundred_mil <= 8;
    one_sec <= 9;
    wait for 500us;
end process;

end display_tb_arch;