<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Absensi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('home_model');
		$this->load->model('guru_model');
		$this->load->helper('content');
		$this->load->library('esg');
	}
	public function index()
	{
		$this->home_model->home();
		$g_id = !empty($_GET['g_id']) ? intval($_GET['g_id']) : 0;
		$data = $this->guru_model->get_profile($g_id);
		// $this->esg->add_css([
		// 	'https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.css',
		// ]);
		$this->esg->add_js([
			base_url('assets/absensi/script.js'),
			// 'https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js'
		]);
		$this->load->view('index',['data'=>$data]);
	}
	public function my_location()
	{
		$this->load->view('home/absensi/location');
	}
}