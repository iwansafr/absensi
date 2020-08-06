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
}