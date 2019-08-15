library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine is 
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
	
end state_machine;

architecture structural of state_machine is 
	component counter
		port(
		t : in std_logic;
    	clk : in std_logic;
    	rst : in std_logic;
    	q : out std_logic_vector(4 downto 0));
	end component;

	component decode_states
		port(
		q : in std_logic_vector(4 downto 0);
		state : out std_logic_vector(13 downto 0));
	end component;




	component and2
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			output : out std_logic);
	end component;

	component or2
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			output : out std_logic);
	end component;

	component or3
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			output : out std_logic);
	end component;

	component inverter
		port(
			input : in std_logic;
			output: out std_logic);
	end component;


	component and3
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			output : out std_logic);
	end component;

	component nor3
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			output : out std_logic);
	end component;

	component buf
		port(
			input : in std_logic;
			output : out std_logic);
	end component;

	component nor2
		port(
			input1 : in std_logic;
			input2 : in std_logic;
			output : out std_logic);
	end component;

	component tx
		port(
			sel  : in std_logic;
			selnot : in std_logic;
			input : in std_logic;
			output : out std_logic);
	end component;

	component four_two_priority_encoder
		port(
			i0: in std_logic;
			i1: in std_logic;
			i2: in std_logic;
			i3: in std_logic;
			o: out std_logic_vector(1 downto 0)
	);
	end component;

	component mux_2
		port(
			cpu_offset: in std_logic_vector (1 downto 0);
			memory_offset: in std_logic_vector (1 downto 0);
			sel: in std_logic;
			offset: out std_logic_vector(1 downto 0)
			);
	end component;

	component dff_pos
		port(
			d : in std_logic;
			clk : in std_logic;
			q : out std_logic
			);
	end component;

	for counter1: counter use entity work.counter(structural);
	for decode_states1: decode_states use entity work.decode_states(structural);
	for all: four_two_priority_encoder use entity work.four_two_priority_encoder(structural);

	for all: and2 use entity work.and2(structural);
	for all: and3 use entity work.and3(structural);
	for all: or3 use entity work.or3(structural);
	
	for all: or2 use entity work.or2(structural);
	for all: inverter use entity work.inverter(structural);
	for all: nor3 use entity work.nor3(structural);
	for all: buf use entity work.buf(structural);
	for all: mux_2 use entity work.mux_2(structural);
	for all: dff_pos use entity work.dff_pos(structural);
	
	signal temp1: std_logic_vector(4 downto 0):="00000";

	signal s: std_logic_vector(13 downto 0);
	signal temp2,temp3,temp4,temp5,temp7,temp8,temp9,temp10: std_logic:='0';
	signal temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19: std_logic:='0';
	signal temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27: std_logic;
	signal temp28,temp29,temp30,temp31,temp32,temp33,temp34,temp35,temp36,temp37: std_logic;
	signal temp38,temp39,temp40,temp41,temp42,temp43,temp44,temp45,temp46: std_logic;
	signal temp47,temp48,temp49,temp50,temp51,temp52,temp53,temp54,temp55: std_logic;
	signal temp56,temp57,temp58,temp59,temp60,temp61,temp62,temp63,temp64: std_logic;
	signal temp65,temp66,temp67,temp68,temp70,temp72,temp73,temp74,temp75: std_logic;
	signal temp76,temp77,temp78,temp79,temp80,temp81,temp82,temp83,temp84: std_logic;
	signal temp69,temp71: std_logic_vector(1 downto 0);
	signal temp85,temp86,temp87,temp88: std_logic;

	signal high: std_logic:='1';
	signal low: std_logic:='0';

	begin
	counter1: counter port map(high,clk,temp12,temp1);
	decode_states1: decode_states port map(temp1,s);
	
	--reset
	inverter1: inverter port map(rd_wr,temp15);
	and2_1: and2 port map(temp15,s(3),temp19);--reset for W.M and W.H
	and3_2: and3 port map(rd_wr,hit_miss,s(2),temp28);--reset for R.H

	inverter7: inverter port map(start,temp58);--reset signal for counter
	buf10: buf port map(temp58,start_inv);
	and2_5: and2 port map(s(0),temp58,temp59);--if in state 0 and start is low reset counter

	
	and3_3: and3 port map(rd_wr,temp29,s(13),temp30);--reset for R.M
	inverter2: inverter port map(hit_miss,temp29);--reset for R.M

	or3_2: or3 port map(reset,temp19,temp28,temp31); --reset signal for counter
	or3_6: or3 port map(temp31,temp30,temp59,temp12);--reset signal for counter

	--mem_en
	and3_4: and3 port map(rd_wr,temp29,s(2),temp34);
	buf9: buf port map(temp34,mem_en);

	--busy
	nor3_1: nor3 port map(temp20,s(0),s(3),temp18);--busy for W.M 
	or2_2: or2 port map(rd_wr,hit_miss,temp20);--busy for W.M

	nor3_2: nor3 port map(rd_wr,s(0),s(3),temp16);--busy for W.H
	and2_2: and2 port map(hit_miss,temp16,temp17);--busy for W.H

	or3_1: or3 port map(temp18,temp17,temp23,temp27);--busy for W.M, W.H, R.H

	and3_1: and3 port map(rd_wr,hit_miss,s(1),temp23);

	
	nor3_3: nor3 port map(s(13),s(0),hit_miss,temp25);--busy for R.M
	and2_3: and2 port map(temp25,rd_wr,temp26);--busy for R.M

	or2_4: or2 port map(temp27,temp26,busy);--final busy 

	--Memory address
	and2_9: and2 port map(cpu_address(0),low,mem_address(0));
	and2_10: and2 port map(cpu_address(1),low,mem_address(1));
	buf1: buf port map(cpu_address(2),mem_address(2));
	buf2: buf port map(cpu_address(3),mem_address(3));
	buf11: buf port map(cpu_address(4),mem_address(4));
	buf12: buf port map(cpu_address(5),mem_address(5));
	buf13: buf port map(cpu_address(6),mem_address(6));
	buf14: buf port map(cpu_address(7),mem_address(7));

	--RD_WR_en (cache)
	or3_3: or3 port map(s(4),s(6),s(8),temp72);
	or2_11: or2 port map(temp72,s(10),temp73);
	and2_7: and2 port map(rd_wr,temp29,temp78);
	and2_8: and2 port map(temp73,temp78,temp75);
	and3_8: and3 port map(temp15,hit_miss,s(1),temp76);
	or2_6: or2 port map(temp75,temp76,temp77);
	inverter8: inverter port map(temp77,temp79);
	dff_pos2: dff_pos port map(temp79,clk,RD_WR_en);

	--RD en (output enable)
	and3_9: and3 port map(rd_wr,temp29,s(13),temp81);
	and3_10: and3 port map(rd_wr,hit_miss,s(2),temp82);
	or2_12: or2 port map(temp81,temp82,rd_output_en);

	--byte offset
	or2_3: or2 port map(s(4),s(5),temp65);
	or2_5: or2 port map(s(6),s(7),temp66);
	or2_9: or2 port map(s(8),s(9),temp67);
	or2_10: or2 port map(s(10),s(11),temp68);

	four_two_priority_encoder1: four_two_priority_encoder port map(temp65,temp66,temp67,temp68,temp69);
	mux_2_1: mux_2 port map (temp69,cpu_address(1 downto 0),temp88,byte_offset);
	or3_7: or3 port map(temp65,temp66,temp67,temp87);
	or2_13: or2 port map(temp87,temp68,temp88);


	--block offset
	buf3: buf port map(cpu_address(2),block_offset(0));
	buf4: buf port map(cpu_address(3),block_offset(1));
	buf5: buf port map(cpu_address(4),block_offset(2));

	--data type
	inverter6: inverter port map(hit_miss,temp85);
	and2_4: and2 port map(temp85,rd_wr,temp86);
	inverter9: inverter port map(temp86,data_type);

	--tag 
	buf6: buf port map(cpu_address(5),tag(0));
	buf7: buf port map(cpu_address(6),tag(1));
	buf8: buf port map(cpu_address(7),tag(2));

	--tag_valid_en
	and3_7: and3 port map(rd_wr,temp29,s(4),temp74);
	dff_pos1: dff_pos port map(temp74,clk,tag_valid_en);


	end structural; 