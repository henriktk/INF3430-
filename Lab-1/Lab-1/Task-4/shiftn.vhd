library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift32 is
	generic
    (
		n 		:	positive
    ); 
	port
	(
		CLK		:	in std_logic;
		Input	:	std_logic_vector(n-1 downto 0);
		Output	:	std_logic_vector(n-1 downto 0)
	);
	
architecture shift of shift32 is

	component dff
		port
		(
			CLK, D	:	in std_logic;
			Q		:	out std_logic
		);
	end component;

begin
	GEN:
	for i in 0 to n-1 generate
		DFFX : dff port map (CLK, Input(i), output(i));
	end generate GEN;
end GEN;
		