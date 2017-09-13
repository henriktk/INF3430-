
library ieee;
use ieee.std_logic_1164.all;

entity tb_delay_mod is
  -- empty;
end tb_delay_mod;

architecture beh1_mod of tb_delay_mod is

  component delay_mod
    port (
      rst_n   : in  std_logic;
      mclk    : in  std_logic;
      indata  : in  std_logic_vector(7 downto 0);
      outdata : out std_logic_vector(7 downto 0));
  end component;
  
  signal rst_n   : std_logic;
  signal mclk    : std_logic;
  signal indata  : std_logic_vector(7 downto 0);
  signal outdata : std_logic_vector(7 downto 0);
  
begin

  UUT: entity work.delay_mod(rtl1_mod)
    port map (
      rst_n   => rst_n,
      mclk    => mclk,
      indata  => indata,
      outdata => outdata);
  
  P_CLK_0: process
  begin
    mclk <= '0';
    wait for 50 ns;
    mclk <= '1';
    wait for 50 ns;    
  end process P_CLK_0;

  rst_n  <= '1', '0' after 100 ns, '1' after 200 ns;
  indata <= "00000000", "11110000" after 200 ns, "00001111" after 400 ns;

end beh1_mod;
