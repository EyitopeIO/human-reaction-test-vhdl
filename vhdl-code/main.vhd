-- 29-MAR-2022

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity HR_Test is 
    port (
        
        button_clear: in std_logic;
        button_stop: in std_logic;
        button_start: in std_logic;
        clock_100MHz: in std_logic;

        seven_seg_anode: out std_logic_vector(7 downto 0);
        seven_seg_cathode: out std_logic_vector(7 downto 0);
    
        led:        out std_logic_vector(2 downto 0)
 --       led_debug:  out std_logic
        
    );
end HR_Test;


architecture hr_test_behaviour of HR_Test is

    component capture_compare is
        Port (
            clock_1Hz:      in std_logic;
            random_number:  in std_logic_vector(3 downto 0);
            control:        in std_logic;
            count_reached:  out std_logic
        );
    end component;

    component random_number_gen is
        port (
            rand:   out std_logic_vector(3 downto 0);
            clock:  in std_logic
        );
    end component;

    component clock_divider is
        port (
            clock_100MHz: in std_logic;
            clock_1000Hz: out std_logic;
            clock_1Hz:    out std_logic;
            clock_8000Hz: out std_logic
        );
    end component;
 
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
 
 
    type state_type is (init, rand_wait, count, err, hold);
    signal hr_state : state_type := init;
    signal hr_state_parse: std_logic_vector(2 downto 0); -- Pass state of hr into display module (Archie paraphrased)

    signal clock_1Hz_line:      std_logic;
    signal clock_1kHz_line:     std_logic;
    signal clock_8kHz_line:     std_logic;
    signal clock_100MHz_line:   std_logic;

    signal bus_random_number:   std_logic_vector(3 downto 0);

    signal control_store_or_load:   std_logic;      -- Drive this signal in the appropriate state
    signal control_count_reached:   std_logic;      -- Use this signal to change state  
    
    signal reaction_time:   std_logic_vector(11 downto 0);  -- Read this variable to get reaction time in milliseconds.

    signal one_mil_bus, ten_mil_bus, hundred_mil_bus, one_sec_bus: integer; --These be replaced by the output of the counter for count up state made by Eyitope - Archie.
    signal count_done_bus : std_logic;
begin

    clock_100MHz_line <= clock_100MHz;
    
SIGCOUNT: capture_compare port map(clock_1Hz=>clock_1Hz_line, random_number=>bus_random_number, control=>control_store_or_load, count_reached=>control_count_reached);
RANDGENN: random_number_gen port map(rand=>bus_random_number, clock=>clock_100MHz_line);
CLOCKDIV: clock_divider port map(clock_100MHz=>clock_100MHz_line, clock_1000Hz=>clock_1kHz_line, clock_1Hz=>clock_1Hz_line, clock_8000Hz=>clock_8kHz_line);
SEVENSEG: display port map (clk_8KHz=>clock_8kHz_line, one_mil=>one_mil_bus, ten_mil=>ten_mil_bus, hundred_mil=>hundred_mil_bus, one_sec=>one_sec_bus, hr_state=>hr_state_parse, anode=>seven_seg_anode, cathode=>seven_seg_cathode);
MILSECONDCOUNT: count_up port map (clk_1KHz => clock_1kHz_line, button_clear => button_clear, button_stop => button_stop, hr_state => hr_state_parse, one_mil => one_mil_bus, ten_mil => ten_mil_bus, hundred_mil => hundred_mil_bus, one_sec => one_sec_bus, count_done => count_done_bus);

--    process (control_count_reached)
--    begin
--        if rising_edge(control_count_reached) then
--            led_debug <= '1';
 --       end if;     
 --       if falling_edge(control_count_reached) then
 --           led_debug <= '0';
 --       end if;              
 --   end process;
        

--MILLISECONDS_COUNT:    process (clock_1kHz_line)                       -- count state depends on this clock
--    variable counter:       unsigned (11 downto 0):= "000000000000";  -- 12 bit number to count up to 1000.
--    variable one_mil:       integer:= 0;
--    variable ten_mil:       integer:= 0;
--    variable hundred_mil:   integer:= 0;
--    variable one_sec:       integer:= 0;
----    variable one_next_constant:      integer := 0;
----    variable ten_next_constant:      integer := 0;
----    variable hundred_next_constant:  integer := 0;
--   begin
--        if (button_clear='1') then
--            one_mil := 0;
--            ten_mil := 0;
--            hundred_mil := 0;
--            one_sec := 0;
--        end if;
--            
--        if rising_edge(clock_1kHz_line) then
--            if (hr_state=count) then
--            --led <= "111";
--                if (counter="001111101000") then    -- 1000 in DEC
--                    counter := "000000000000";
--                    one_sec := 1;
--                else
--                    one_mil := one_mil + 1;
--                    counter := counter + 1;                   
--                    if (one_mil=9) then
--                        ten_mil := ten_mil + 1;
--                        one_mil := 0;
--                       if (ten_mil=9) then
--                            hundred_mil := hundred_mil + 1;
--                           if (hundred_mil=9) then
--                                hundred_mil := hundred_mil + 1;
--                            end if;
--                        end if;
--                    end if;             
--                end if;
--            else
--                counter := "000000000000";  -- Keep it at zero when not in count state
--           end if;
--            reaction_time <= std_logic_vector(counter);     -- Always zero except in count state 
--            one_mil_bus<=one_mil;
--            ten_mil_bus<=ten_mil;
--            one_sec_bus<=one_sec;
--            hundred_mil_bus<=hundred_mil;
--            
--        end if;
--    end process;
    

STATE_HANDLER:    process (clock_100MHz_line, button_clear, button_stop, button_start)
    begin
        if (button_clear='1') then
            hr_state <= init;
            led <= "000";      
        elsif rising_edge(clock_100MHz_line) then
            case hr_state is
                when init =>
                    control_store_or_load <= '1';
                    hr_state_parse <= "000";
                    if (button_start='1') then
                        hr_state<=rand_wait;
                        --control_store_or_load <= '0';   -- Put random number in compare register of count_compare
                    end if;
                    -- TODO: Display "Hi" message here?
                when rand_wait =>
                    hr_state_parse <= "001";
                    control_store_or_load <= '0';   
                    if (button_stop='1') then
                        hr_state <= err;
                    elsif (button_clear='1') then
                        hr_state <= init;
                    elsif (control_count_reached='1') then
                        hr_state <= count;
                    end if;
                when count =>
                -- count-up circuitry is activated by 1kHz clock.
                -- See circuitry at MILLISECONDS_COUNT label
                    led <= "111";
                    hr_state_parse <= "010";
                    control_store_or_load <= '1';
                    if (button_stop='1') then
                        hr_state<=hold;
                    elsif (button_clear='1') then
                        hr_state<=init;
                    --elsif (reaction_time="001111101000") then    -- 1000 in binary
                    elsif (count_done_bus = '1') then
                        hr_state<=hold; 
                    end if;
                    -- TODO: Turn on LEDs here?
                when err =>
                    hr_state_parse <= "011";
                    control_store_or_load <= '1';
                    if (button_clear='1') then
                        hr_state<=init;
                    end if;
                when hold =>
                    hr_state_parse <= "100";
                    led <= "000";
                    control_store_or_load <= '1';
                    if (button_clear='1') then
                        hr_state<=init;
                    end if;
                when others =>
                    hr_state <= init;
                    control_store_or_load <= '1';
            end case;
        end if;
    end process;
    
--STATE_INIT:     process(hr_state)   -- Initialise a state here.
--    begin
--        case hr_state is
--            when init =>
--            when rand_wait =>
--            when count =>
--            when err =>
--            when hold =>
--            when others =>
--        end case;
--    end process;
end hr_test_behaviour;