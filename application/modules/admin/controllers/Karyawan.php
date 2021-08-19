<?php defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Karyawan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('pengguna_model');
		$this->load->model('karyawan_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

	public function edit()
	{
		$this->load->view('index');
	}
	public function list()
	{
		$this->load->view('index');
	}
	public function clear_list()
	{
		$this->load->view('karyawan/list');
	}
	public function group()
	{
		$this->load->view('index');
	}
	public function clear_group()
	{
		$this->load->view('karyawan/group');
	}
	public function get_karyawan($id = 0)
	{
		$data = $this->db->get_where('karyawan',['id'=>$id])->result_array();
		output_json($data);
	}
	public function download_template_karyawan()
	{
		$this->load->library('table');
		$data = [['nama', 'nip', 'jk','ttl','alamat','hp','email']];
		$data[] = ['iwan safrudin','123456','L','Jepara, 01-01-1990','tulakan','6285290335332','esoftgreat@gmail.com'];
		$data[] = ['Marulina Fivit','123457','P','Jepara, 01-01-1990','tulakan','6285290335331','esoftgreat@gmail.com'];
		header("Content-type: application/vnd-ms-excel");
		header("Content-Disposition: attachment; filename=template_karyawan.xls");
		echo $this->table->generate($data);
	}
}
