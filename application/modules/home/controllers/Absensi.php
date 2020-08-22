<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Absensi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('home_model');
		$this->load->model('karyawan_model');
		$this->load->model('admin/absensi_model');
		$this->load->helper('content');
		$this->load->library('esg');
	}
	public function index()
	{
		$this->home_model->home();
		$g_id = !empty($_GET['g_id']) ? intval($_GET['g_id']) : 0;
		$data = $this->karyawan_model->get_profile($g_id);
		if(!empty($data))
		{
			$status_key = @intval($this->absensi_model->get_status($g_id)['status_key']);
			if(!empty($status_key))
			{
				$data['status'] = $status_key;
			}
		}
		$this->esg->add_js([
			base_url('assets/absensi/script.js'),
		]);
		$output = $this->absensi_model->save();
		$this->load->view('index',['data'=>$data,'output'=>$output]);
	}
	public function my_location()
	{
		$this->load->view('home/absensi/location');
	}
	public function get_status($karyawan_id = 0)
	{
		output_json($this->absensi_model->get_status($karyawan_id));
	}
	public function get_berangkat($karyawan_id = 0)
	{
		output_json($this->absensi_model->get_total_absensi($karyawan_id,1));
	}
	public function get_absen($karyawan_id = 0)
	{
		output_json($this->absensi_model->get_total_absensi($karyawan_id,5));
	}
	public function get_terlambat($karyawan_id = 0)
	{
		output_json($this->absensi_model->get_total_absensi($karyawan_id,3));
	}
}