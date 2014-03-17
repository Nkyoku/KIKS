library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.ALL;
use IEEE.std_logic_textio.all;
use STD.textio.all;


library work;
use work.misc_pkg.all;
use work.BLDCControllerQuad_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchBLDCController is
end TestBenchBLDCController;



architecture Simulation of TestBenchBLDCController is
	
	signal clk_sys		: std_logic;
	signal clk_pwm		: std_logic;
	
	signal reset		: std_logic;
	signal omsp_reset	: std_logic;
	
	signal sync			: std_logic;
	
	signal hall_update	: std_logic;
	signal hall_u		: std_logic;
	signal hall_v		: std_logic;
	signal hall_w		: std_logic;
	signal enc_a		: std_logic;
	signal enc_b		: std_logic;
	
	signal pwm_u		: std_logic;
	signal pwm_v		: std_logic;
	signal pwm_w		: std_logic;
	signal nreset_u		: std_logic;
	signal nreset_v		: std_logic;
	signal nreset_w		: std_logic;
	
	constant voltage	: real := 16.0;		-- 電源電圧
	constant resistance	: real := 1.2;		-- 平均的な抵抗値
	constant inertia	: real := 92.5;		-- 慣性モーメント
	constant kt			: real := 0.255;	-- トルク/電流係数
	constant ke			: real := 0.000446;	-- 電圧/角速度係数
	constant load_loss	: real := 0.000001;	-- 機械損失
	
	signal position		: real := 0.0;	-- 回転子の角度[degree]
	signal velocity		: real := 0.0;	-- 角速度[degree/s]
	signal torque		: real := 0.0;	-- 発生トルク[Nm]
	signal rpm			: real := 0.0;	-- 回転数[rpm]
	signal current		: real := 0.0;	-- 電流[A]
	signal current_ave	: real := 0.0;	-- 平均電流[A]
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wait		: std_logic;
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);

	signal nfault		: std_logic := '1';
	
	
	
	
	


begin
	QMOTOR : BLDCControllerQuad
		generic map(
			PBUS_BASE_ADDRESS	=> X"0400",
			XBUS_BASE_ADDRESS	=> X"0140",
			CURRENT_CONFIG		=> "xx"
		)
		port map(
			CLK_SYS			=> clk_sys,
			CLK_PWM			=> clk_pwm,
			
			OMSP_SYNC		=> sync,
			
			RESET			=> reset,
			OMSP_RESET		=> omsp_reset,
			
			BAWVU_UPDATE	=> hall_update,
			BAWVU_IN_0(0)	=> hall_u,
			BAWVU_IN_0(1)	=> hall_v,
			BAWVU_IN_0(2)	=> hall_w,
			BAWVU_IN_0(3)	=> enc_a,
			BAWVU_IN_0(4)	=> enc_b,
			BAWVU_IN_1		=> "00000",
			BAWVU_IN_2		=> "00000",
			BAWVU_IN_3		=> "00000",
			
			PWM_OUT_0(0)	=> pwm_u,
			PWM_OUT_0(1)	=> pwm_v,
			PWM_OUT_0(2)	=> pwm_w,
			PWM_OUT_1		=> open,
			PWM_OUT_2		=> open,
			PWM_OUT_3		=> open,
			nRESET_OUT_0(0)	=> nreset_u,
			nRESET_OUT_0(1)	=> nreset_v,
			nRESET_OUT_0(2)	=> nreset_w,
			nRESET_OUT_1	=> open,
			nRESET_OUT_2	=> open,
			nRESET_OUT_3	=> open,
			nFAULT_IN(0)	=> nfault,
			nFAULT_IN(1)	=> '1',
			nFAULT_IN(2)	=> '1',
			nFAULT_IN(3)	=> '1',
			nOTW_IN(0)		=> '1',
			nOTW_IN(1)		=> '1',
			nOTW_IN(2)		=> '1',
			nOTW_IN(3)		=> '1',
			
			PBUS_EN			=> mem_en,
			PBUS_WR			=> mem_wr,
			PBUS_WAIT		=> mem_wait,
			PBUS_ADDR		=> mem_addr,
			PBUS_DATA_IN	=> mem_din,
			PBUS_DATA_OUT	=> mem_dout,
			XBUS_EN			=> '0',
			XBUS_WR			=> "00",
			XBUS_ADDR		=> X"0000",
			XBUS_DATA_IN	=> X"0000",
			XBUS_DATA_OUT	=> open
		);
	
	-- 45MHz生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	-- 144MHz生成
	CLK_PWM_process : process begin
		clk_pwm <= '1';
		wait for 3.472 ns;
		clk_pwm <= '0';
		wait for 3.472 ns;
	end process;
	
	-- 2ms間隔
	Sync_process : process begin
		wait until rising_edge(clk_sys);
		sync <= '1';
		wait until rising_edge(clk_sys);
		sync <= '0';
		wait for 2 ms;
	end process;
	
	-- データ生成
	Bus_process : process begin
		-- リセット
		reset		<= '1';
		omsp_reset	<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 100 ns;
		omsp_reset	<= '0';
		wait for 100 ns;
		
		wait for 10 us;
		
		-- バスアクセス
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0400", X"3CF0");
		wait for 30 us;
		
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0402", X"0765");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0403", X"0876");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0404", X"0961");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0405", X"1919");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0400", X"3CF8");
		wait for 30 us;
		
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0400", X"00F0");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0402", X"03E8");
		wait for 20 ms;
		
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0402", X"F830");
		
		
		--BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0002", X"83E8");
		wait for 100 ms;
		
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- update生成
	HallUpdate_process : process begin
		wait until rising_edge(clk_sys);
		hall_update	<= '1';
		wait until rising_edge(clk_sys);
		hall_update	<= '0';
		wait for 330 ns;
	end process;
	
	
	
	-- BLDCモデル
	BLDC_process : process
	variable var_velocity	: real;
	variable var_rotor		: real;
	variable var_rotor_int	: integer;
	variable var_encoder	: integer;
	variable var_rotor_x	: real;
	variable var_rotor_y	: real;
	variable var_field_x	: real;
	variable var_field_y	: real;
	variable var_brake		: real;
	variable var_current	: real;
	variable var_torque		: real;
	variable var_bemf		: real;
	
	begin
		var_velocity	:= 0.0;
		var_rotor	:= 0.0;
		var_current	:= 0.0;
		hall_u	<= '1';
		hall_v	<= '1';
		hall_w	<= '1';
		enc_a	<= '0';
		enc_b	<= '0';
		
		
		
		-- メインループ
		loop1 : loop
			-- 損失
			--var_velocity := var_velocity - load_loss * var_velocity;
			
			
			--force;
			
			-- 回転子に働く力を計算
			var_bemf	:= ke * var_velocity;
			var_rotor_x := cos(var_rotor / 180.0 * MATH_PI);
			var_rotor_y := sin(var_rotor / 180.0 * MATH_PI);
			var_field_x := 0.0;
			var_field_y := 0.0;
			var_brake	:= 0.0;
			if (nreset_u = '1' and nreset_v = '1') then
				if (pwm_u = '1' and pwm_v = '0') then 
					var_field_x := var_field_x - 0.866;
					var_field_y := var_field_y - 0.500;
				elsif (pwm_u = '0' and pwm_v = '1') then 
					var_field_x := var_field_x + 0.866;
					var_field_y := var_field_y + 0.500;
				else
					var_brake := var_brake + 0.866;
				end if;
			end if;
			if (nreset_v = '1' and nreset_w = '1') then
				if (pwm_v = '1' and pwm_w = '0') then 
					var_field_y := var_field_y + 1.000;
				elsif (pwm_v = '0' and pwm_w = '1') then 
					var_field_y := var_field_y - 1.000;
				else
					var_brake := var_brake + 0.866;
				end if;
			end if;
			if (nreset_w = '1' and nreset_u = '1') then
				if (pwm_w = '1' and pwm_u = '0') then 
					var_field_x := var_field_x + 0.866;
					var_field_y := var_field_y - 0.500;
				elsif (pwm_w = '0' and pwm_u = '1') then 
					var_field_x := var_field_x - 0.866;
					var_field_y := var_field_y + 0.500;
				else
					var_brake := var_brake + 0.866;
				end if;
			end if;
			var_current	:= (voltage - abs(var_bemf)) / resistance * (var_rotor_x * var_field_y - var_rotor_y * var_field_x);
			var_current := var_current - var_bemf / resistance * var_brake;
			var_torque	:= kt * var_current;
			
			
			
			
			var_velocity := (1.0 - load_loss) * var_velocity + 180.0 / MATH_PI * var_torque / inertia;
			
			
			
			
			
			
			--torque <= var_rotor_x;
			
			
			
			
			
			-- 更新
			velocity	<= var_velocity;
			torque		<= var_torque;
			rpm			<= var_velocity / 360.0 * 60.0;
			current		<= var_current;
			current_ave	<= current_ave * 0.995 + var_current * 0.005;
			var_rotor	:= var_rotor - var_velocity * 0.000001;
			
			-- 回転子の角度を正規化
			--var_rotor_int := integer(var_rotor * 1000000.0);
			--var_rotor_int := var_rotor_int mod 360000000;
			--var_rotor := real(var_rotor_int) / 1000000.0;
			if (var_rotor < 0.0) then
				var_rotor := var_rotor + 360.0;
			elsif (360.0 < var_rotor) then
				var_rotor := var_rotor - 360.0;
			end if;
			position <= var_rotor;
			
			-- ホールセンサー出力
			if ((var_rotor < 150.0) or (330.0 < var_rotor)) then
				hall_u	<= '1';
			else
				hall_u	<= '0';
			end if;
			if ((210.0 < var_rotor) or (var_rotor < 30.0)) then
				hall_v	<= '1';
			else
				hall_v	<= '0';
			end if;
			if ((90.0 < var_rotor) and (var_rotor < 270.0)) then
				hall_w	<= '1';
			else
				hall_w	<= '0';
			end if;
			
			-- エンコーダ出力
			var_encoder := integer(var_rotor * 4.0) mod 4;
			if (2 <= var_encoder) then
				enc_a	<= '1';
			else
				enc_a	<= '0';
			end if;
			if ((1 <= var_encoder) and (var_encoder <= 2)) then
				enc_b	<= '1';
			else
				enc_b	<= '0';
			end if;
			
			
			wait for 1 us;
		end loop loop1;
		
	end process;
	
	
	
	-- プロット
	-- PLOT_process : process
	-- variable timecount	: real := 0.0;
	-- file plot_file		: text open WRITE_MODE is "../../waveform.txt";
	-- variable output		: line;
	-- begin
		
		
		-- write(output, timecount);
		-- write(output, string'(" "));
		-- write(output, position);
		-- write(output, string'(" "));
		-- write(output, rpm);
		-- write(output, string'(" "));
		-- write(output, current);
		-- write(output, string'(" "));
		-- write(output, hall_u);
		-- write(output, string'(" "));
		-- write(output, hall_v);
		-- write(output, string'(" "));
		-- write(output, hall_w);
		
		
		
		
        
        -- writeline(plot_file, output);
		
		
		-- wait for 8 us;
		-- timecount := timecount + 0.008;
	-- end process;
	
	
	
	
	
	
	
	
	
end;
