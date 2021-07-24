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
	public function agenda()
	{
		$this->load->view('index');
	}
	public function index()
	{
		if(!$this->db->field_exists('jam_jadwal','absensi'))
		{
			$this->load->dbforge();
			$fields = array(
			'jam_jadwal' => array(
				'type' => 'VARCHAR',
				'constraint' => '6',
				'default' => '00:00',
				'after' => 'waktu'
			),
					);
					$this->dbforge->add_column('absensi',$fields);
				}
				if(!$this->db->field_exists('selisih_waktu','absensi'))
				{
					$this->load->dbforge();
					$fields = array(
			'selisih_waktu' => array(
				'type' => 'VARCHAR',
				'constraint' => '6',
				'default' => '00:00',
				'after' => 'waktu'
			),
					);
					$this->dbforge->add_column('absensi',$fields);
				}
				if(!$this->db->field_exists('device','absensi'))
				{
					$this->load->dbforge();
					$fields = array(
			'device' => array(
				'type' => 'TEXT',
				'after' => 'waktu'
			),
			);
			$this->dbforge->add_column('absensi',$fields);
		}
		$this->home_model->home();
		$g_id = !empty($_GET['g_id']) ? intval($_GET['g_id']) : 0;
		$data = $this->karyawan_model->get_profile($g_id);

		if(!empty($data))
		{
			$jam_today = $this->absensi_model->get_jam_today($g_id);
			// pr($jam_today);
			$status_key = @intval($this->absensi_model->get_status($g_id)['status_key']);
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
		}
		$this->esg->add_js([
			base_url('assets/absensi/script.js'),
		]);
		$output = $this->absensi_model->save();
		$this->load->view('index',['data'=>$data,'output'=>$output]);
	}

	public function face()
	{
		$this->load->view('home/absensi/face');
	}
	public function get_karyawan()
  {
    $data = $this->db->get_where('karyawan')->result_array();
    echo json_encode($data);
  }

  public function save($id = 0)
  {
  	$data = $this->karyawan_model->get_profile($id);
  	pr($data);

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