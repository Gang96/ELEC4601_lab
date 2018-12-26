----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2018 13:10:45
-- Design Name: 
-- Module Name: bit8adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit8adder is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           o : out STD_LOGIC_VECTOR (7 downto 0));
end bit8adder;

architecture Structural of bit8adder is
component fulladder is -- Defined in FullAdder.vhd
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           o : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;
 signal c: std_logic_vector(7 downto 0);
 signal c_out : STD_LOGIC;

begin
c(0) <= '0';    
C1: fulladder port map( a => a(0), b => b(0), cin => c(0), o => o(0), cout => c(1) );
C2: fulladder port map( a => a(1), b => b(1), cin => c(1), o => o(1), cout => c(2) );
C3: fulladder port map( a => a(2), b => b(2), cin => c(2), o => o(2), cout => c(3) );
C4: fulladder port map( a => a(3), b => b(3), cin => c(3), o => o(3), cout => c(4) );
C5: fulladder port map( a => a(4), b => b(4), cin => c(4), o => o(4), cout => c(5) );
C6: fulladder port map( a => a(5), b => b(5), cin => c(5), o => o(5), cout => c(6) );
C7: fulladder port map( a => a(6), b => b(6), cin => c(6), o => o(6), cout => c(7) );
C8: fulladder port map( a => a(7), b => b(7), cin => c(7), o => o(7), cout => c_out );
end Structural;