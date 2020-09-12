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
		$this->esg->add_js(['https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js',base_url('assets/absensi/sekolah.js')]);
		$this->load->view('index');
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