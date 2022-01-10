<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Absensi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('pengguna_model');
		$this->load->model('absensi_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

	public function index()
	{
		$user = $this->session->userdata(base_url('_logged_in'));
		$karyawan_id = $this->db->get_where('karyawan',['user_id'=>$user['id']])->row_array();
		$this->esg->add_js(
			[
				// 'http://maps.google.com/maps/api/js?sensor=false&libraries=geometry',
				base_url('assets/absensi/js/face-api.min.js?v='.time()),
				base_url('assets/absensi/js/script-in.js?v='.time()),
				'https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js',
			]
		);
		$data = [];
		$data['karyawan_id'] = @intval($karyawan_id['id']);
		$this->load->view('index',$data);
	}

	public function config_jam($kary_id = 0)
	{
		$instansi_id = $this->pengguna_model->get_instansi_id();
		$hari        = $this->absensi_model->hari();
		$is_user_exist = $this->db->query('SELECT user.id FROM user INNER JOIN karyawan ON(user.id=karyawan.user_id) WHERE karyawan.id = ?',$kary_id)->row();
		if(empty($is_user_exist->id))
		{
			$kary_id = 0;
		}
		$this->load->view('index',['instansi_id'=>$instansi_id,'hari'=>$hari,'kary_id'=>$kary_id]);
	}
	public function config_libur()
	{
		$this->load->view('index');
	}
	public function clear_libur()
	{
		$this->load->view('absensi/config_libur');
	}
	public function izin_list()
	{
		$this->load->view('index');
	}
	public function clear_izin_list()
	{
		$this->load->view('admin/absensi/izin_list');
	}
	public function list()
	{
		$this->load->view('index');
	}
	public function clear_list()
	{
		$this->load->view('absensi/list');
	}

	public function list_valid()
	{
		$this->load->view('index');
	}
	public function clear_list_valid()
	{
		$this->load->view('absensi/list_valid');
	}
	
	public function routine()
	{
		output_json($this->absensi_model->routine());
	}
	public function rekap_absensi()
	{
		$user = $this->session->userdata(base_url('_logged_in'));
		$year  = !empty($_GET['year']) ? $_GET['year'] : date('Y');
		$month = !empty($_GET['month']) ? $_GET['month'] : date('m');

		if(!empty($_GET['my']))
		{
			$get_month = !empty($_GET['my']) ? $_GET['my'] : date('m');
			$get_month = explode('-',$get_month);
			if(!empty($get_month[0]))
			{
				$year = $get_month[0];
			}
			if(!empty($get_month[1]))
			{
				$month = $get_month[1];
			}
		}

		// pr($data);die();
		$user_instansi = $this->db->get_where('user_instansi',['user_id'=>$user['id']])->row_array();
		$karyawan = $this->absensi_model->get_karyawan(0,@intval($user_instansi['instansi_id']));
		$instansi = $this->db->get_where('instansi',['id'=>@intval($user_instansi['instansi_id'])])->row_array();
		$data = $this->absensi_model->rekap(0,$year,$month,@intval($instansi['id']));
		if(empty($_GET['excel'])){
			$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
		}else{
			$this->load->view('admin/absensi/rekap_absensi',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
		}
	}
	public function rekap($k_id = 0)
	{
		if(!empty($k_id))
		{
			$year  = !empty($_GET['year']) ? $_GET['year'] : date('Y');
			$month = !empty($_GET['month']) ? $_GET['month'] : date('m');

			if(!empty($_GET['my']))
			{
				$get_month = !empty($_GET['my']) ? $_GET['my'] : date('m');
				$get_month = explode('-',$get_month);
				if(!empty($get_month[0]))
				{
					$year = $get_month[0];
				}
				if(!empty($get_month[1]))
				{
					$month = $get_month[1];
				}
			}

			// pr($data);die();
			$karyawan = $this->db->query('SELECT * FROM karyawan WHERE id = ?', $k_id)->row_array();
			$instansi = $this->absensi_model->get_instansi(@$karyawan['instansi_id']);
			$data = $this->absensi_model->rekap($k_id,$year,$month,@$instansi['id']);
			$jadwal = [];
			if(!empty($karyawan['user_id'])){
				$jadwal = $this->db->get_where('jam_absen',['name'=>'config_jam_user_'.$karyawan['user_id']])->row_array();
				if(empty($jadwal)){
					$jadwal = $this->db->get_where('jam_absen',['name'=>'config_jam_instansi_'.$karyawan['instansi_id']])->row_array();
				}
				// pr($this->db->last_query());
				if(!empty($jadwal)){
					$jadwal = json_decode($jadwal['value'],1);
					$libur = [];
					foreach($jadwal AS $key => $value){
						if(preg_match('~mulai_berangkat_~', $key)){
							// pr($key);
						}else{
							// pr($value);
						}
					}
				}
				// die();
			}
			if(empty($_GET['excel'])){
				$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
			}else{
				$this->load->view('admin/absensi/rekap',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
			}
		}
	}
	public function rekap_all()
	{
		$year  = !empty($_GET['year']) ? $_GET['year'] : date('Y');
		$month = !empty($_GET['month']) ? $_GET['month'] : date('m');

		if(!empty($_GET['my']))
		{
			$get_month = !empty($_GET['my']) ? $_GET['my'] : date('m');
			$get_month = explode('-',$get_month);
			if(!empty($get_month[0]))
			{
				$year = $get_month[0];
			}
			if(!empty($get_month[1]))
			{
				$month = $get_month[1];
			}
		}
		
		$data = $this->absensi_model->rekap(0,$year,$month);
		// pr($data);die();
		$karyawan = $this->absensi_model->get_karyawan(0,1);
		$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'year'=>$year,'month'=>$month]);
	}

	public function masuk()
	{
		$this->load->model('Home/home_model');
		$this->load->model('Home/karyawan_model','kary_model');

		// if(!$this->db->field_exists('jam_jadwal','absensi'))
		// {
		// 	$this->load->dbforge();
		// 	$fields = array(
		// 		'jam_jadwal' => array(
		// 			'type' => 'VARCHAR',
		// 			'constraint' => '6',
		// 			'default' => '00:00',
		// 			'after' => 'waktu'
		// 		),
		// 	);
		// 	$this->dbforge->add_column('absensi',$fields);
		// }
		// if(!$this->db->field_exists('selisih_waktu','absensi'))
		// {
		// 	$this->load->dbforge();
		// 	$fields = array(
		// 		'selisih_waktu' => array(
		// 			'type' => 'VARCHAR',
		// 			'constraint' => '6',
		// 			'default' => '00:00',
		// 			'after' => 'waktu'
		// 		),
		// 	);
		// 	$this->dbforge->add_column('absensi',$fields);
		// }
		// if(!$this->db->field_exists('device','absensi'))
		// {
		// 	$this->load->dbforge();
		// 	$fields = array(
		// 		'device' => array(
		// 			'type' => 'TEXT',
		// 			'after' => 'waktu'
		// 		),
		// 	);
		// 	$this->dbforge->add_column('absensi',$fields);
		// }
		$this->home_model->home();
		$user_id = $this->session->userdata(base_url('_logged_in'))['id'];
		$g_id = @intval($this->db->query('SELECT id FROM karyawan WHERE user_id = ?',[$user_id])->row_array()['id']);
		$data = $this->kary_model->get_profile($g_id);

		if(!empty($data))
		{
			$jam_today = $this->absensi_model->get_jam_today($g_id, $user_id);
			$status_key = @intval($this->absensi_model->get_status($g_id, $user_id)['status_key']);
			$instansi = $this->absensi_model->get_instansi($data['instansi_id']);
			$data['instansi'] = $instansi;
			if(!empty($status_key))
			{
				if($status_key == 1 || $status_key == 3)
				{
					$data['jam_jadwal'] = $jam_today['berangkat'];
				}else{
					$data['jam_jadwal'] = $jam_today['pulang'];
				}
				$data['status'] = $status_key;
			}
			$data['jadwal'] = $jam_today['jadwal'];
		}
		$this->esg->add_js([
			// 'http://maps.google.com/maps/api/js?sensor=false&libraries=geometry',
			base_url('assets/absensi/script.js?v='.time()),
			base_url('assets/absensi/js/face-api.min.js?v='.time()),
			base_url('assets/absensi/js/script-in.js?v='.time()),
			'https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js',
		]);
		$output = $this->absensi_model->save();
		$this->load->view('index',['data'=>$data,'output'=>$output]);
	}

	public function face()
	{
		$this->load->view('admin/absensi/face');
	}
	public function rekap_poin()
	{
		$month_year = $this->input->get('my');
		if(empty($month_year)){
			$month_year = date('Y-m');
		}
		$data = $this->absensi_model->get_rekap_poin($month_year);
		$this->load->view('index',['data'=>$data,'month_year'=>$month_year]);
	}
	public function get_code($json = true)
	{
		$user = $this->session->userdata(base_url('_logged_in'));
		$output = ['status'=>false];
		if(!empty($user))
		{
			if(strtolower($user['role']) == 'instansi' || strtolower($user['role']) == 'sekolah' || strtolower($user['role']) == 'tu' ){
				$this->db->limit(1);
				$pengguna = $this->db->get_where('user_instansi',['user_id'=>$user['id']])->row_array();
			}else if(strtolower($user['role'] == 'karyawan')){
				$this->db->limit(1);
				$pengguna = $this->db->get_where('karyawan',['user_id'=>$user['id']])->row_array();
			}
			$code = $pengguna['instansi_id'].date('YmdHis');
			$code = substr($code,0,14);
			$output = ['status'=>true, 'code'=>md5($code)];
		}
		if($json){
			output_json($output);
		}else{
			return $output;
		}
	}
	public function qr()
	{
		$this->load->model('Home/home_model');
		$this->load->model('Home/karyawan_model', 'kary_model');
		// $this->home_model->home();
		$user_id = $this->session->userdata(base_url('_logged_in'))['id'];
		$g_id = @intval($this->db->query('SELECT id FROM karyawan WHERE user_id = ?', [$user_id])->row_array()['id']);
		$data = $this->kary_model->get_profile($g_id);

		if (!empty($data)) {
			$jam_today = $this->absensi_model->get_jam_today($g_id, $user_id);
			$status_key = @intval($this->absensi_model->get_status($g_id, $user_id)['status_key']);
			$instansi = $this->absensi_model->get_instansi($data['instansi_id']);
			$data['instansi'] = $instansi;
			if (!empty($status_key)) {
				if ($status_key == 1 || $status_key == 3) {
					$data['jam_jadwal'] = $jam_today['berangkat'];
				} else {
					$data['jam_jadwal'] = $jam_today['pulang'];
				}
				$data['status'] = $status_key;
			}
			$data['jadwal'] = $jam_today['jadwal'];
		}
		$this->esg->add_js([
			// 'http://maps.google.com/maps/api/js?sensor=false&libraries=geometry',
			base_url('assets/absensi/script.js?v=' . time()),
			// base_url('assets/absensi/js/face-api.min.js?v=' . time()),
			// base_url('assets/absensi/js/script-in.js?v=' . time()),
			// 'https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js',
		]);
		$output = $this->absensi_model->save();
		$this->load->view('index', ['data' => $data, 'output' => $output]);
	}
	public function show_qr()
	{
		$code = $this->get_code(false);
		if($code['status']){
			$this->load->view('admin/absensi/show_qr');
		}else{
			echo 'instansi tidak diketahui, silahkan login terlebih dahulu';
		}
	}
	public function get_qr()
	{
		include_once APPPATH.'/third_party/phpqrcode/qrlib.php';
		$code = $this->get_code(false);
		if($code['status']){
			QRcode::png($code['code'],false,QR_ECLEVEL_H,10,5);
		}
	}
	public function generate_qr($code ='')
	{
		include_once APPPATH . '/third_party/phpqrcode/qrlib.php';
		if ($code) {
			QRcode::png($code, false, QR_ECLEVEL_H, 10, 5);
		}
	}
}