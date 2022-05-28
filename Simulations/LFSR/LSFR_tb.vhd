library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr_tb is
end lfsr_tb;

architecture lfsr_tb_arch of lfsr_tb is

component random_number_gen is
    port (
        rand:   out std_logic_vector(3 downto 0);
        clock:  in std_logic
    );
end component;

signal clock : std_logic := '0';
signal rand : std_logic_vector(3 downto 0);

begin

uut: random_number_gen port map (rand => rand, clock => clock);

process
begin
    clock <= '0';
    wait for 5ns;
    clock <= '1';
    wait for 5ns;
end process;

end lfsr_tb_arch;