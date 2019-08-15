library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;

entity chip is
	port (
      cpu_add    : in  std_logic_vector(7 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	     : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(7 downto 0));

end chip; 

architecture structural of chip is

	

	component comparator
		port (
			address : in std_logic_vector (7 downto 5);
			valid: in std_logic;
			tag	: in  std_logic_vector (2 downto 0);
			hit_miss: out std_logic
		);
	end component; 


	component mux_8
		port (
		 		M_D : in std_logic_vector(7 downto 0); 
                C_D : in std_logic_vector(7 downto 0);
                D_Type : in std_logic;
                R_D : out std_logic_vector(7 downto 0)
                );
    end component; 

	component reg 
		port(
			d: in std_logic_vector(7 downto 0);
			clk: in std_logic;
			q: out std_logic_vector(7 downto 0));
	end component;

	component two_to_four_decoder
		port(
			byte_offset: in std_logic_vector(1 downto 0);
			d : out std_logic_vector(3 downto 0));
	end component;

	component block_decoder
		port(
			block_offset: in std_logic_vector(2 downto 0);
			row: out std_logic_vector(7 downto 0));
	end component;

	component dff
		port(
			d   : in  std_logic;
        	clk : in  std_logic;
         	q   : out std_logic);
	end component;

	component state_machine
		port(
		clk: in std_logic;
		start : in std_logic;
		rd_wr : in std_logic;
		hit_miss : in std_logic;
		reset : in std_logic;
		cpu_address : in std_logic_vector(7 downto 0);
		RD_WR_en : out std_logic;
		mem_en : out std_logic;
		busy : out std_logic;
		mem_address : out std_logic_vector(7 downto 0);
		byte_offset: out std_logic_vector(1 downto 0);
		block_offset: out std_logic_vector(2 downto 0);
		data_type: out std_logic;
		tag: out std_logic_vector(2 downto 0);
		tag_valid_en: out std_logic;
		rd_output_en: out std_logic;
		start_inv: out std_logic
	);
	end component;

	component cache
		port(
			row_en:in std_logic_vector(7 downto 0);
			column_en:in std_logic_vector(3 downto 0);
			wr_data: in std_logic_vector(7 downto 0);
			wr_tag: in std_logic_vector(2 downto 0);
			rd_wr_en: in std_logic;
			reset: in std_logic;
			tag_valid_en: in std_logic;
			rd_data: out std_logic_vector(7 downto 0);
			rd_tag: out std_logic_vector(2 downto 0);
			rd_valid: out std_logic
		);
	end component;



	component output_enable
		port(
			cpu_data_in: in std_logic_vector(7 downto 0);
			en: in std_logic;
			cpu_data_out: out std_logic_vector(7 downto 0)
			);
	end component;

	component DLatch 
		port(
			d   : in  std_logic;
     	    clk : in  std_logic;
        	 q   : out std_logic);
	end component;

	component buf
		port(
			input: in std_logic;
			output: out std_logic);
	end component;


for sm: state_machine use entity work.state_machine(structural);
for all: reg use entity work.reg(structural);
for c: cache use entity work.cache(structural);
for compare: comparator use entity work.comparator(structural);
for o1,o2: output_enable use entity work.output_enable(structural);
for two_to_four: two_to_four_decoder use entity work.two_to_four_decoder(structural);
for three_to_eight: block_decoder use entity work.block_decoder(structural);
for mux: mux_8 use entity work.mux_8(structural);
for all: dff use entity work.dff(structural); 
for all: DLatch use entity work.DLatch(structural);
for all: buf use entity work.buf(structural);

signal RD_WR_en,data_type,tag_valid_en,rd_output_en,rd_valid,start_inv,hit_miss: std_logic;
signal rd_wr,hit_miss_reg: std_logic;
signal row_en,mux_data,rd_data,cpu_address,cpu_data_reg: std_logic_vector(7 downto 0);
signal byte_offset: std_logic_vector(1 downto 0);
signal block_offset,tag,rd_tag: std_logic_vector(2 downto 0);
signal column_en: std_logic_vector(3 downto 0);
signal SM_mem_add: std_logic_vector(7 downto 0);
signal SM_mem_en: std_logic;

begin


sm: state_machine port map(clk,start,rd_wr,hit_miss_reg,reset,cpu_address,RD_WR_en,SM_mem_en,busy,SM_mem_add,byte_offset,block_offset,data_type,tag,tag_valid_en,rd_output_en,start_inv);
latch: DLatch port map(hit_miss,start,hit_miss_reg);
two_to_four: two_to_four_decoder port map(byte_offset,column_en);
three_to_eight: block_decoder port map(block_offset,row_en);
mux: mux_8 port map(mem_data,cpu_data_reg,data_type,mux_data);
c: cache port map(row_en,column_en,mux_data,tag,RD_WR_en,reset,tag_valid_en,rd_data,rd_tag,rd_valid);
reg1: reg port map(cpu_add,start_inv,cpu_address);	
compare: comparator port map(cpu_address(7 downto 5),rd_valid,rd_tag,hit_miss);
reg2: reg port map(cpu_data,start_inv,cpu_data_reg);
d: dff port map(cpu_rd_wrn,start_inv,rd_wr);
o2: output_enable port map(SM_mem_add,SM_mem_en,mem_add);
o1: output_enable port map(rd_data,rd_output_en,cpu_data);
buf1: buf port map(SM_mem_en,mem_en);








end structural;
