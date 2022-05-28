----------------------------------------------------------------------------------
-- For:           Coventry University 
-- Contributors:  Eyitope Adelowo, <add_name>, ...
-- 
-- Create Date: 31.03.2022 01:56:15
-- Module Name: capture_compare - cc_architecture
-- Target Devices: xc7a100tcsg324-1

-- Description: Trigger the output high when the content of the counter is greater than or equals the latch. 
 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity capture_compare is
    Port (
        clock_1Hz:      in std_logic;
        random_number:  in std_logic_vector(3 downto 0);
        control:        in std_logic;
        count_reached:  out std_logic
    );
end capture_compare;



architecture cc_architecture of capture_compare is

    component four_bit_latch is
        port (
            D:  in std_logic_vector(3 downto 0);
            E:  in std_logic;
            Q:  out std_logic_vector(3 downto 0)
        );
    end component;

    component comparator is
        port (
            a:      in std_logic_vector(3 downto 0);
            b:      in std_logic_vector(3 downto 0);
            gtoe:   out std_logic;
            clock:  in std_logic;
            pause:  in std_logic
        );
    end component;
    
    component counter_wrapper is
        port (
            CLK : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
            SCLR : in STD_LOGIC
        );
    end component;
    
    signal latch_to_comparator_input_b:     std_logic_vector(3 downto 0);
    signal count_to_comparator_input_a:     std_logic_vector(3 downto 0); 
begin

-- When control is 1
--  counter will have its SCLR high so it resets.
--  compare register will have its E high so random number is loaded.
--  comparator will have its pause high so gtoe is forced to remain 0.
-- When contol is 0
--  counter will have SCLR low so it begins counting up.
--  compare register will have its E low so its Q maintains last D value.
--  comparator will have its pause high so gtoe will be 1 when its A > B
    
    
CCOMPARE: four_bit_latch port map(D=>random_number, E=>control, Q=>latch_to_comparator_input_b);
CCOUNTER: counter_wrapper port map(CLK=>clock_1Hz, Q=>count_to_comparator_input_a, SCLR=>control);
COMPARAT: comparator port map(a=>count_to_comparator_input_a, b=>latch_to_comparator_input_b, gtoe=>count_reached, clock=>clock_1Hz, pause=>control); 
           
end cc_architecture;
