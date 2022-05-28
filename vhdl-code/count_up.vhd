library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity count_up is
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
end count_up;

architecture Behavioral of count_up is

begin

MILLISECONDS_COUNT:process (clk_1Khz, button_clear, button_stop, hr_state) -- count state depends on this clock
variable one_millisecond : integer := 0;
variable ten_millisecond : integer := 0;
variable hundred_millisecond : integer := 0;
variable thousand_millisecond : integer := 0;
    begin
        if (button_clear='1') then  --User reseting it overides the counting. - Archie [NEW].
            one_millisecond := 0;
            ten_millisecond := 0;
            hundred_millisecond := 0;
            thousand_millisecond := 0;
            one_mil <= 0;
            ten_mil <= 0;
            hundred_mil <= 0;
            one_sec <= 0;
            count_done <= '0';
        elsif rising_edge(clk_1KHz) then
            if (hr_state= "010") then
                if (button_stop='1') then   --The stop button ends the counting before it does anymore counting. - Archie [NEW]
                    count_done <= '1';   --State hold is next state when user presses stop button. - Archie [NEW]
                else                    --If button not pressed then we continue to count. - Archie [NEW]
                    one_millisecond := one_millisecond + 1; --Increase the milliseconds. - Archie [NEW]
                    if one_millisecond = 9 then    --When the milliseconds overflows into the 10's of milliseconds we increment the 10's and reset the milliseconds. - Archie [NEW]
                        ten_millisecond := ten_millisecond + 1;
                        one_millisecond := 0;
                        if ten_millisecond = 9 then    --When the 10's overflows we increase the hundreds and reset the tens. - Archie [NEW]
                            hundred_millisecond := hundred_millisecond + 1;
                            ten_millisecond := 0;
                            if hundred_millisecond = 9 then --When the hundreds overflow we increase the 1000 and reset the hundred. - Archie [NEW]
                                thousand_millisecond := thousand_millisecond + 1;
                                hundred_millisecond := 0;
                                count_done <= '1';   --When we reach 1000 milliseconds without the stop button being pressed we go to the hold state. Archie [NEW]
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
        one_mil <= one_millisecond;
        ten_mil <= ten_millisecond;
        hundred_mil <= hundred_millisecond;
        one_sec <= thousand_millisecond;
    end process;

end Behavioral;
