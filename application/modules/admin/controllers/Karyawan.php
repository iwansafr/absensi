<?php defined('BASEPATH') or exit('No direct script access allowed');

require('./vendor/autoload.php');
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
	public function upload_form()
	{
		$data = $this->upload_process();
		$this->load->view('index',$data);
	}
	public function upload_process()
	{
		$msg = [];
		$data = [];
		$status = true;
		if (isset($_FILES['excel']['tmp_name'])) {
			$post = $this->input->post();
			$reader = PhpOffice\PhpSpreadsheet\IOFactory::createReader('Xls');
			$reader->setReadDataOnly(TRUE);

			$spreadsheet = $reader->load($_FILES['excel']['tmp_name']);
			$worksheet = $spreadsheet->getActiveSheet();
			$data_karyawan = array();
			$title = array();
			$i = 0;
			$nip_tmp = [];
			$allowed_col = ['nama', 'nip', 'jk','ttl','alamat','hp','email'];
			foreach ($worksheet->getRowIterator() as $row) {
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(FALSE);
				$j = 1;
				foreach ($cellIterator as $cell) {
					$cell_value = $cell->getValue();
					if ($i == 0) {
						$title[$j] = $cell_value;
					} else {
						if ($title[$j] == 'nip') {
							$nip_tmp[] = intval(str_replace(' ','',str_replace("'",'',$cell_value)));
						}
						if (in_array($title[$j], $allowed_col)) {
							$data_karyawan[$i][$title[$j]] = $cell_value;
						}
					}
					$j++;
				}
				$i++;
			}

			$nip_exists = [];
			$nip_loop = $nip_tmp;
			pr($nip_loop);die();
			foreach ($nip_loop as $key => $value) {
				unset($nip_loop[$key]);
				if (in_array($value, $nip_loop)) {
					$nip_exists[] = $value;
					$status = false;
				}
			}
			if (empty($status)) {
				$msg = ['alert' => 'warning', 'msg' => 'Terdapat duplikat Data dengan NIP sbb : <h4>' . implode(',', $nip_exists) . '</h4> Silahkan cek kembali file excel'];
			} else {
				$status = true;
				if (!empty($nip_tmp)) {
					$this->db->select('id,nip');
					$this->db->where_in('nip', $nip_tmp);
					$karyawan_exist = $this->db->get('karyawan')->result_array();
					$nip_exists = [];
					if (!empty($karyawan_exist)) {
						foreach ($karyawan_exist as $key => $value) {
							$status = false;
							$nip_exists[] = $value['nip'];
						}
					} else {
						$status = true;
					}
					if (empty($status)) {
						$msg = ['alert' => 'warning', 'msg' => 'Terdapat Data Karyawan yang sudah terdaftar dengan NIP sbb : <h4>' . implode(',', $nip_exists) . '</h4> Silahkan cek kembali file excel'];
					} else {
						$tmp_karyawan = [];
						$instansi_id = $this->pengguna_model->get_instansi_id($this->session->userdata(base_url('_logged_in'))['id']);
						$kary_group_id = $this->db->query('SELECT id FROM karyawan_group ORDER BY id ASC LIMIT 1')->row_array();
						$kary_group_id = @intval($kary_group_id['id']);
						$kelamin  = ['L'=>1,'P'=>2];
						$data_user = [];
						$insert_user = [];
						$kary_role_exist = $this->karyawan_model->get_kary_role_id();
						$kary_role_id = 0;
						if(empty($kary_role_exist)){
							if($this->db->insert('user_role',['title'=>'karyawan','description'=>'akun karyawan','level'=>6])){
								$kary_role_id = $this->db->insert_id();
							}
						}else{
							$kary_role_id = $kary_role_exist;
						}
						foreach ($data_karyawan as $key => $value) {
							$ttl = $value['ttl'];
							$ttl = explode(',',str_replace(' ','',$ttl));
							unset($value['ttl']);
							$value['tmpt_lahir'] = $ttl[0];
							$strtime = strtotime($ttl[1]);
							$value['tgl_lahir'] = date('Y-m-d',$strtime);
							$value['instansi_id'] = $instansi_id;
							$value['kary_group_id'] = $kary_group_id;
							$value['jk'] = $kelamin[strtoupper($value['jk'])];
							$tmp_karyawan[$key] = $value;
							$password = date('dmY', $strtime);
							$insert_user[] =[
								'username' => $value['nip'],
								'email' => $value['email'],
								'password' => encrypt($password),
								'user_role_id' => $kary_role_id,
							];
						}
						$data['data_karyawan'] = $tmp_karyawan;
						if ($this->db->insert_batch('user',$insert_user)) {
							$this->db->select('id,username');
							$this->db->from('user');
							$users = $this->db->where_in('username', $nip_tmp)->get();
							$users = $users->result_array();
							foreach($users AS $key => $value)
							{
								foreach($tmp_karyawan AS $kkey => $kvalue)
								{
									if($kvalue['nip'] == $value['username']){
										$tmp_karyawan[$kkey]['user_id'] = $value['id'];
									}
								}
							}
							if ($this->db->insert_batch('karyawan', $tmp_karyawan)) {
								$status = true;
								$msg = ['alert' => 'success', 'msg' => 'Data Karyawan berhasil di upload'];
							}
						}
					}
				} else {
					$status = false;
					$msg = ['alert' => 'danger', 'msg' => 'File Excel tidak sesuai dengan template'];
				}
			}
		}
		$data['msg'] = $msg;
		return $data;
	}

	public function update_photo()
	{
		$this->load->view('index');
	}
}
