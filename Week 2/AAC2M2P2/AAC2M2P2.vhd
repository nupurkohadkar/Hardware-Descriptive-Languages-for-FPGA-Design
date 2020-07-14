LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture syn_ram of RAM128_32 is 

	type ram_type is array (127 downto 0) of std_logic_vector(31 downto 0);
	signal RAM : ram_type;
	signal read_a : std_logic_vector(6 downto 0);
	
	begin
		process(clock)
		begin
			if rising_edge(clock) then   
				if (wren = '1') then   
				RAM(to_integer(unsigned(address))) <= data;   
				end if;   
			read_a <= address;   
			end if;   
		end process;   
	q <= RAM(to_integer(unsigned(read_a)));   
	end syn_ram;