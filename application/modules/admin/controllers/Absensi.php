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
				base_url('assets/absensi/js/face-api.min.js?v='.time()),
				base_url('assets/absensi/js/script-in.js?v='.time()),
				'https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js',
			]
		);
		$data = [];
		$data['karyawan_id'] = @intval($karyawan_id['id']);
		$this->load->view('index',$data);
	}

	public function config_jam()
	{
		$instansi_id = $this->pengguna_model->get_instansi_id();
		$hari        = $this->absensi_model->hari();

		$this->load->view('index',['instansi_id'=>$instansi_id,'hari'=>$hari]);
	}
	public function config_libur()
	{
		$this->load->view('index');
	}
	public function clear_libur()
	{
		$this->load->view('absensi/config_libur');
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
		$karyawan = $this->absensi_model->get_karyawan(0,1);
		$instansi = $this->absensi_model->get_instansi();
		$data = $this->absensi_model->rekap(0,$year,$month,$instansi['id']);
		$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
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
			$karyawan = $this->absensi_model->get_karyawan($k_id,1);
			$instansi = $this->absensi_model->get_instansi(@$karyawan['instansi_id']);
			$data = $this->absensi_model->rekap($k_id,$year,$month,@$instansi['id']);
			$this->load->view('index',['data'=>$data,'karyawan'=>$karyawan,'month'=>$month,'year'=>$year,'instansi'=>$instansi]);
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
}