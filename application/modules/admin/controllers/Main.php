<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('main_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

	public function index()
	{

	}

	public function config()
	{
		$this->load->view('index');
	}

	function get_provinces()
	{
		echo file_get_contents('https://sipapat.patikab.go.id/admin/provinces/all');
	}
  
  function get_regencies()
  {
  	echo file_get_contents('https://sipapat.patikab.go.id/admin/regencies/all');
  }
  
  function get_districts()
  {
  	echo file_get_contents('https://sipapat.patikab.go.id/admin/districts/all');
  }
  
  function get_villages()
  {
  	echo file_get_contents('https://sipapat.patikab.go.id/admin/villages/all');
  }
  
  function detail_json($table = '', $id = '')
  {
  	$data = $this->db->get_where($table,['id'=>$id])->row_array();
  	if(!empty($data))
  	{
  		echo output_json($data);
  	}
  }
  function config_json($table = '', $name = '')
  {
  	$data = $this->db->get_where($table,['name'=>$name])->row_array();
  	if(!empty($data))
  	{
  		echo output_json(json_decode($data['value'],1));
  	}
  }
}