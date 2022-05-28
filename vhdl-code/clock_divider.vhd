----------------------------------------------------------------------------------
-- For:     Coventry University 
-- Author:  Eyitope Adelowo 
-- 
-- Create Date: 31.03.2022 21:42:01
-- Module Name: clock_divider - clock_architecture
-- Target Devices: xc7a100tcsg324-1 
-- Description: divide 100MHz clock into 8kHz, 1kHz, and 1Hz

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    port (
        clock_100MHz: in std_logic;
        clock_1000Hz: out std_logic;
        clock_1Hz:    out std_logic;
        clock_8000Hz: out std_logic
    );
end clock_divider;


architecture clock_architecture of clock_divider is
    signal line_1kHz:   std_logic := '0';
    signal line_8kHz:   std_logic := '0';
    signal line_1Hz:    std_logic := '0';
    --signal line_1MHz:   std_logic := '0';
begin
    
    --line_1MHz <= clock_100MHz;
    clock_1000Hz <= line_1kHz;
    clock_8000Hz <= line_8kHz;
    clock_1Hz    <= line_1Hz;
    
FREQ_1kHz:    process(clock_100MHz, line_1kHz)
    variable count_100000:      unsigned (15 downto 0)  := "1100001101010000";  -- 1kHz clock : I have updated this to be a value of 50,000 rather than 100,000 - Archie [NEW].
    variable counter_100000:    unsigned (15 downto 0)  := "0000000000000000";  -- 20 bit counter           
    begin
        if (rising_edge(clock_100MHz)) then
            if (counter_100000 = count_100000) then
                line_1kHz <= not line_1kHz;
                counter_100000 := "0000000000000000";
            end if;
            counter_100000 := counter_100000 + 1;
        end if;
    end process;
    
FREQ_8kHz:    process(clock_100MHz, line_8kHz)
        variable count_12500:   unsigned (12 downto 0)  := "1100001101010";      -- 8kHz clock  : I have updated this to be a vlue of 6250 rather then 12500 - Archie [NEW].
        variable counter_12500:       unsigned (12 downto 0)  := "0000000000000";      -- 8kHz clock
    begin
        if (rising_edge(clock_100MHz)) then
            if (counter_12500 = count_12500) then
                line_8kHz <= not line_8kHz;
                counter_12500 := "0000000000000";
            end if;
            counter_12500 := counter_12500 + 1;
        end if;
    end process;
    
FREQ_1Hz:       process(clock_100MHz, line_1Hz)
        variable count_100000000:   unsigned (25 downto 0)  := "10111110101111000010000000";  -- 1Hz clock : I have updated this to be a value of 50,000,000 rahter then 100,000,000 - Archie [NEW].
        variable counter_100000000: unsigned (25 downto 0)  := "00000000000000000000000000";        
    begin
        if (rising_edge(clock_100MHz)) then
            if (counter_100000000 = count_100000000) then            
                line_1Hz <= not line_1Hz;
                counter_100000000 := "00000000000000000000000000";
            end if;
            counter_100000000 := counter_100000000 + 1;
        end if;
    end process;
        
end clock_architecture;
