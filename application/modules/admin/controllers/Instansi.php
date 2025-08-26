<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Instansi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

	public function list()
	{
		$this->load->view('index');
	}
	public function clear_list()
	{
		$this->load->view('instansi/list');
	}

	public function batas_jarak($id = 0)
	{
		$this->load->view('index',['id'=>$id]);
	}

	public function edit()
	{
		$this->esg->add_css('https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.css');
		$this->esg->add_js([
			'https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js',
			base_url('assets/absensi/sekolah.js'),
		]);
		$get = $this->input->get();
		$data = [];
		if(empty($get['p']))
		{
			$data['provinces'] = $this->db->get_where('provinces')->result_array();
		}else if(empty($get['r'])){
			$data['regencies'] = $this->db->get_where('regencies',['province_id'=>$get['p']])->result_array();
		}else if(empty($get['d'])){
			$data['districts'] = $this->db->get_where('districts',['regency_id'=>$get['r']])->result_array();
		}else{
			$data['provinces'] = $this->db->get_where('provinces',['id'=>$get['p']])->row_array();
			$data['regencies'] = $this->db->get_where('regencies',['id'=>$get['r']])->row_array();
			$data['districts'] = $this->db->get_where('districts',['id'=>$get['d']])->row_array();
		}

		$this->load->view('index', $data);
	}

	public function config($instansi_id=0)
	{
		if(!empty($instansi_id))
		{
			$config = $this->esg->get_config('jarak_instansi_'.$instansi_id);
			output_json($config);
		}
	}
}