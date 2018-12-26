----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.08.2018 14:24:37
-- Design Name: 
-- Module Name: fulladder - Behavioral
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

entity fulladder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           o : out STD_LOGIC;
           cout : out STD_LOGIC);
end fulladder;

architecture Structural of fulladder is

begin
process (a,b,cin)
begin
o<= a XOR b XOR cin;
cout<= (a AND b) OR (b AND cin) OR (a AND cin);
End process;

end Structural;