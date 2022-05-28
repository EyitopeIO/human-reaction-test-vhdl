library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity count_up_tb is
end count_up_tb;

architecture count_up_tb_arch of count_up_tb is

component count_up is
      Port (clk_1KHz :in std_logic;
            button_clear : in std_logic;
            button_stop : in std_logic;
            hr_state : in std_logic_vector(2 downto 0);
            one_mil : out integer;
            ten_mil : out integer;
            hundred_mil : out integer;
            one_sec : out integer;
            count_done : out std_logic
            );
end component;

signal clk_1KHz : std_logic := '0';
signal button_clear : std_logic := '0';
signal button_stop : std_logic := '0';
signal hr_state : std_logic_vector(2 downto 0) := "000";
signal one_mil : integer;
signal ten_mil : integer;
signal hundred_mil : integer;
signal one_sec : integer;
signal count_done : std_logic;

begin

uut: count_up port map (clk_1KHz => clk_1KHz, button_clear => button_clear, button_stop => button_stop, hr_state => hr_state, one_mil => one_mil, ten_mil => ten_mil, hundred_mil => hundred_mil, one_sec => one_sec, count_done => count_done);

clock: process
begin
    clk_1KHz <= '0';
    wait for 500000ns;
    clk_1KHz <= '1';
    wait for 500000ns;
end process;

logic: process
begin
    button_clear <= '0';
    button_stop <= '0';
    hr_state <= "000";
    wait for 1ms;
    hr_state <= "010";
    wait until count_done <= '1';
    hr_state <= "100";
    wait for 5ms;
    button_clear <= '1';
    wait for 1000ns;
    button_clear <= '0';
    wait for 1ms;
    hr_state <= "010";
    wait for 345ms;
    button_stop <= '1';
    hr_state <= "100";
    wait for 1ms;
    button_stop <= '0';
    wait for 5ms;
    button_clear <= '1';
    wait for 1000ns;
    button_clear <= '0';
    wait for 1ms;
    hr_state <= "010";
    wait for 100ms;
    button_clear <= '1';
    hr_state <= "000";
    wait for 1000ns;
    button_clear <= '0';
    wait for 1ms;
    
end process;

end count_up_tb_arch;