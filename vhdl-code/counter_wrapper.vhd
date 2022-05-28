--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
--Date        : Thu Mar 31 10:09:54 2022
--Host        : Nihinlola running 64-bit major release  (build 9200)
--Command     : generate_target counter_wrapper.bd
--Design      : counter_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity counter_wrapper is
    port (
        CLK:    in STD_LOGIC;
        Q:      out STD_LOGIC_VECTOR ( 3 downto 0 );
        SCLR:   in STD_LOGIC
    );
end counter_wrapper;


architecture STRUCTURE of counter_wrapper is

    component counter is
        port (
            Q:      out STD_LOGIC_VECTOR ( 3 downto 0 );
            SCLR:   in STD_LOGIC;
            CLK:    in STD_LOGIC
        );
    end component counter;
begin
    
counter_i: component counter port map (CLK => CLK, Q(3 downto 0) => Q(3 downto 0), SCLR => SCLR);

end STRUCTURE;
