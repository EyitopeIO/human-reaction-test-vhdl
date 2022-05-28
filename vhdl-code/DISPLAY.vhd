

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity display is
    Port (clk_8KHz : in std_logic;  --Our 8KHz clock signal from the clock divider -Archie [1st commit].
          one_mil : in integer; --Our 1 millisecond value (increased every 1 millisecond in count state) - Archie [1st commit].
          ten_mil : in integer; --Our 10 millisecond value (increases every 10 milliseconds in count state) - Archie [1st commit].
          hundred_mil : in integer; --Our 100 millisecond value (increases every 100 milliseconds in count state) - Archie [1st commit].
          one_sec : in integer; --Our 1000 millisecond value (increases every 1000 milliseconds in count state) - Archie [1st commit].
          hr_state : in std_logic_vector(2 downto 0);   --Tells us what the current state of our hr_test is in - Archie [1st commit].
          anode : out std_logic_vector(7 downto 0); --Choses which seven segment display we are writing to - Archie [1st commit].
          cathode : out std_logic_vector(7 downto 0) --Choses what value will be written on the seven segment display - Archie [1st commit].
          );
end display;

architecture display_behav of display is

begin
process(clk_8KHz)    --For seven segment displays during count and hold state [1st commit].
variable seg_sel: unsigned(1 downto 0) := "00";
begin
    if rising_edge(clk_8KHz) then
        if hr_state = "000" then --Display during the initial state.
                case (seg_sel) is
                    when "00"  => --Displays nothing in first segment - Archie [NEW].
                        anode <= "11110111";
                        cathode <= "11111111";
                    when "01" =>    --Displays a 'H' in the second segment - Archie [NEW]
                        anode <= "11111011";
                        cathode <= "10010001";
                    when "10" =>    --Displays an 'I' on the third segment - Archie [NEW].
                        anode <= "11111101";
                        cathode <= "11110011";
                    when "11" =>    --Displays nothing on the fourth segment - Archie [NEW].
                        anode <= "11111110";
                        cathode <= "11111111";
                    when others =>  --This should never happen [NEW].
                        anode <= "11110000";
                        cathode <= "11111110";
                end case;
                seg_sel := seg_sel + 1;
        elsif hr_state = "001" then --Display during the random wait state.
                anode <= "11110000"; --Selects all seven segment displays - Archie [1st commit].
                cathode <= "11111111"; --Turns all seven segments LEDs off - Archie [1st commit].
        elsif ((hr_state = "010") or (hr_state = "100")) then --state is count or hold -Archie [1st commit].
            case (seg_sel) is
                when "00" =>
                    anode <= "11110111"; --Display seconds - Archie [1st commit].
                    case (one_sec) is
                        when 0 =>
                            cathode <= "00000011";
                        when 1 =>
                            cathode <= "10011111"; --Should never display a value above 1 in left most seven segment display during count or hold - Archie [1st commit].
                        when others =>
                            cathode <= "11111110";  --Seven segment display will output only the decimal point if it gets a value here it shouldn't - Archie [1st commit].
                        end case;
                when "01" =>
                    anode <= "11111011"; --Display 100s of milliseconds - Archie [1st commit].
                    case (hundred_mil) is
                        when 0 =>
                            cathode <= "00000011";  --Seven segment display will output 0 - Archie [1st commit].
                        when 1 =>
                            cathode <= "10011111"; --Seven segment display will output 1 - Archie [1st commit].
                        when 2 =>
                            cathode <= "00100101"; --Seven segment display will output 2 - Archie [1st commit].
                        when 3 =>
                            cathode <= "00001101"; --Seven segment display will output 3 - Archie [1st commit].
                        when 4 =>
                            cathode <= "10011001"; --Seven segment display will output 4 - Archie [1st commit].
                        when 5 =>
                            cathode <= "01001001"; --Seven segment display will output 5 - Archie [1st commit].
                        when 6 =>
                            cathode <= "11000001";  --Seven segment display will output 6 - Archie [1st commit].
                        when 7 =>
                             cathode <= "00011111";  --Seven segment display will output 7 - Archie [1st commit].
                        when 8 =>
                             cathode <= "00000001";  --Seven segment display will output 8 - Archie [1st commit].
                        when 9 =>
                             cathode <= "00011001";  --Seven segment display will output 9 - Archie [1st commit].
                        when others =>
                              cathode <= "11111110";  
                        end case;
                when "10" =>
                    anode <= "11111101"; --Display 10s of milliseconds - Archie [1st commit].
                        case (ten_mil) is
                            when 0 =>
                                cathode <= "00000011";
                            when 1 =>
                                cathode <= "10011111";
                            when 2 =>
                                cathode <= "00100101";
                            when 3 =>
                                cathode <= "00001101";
                            when 4 =>
                                 cathode <= "10011001";
                            when 5 =>
                                 cathode <= "01001001";
                            when 6 =>
                                  cathode <= "11000001";
                            when 7 =>
                                  cathode <= "00011111";
                            when 8 =>
                                  cathode <= "00000001";
                            when 9 =>
                                  cathode <= "00011001";
                            when others =>
                                   cathode <= "11111110";
                            end case;
                when "11" =>
                    anode <= "11111110"; --Display 1s of milliseconds - Archie [1st commit].
                    case (one_mil) is
                        when 0 =>
                            cathode <= "00000011";
                        when 1 =>
                             cathode <= "10011111";
                        when 2 =>
                             cathode <= "00100101";
                        when 3 =>
                              cathode <= "00001101";
                        when 4 =>
                              cathode <= "10011001";
                        when 5 =>
                              cathode <= "01001001";
                        when 6 =>
                              cathode <= "11000001";
                        when 7 =>
                              cathode <= "00011111";
                        when 8 =>
                              cathode <= "00000001";
                        when 9 =>
                              cathode <= "00011001";
                        when others =>
                              cathode <= "11111110";
                         end case;             
                when others =>
                    anode <= "11110000";
                    cathode <= "11111110";
            end case;
            seg_sel := seg_sel + 1; --seg_sel interates to select the next seven segment display - Archie [1st commit]  
        elsif hr_state = "011" then --Display during the error state.
                    anode <=  "11110000"; --Selects all seven segment displays - Archie [1st commit].
                    cathode <= "00011001"; --Sets seven segment display to 9 - Archie [1st commit].
       end if;
    end if;
    
end process;
end display_behav;