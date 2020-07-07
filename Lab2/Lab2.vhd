
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADSU4_HXILINX_p2 is
  port(
    CO  : out std_logic;
    OFL : out std_logic;
    S0  : out std_logic;
    S1  : out std_logic;
    S2  : out std_logic;
    S3  : out std_logic;
    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    ADD : in std_logic;
    B0  : in std_logic;
    B1  : in std_logic;
    B2  : in std_logic;
    B3  : in std_logic;
    CI  : in std_logic
  );
end ADSU4_HXILINX_p2;

architecture ADSU4_HXILINX_p2_V of ADSU4_HXILINX_p2 is

begin
  adsu_p : process (A0, A1, A2, A3, ADD, B0, B1, B2, B3, CI)
    variable adsu_tmp : std_logic_vector(4 downto 0);
    variable a_tmp    : std_logic_vector(3 downto 0);
    variable b_tmp    : std_logic_vector(3 downto 0);
  begin
    a_tmp := A3 & A2 & A1 & A0;
    b_tmp := B3 & B2 & B1 & B0;
    if (ADD = '1') then
      adsu_tmp := conv_std_logic_vector((conv_integer(a_tmp) + conv_integer(b_tmp) + conv_integer(CI)),5);
    else
      adsu_tmp := conv_std_logic_vector((conv_integer(a_tmp) - conv_integer(not CI) - conv_integer(b_tmp)),5);
    end if;
      
   S3 <= adsu_tmp(3);
   S2 <= adsu_tmp(2);
   S1 <= adsu_tmp(1);
   S0 <= adsu_tmp(0);
   
   if (ADD='1') then
     CO <= adsu_tmp(4);
     OFL <= ( A3 and B3 and (not adsu_tmp(3)) ) or ( (not A3) and (not B3) and adsu_tmp(3) ); 
   else
     CO <= not adsu_tmp(4);
     OFL <= ( A3 and (not B3) and (not adsu_tmp(3)) ) or ( (not A3) and B3 and adsu_tmp(3) ); 
   end if;
 
  end process;
  
end ADSU4_HXILINX_p2_V;
----- CELL FD4CE_HXILINX_p2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD4CE_HXILINX_p2 is
port (
    Q0  : out STD_LOGIC := '0';
    Q1  : out STD_LOGIC := '0';
    Q2  : out STD_LOGIC := '0';
    Q3  : out STD_LOGIC := '0';

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D0  : in STD_LOGIC;
    D1  : in STD_LOGIC;
    D2  : in STD_LOGIC;
    D3  : in STD_LOGIC
    );
end FD4CE_HXILINX_p2;

architecture Behavioral of FD4CE_HXILINX_p2 is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q3 <= '0';
    Q2 <= '0';
    Q1 <= '0';
    Q0 <= '0';
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q3 <= D3;
      Q2 <= D2;
      Q1 <= D1;
      Q0 <= D0;
    end if;
  end if;
end process;


end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity p2 is
   port ( clk        : in    std_logic; 
          clr        : in    std_logic; 
          enable     : in    std_logic; 
          Ent        : in    std_logic; 
          in_sensor  : in    std_logic; 
          out_sensor : in    std_logic; 
          t          : in    std_logic; 
          door_in    : out   std_logic; 
          door_out   : out   std_logic);
end p2;

architecture BEHAVIORAL of p2 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_14        : std_logic;
   signal XLXN_23        : std_logic;
   signal XLXN_47        : std_logic;
   signal XLXN_65        : std_logic;
   signal XLXN_93        : std_logic;
   signal XLXN_94        : std_logic;
   signal XLXN_95        : std_logic;
   signal XLXN_96        : std_logic;
   signal XLXN_98        : std_logic;
   signal XLXN_99        : std_logic;
   signal XLXN_100       : std_logic;
   signal XLXN_101       : std_logic;
   signal XLXN_102       : std_logic;
   signal XLXN_104       : std_logic;
   signal XLXN_106       : std_logic;
   signal XLXN_109       : std_logic;
   signal XLXN_122       : std_logic;
   signal XLXN_127       : std_logic;
   signal door_out_DUMMY : std_logic;
   signal door_in_DUMMY  : std_logic;
   component FD4CE_HXILINX_p2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D0  : in    std_logic; 
             D1  : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic);
   end component;
   
   component ADSU4_HXILINX_p2
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             ADD : in    std_logic; 
             B0  : in    std_logic; 
             B1  : in    std_logic; 
             B2  : in    std_logic; 
             B3  : in    std_logic; 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S0  : out   std_logic; 
             S1  : out   std_logic; 
             S2  : out   std_logic; 
             S3  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component NAND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND4 : component is "BLACK_BOX";
   
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_8 : label is "XLXI_8_0";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_1";
begin
   door_in <= door_in_DUMMY;
   door_out <= door_out_DUMMY;
   XLXI_8 : FD4CE_HXILINX_p2
      port map (C=>clk,
                CE=>XLXN_47,
                CLR=>clr,
                D0=>XLXN_99,
                D1=>XLXN_100,
                D2=>XLXN_101,
                D3=>XLXN_102,
                Q0=>XLXN_93,
                Q1=>XLXN_94,
                Q2=>XLXN_95,
                Q3=>XLXN_96);
   
   XLXI_10 : ADSU4_HXILINX_p2
      port map (ADD=>XLXN_104,
                A0=>XLXN_93,
                A1=>XLXN_94,
                A2=>XLXN_95,
                A3=>XLXN_96,
                B0=>XLXN_109,
                B1=>XLXN_14,
                B2=>XLXN_14,
                B3=>XLXN_14,
                CI=>XLXN_106,
                CO=>open,
                OFL=>open,
                S0=>XLXN_99,
                S1=>XLXN_100,
                S2=>XLXN_101,
                S3=>XLXN_102);
   
   XLXI_11 : GND
      port map (G=>XLXN_14);
   
   XLXI_15 : AND2
      port map (I0=>enable,
                I1=>XLXN_23,
                O=>XLXN_47);
   
   XLXI_25 : AND2B1
      port map (I0=>XLXN_127,
                I1=>XLXN_122,
                O=>XLXN_104);
   
   XLXI_27 : FD
      port map (C=>clk,
                D=>Ent,
                Q=>XLXN_65);
   
   XLXI_31 : AND3
      port map (I0=>t,
                I1=>XLXN_65,
                I2=>XLXN_98,
                O=>door_in_DUMMY);
   
   XLXI_42 : OR4
      port map (I0=>XLXN_96,
                I1=>XLXN_95,
                I2=>XLXN_94,
                I3=>XLXN_93,
                O=>door_out_DUMMY);
   
   XLXI_43 : NAND4
      port map (I0=>XLXN_96,
                I1=>XLXN_95,
                I2=>XLXN_94,
                I3=>XLXN_93,
                O=>XLXN_98);
   
   XLXI_44 : NAND2
      port map (I0=>XLXN_104,
                I1=>XLXN_104,
                O=>XLXN_106);
   
   XLXI_45 : OR2
      port map (I0=>XLXN_127,
                I1=>XLXN_122,
                O=>XLXN_109);
   
   XLXI_46 : XOR2
      port map (I0=>XLXN_127,
                I1=>XLXN_122,
                O=>XLXN_23);
   
   XLXI_47 : AND2
      port map (I0=>out_sensor,
                I1=>door_out_DUMMY,
                O=>XLXN_127);
   
   XLXI_48 : AND2
      port map (I0=>door_in_DUMMY,
                I1=>in_sensor,
                O=>XLXN_122);
   
end BEHAVIORAL;


