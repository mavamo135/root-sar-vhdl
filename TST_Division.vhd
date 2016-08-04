library	IEEE;
use IEEE.std_logic_1164.all;

entity TST_Division is
end TST_Division;

architecture Prueba of TST_Division is

signal RST, CLK : std_logic;
signal STA, EOA : std_logic;
signal R     	: std_logic_vector(29 downto 0);
signal X        : std_logic_vector(59 downto 0);

component Raiz
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	STA : in  std_logic;
	X   : in  std_logic_vector(59 downto 0);
	EOA : out std_logic;
	R   : out std_logic_vector(29 downto 0)
	);
end component;

begin
	
	-- Dispositivo bajo prueba
	DUT : Raiz port map(RST,CLK,STA,X,EOA,R);
	
	-- Inicializacion
	Reset: process
	begin
		RST <= '1';
		wait for 100 ns;
		RST <= '0';
		wait;
	end process Reset;
	
	-- Reloj maestro de 50 MHz
	Reloj: process
	begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
	end process Reloj;
	
	-- Entrada e inicio de aproximacion
	-- Para realizar otro calculo, modifique los valores de X y Y
	-- Formato de la entrada X en 36 bits enteros positivos
	-- Formato de la entrada Y en 18 bits enteros positivos
	-- Formato de la salida  R en 18 bits enteros positivos
	--
	-- Nota: en la division puede ocurrir desbordamiento
	
	Entrada: process
	begin
		X   <= "001010000000000000000000000000000000000000000000000000000000";	-- formato 3.57
		STA <= '0';
		wait for 200 ns;
		STA <= '1';
		wait for 100 ns;
		STA <= '0';
		wait;
	end process Entrada;
	
end Prueba;