library ieee;
use ieee.std_logic_1164.all;

entity variables_vs_signals is 
  port (
    indata   : in  std_logic;
    outdata  : out std_logic_vector(3 downto 0)
  );  
end variables_vs_signals;

architecture rtl1 of variables_vs_signals is
  signal sig1, sig2 : std_logic;
begin
  
jorgen:  process (indata, sig1, sig2) is    
    variable var1, var2 : std_logic;
  begin
    sig1<= indata;
    sig2<= indata;
    outdata(1 downto 0)<= sig2 & sig1;
    sig1<= indata;
    sig2<= not indata;
    outdata(3 downto 2)<= sig2 & sig1;
  end process;
    
end rtl1;
