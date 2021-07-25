<?php defined('BASEPATH') or exit('No direct script access allowed');

class Absensi_model extends CI_Model
{
	public function status()
	{
		return ['1' => 'Berangkat', '2' => 'Izin', '3' => 'Terlambat', '4' => 'Pulang', '5' => 'Absen'];
	}
	public function hari()
	{
		return ['1' => 'Senin', '2' => 'Selasa', '3' => 'Rabu', '4' => 'Kamis', '5' => 'Jumat', '6' => 'Sabtu', '7' => 'Ahad'];
	}

	public function get_absensi_today()
	{
		$data = $this->db->query('SELECT absensi.*,karyawan.nama FROM absensi INNER JOIN karyawan ON(karyawan.id = karyawan_id) WHERE CAST(waktu AS date) = ?', date('Y-m-d'))->result_array();
		$status = [
			'berangkat' => ['total' => 0, 'color' => 'success'],
			'izin' => ['total' => 0, 'color' => 'info'],
			'terlambat' => ['total' => 0, 'color' => 'warning'],
			'pulang' => ['total' => 0, 'color' => 'info'],
			'absen' => ['total' => 0, 'color' => 'danger'],
		];
		$karyawan_ids = [];
		foreach ($data as $key => $value) {
			$karyawan_ids[] = $value['karyawan_id'];
			if ($value['status'] == 1) {
				$status['berangkat']['total'] = @intval($status['berangkat']['total']) + 1;
				$status['berangkat']['karyawan'][$value['karyawan_id']] = ['nama' => $value['nama'], 'jam' => $value['waktu'], 'selisih' => $value['selisih_waktu']];
			} else if ($value['status'] == 2) {
				$status['izin']['total'] = @intval($status['izin']['total']) + 1;
				$status['izin']['karyawan'][$value['karyawan_id']] = ['nama' => $value['nama'], 'jam' => $value['waktu'], 'selisih' => $value['selisih_waktu']];
			} else if ($value['status'] == 3) {
				$status['terlambat']['total'] = @intval($status['terlambat']['total']) + 1;
				$status['terlambat']['karyawan'][$value['karyawan_id']] = ['nama' => $value['nama'], 'jam' => $value['waktu'], 'selisih' => $value['selisih_waktu']];
			} else if ($value['status'] == 4) {
				$status['pulang']['total'] = @intval($status['pulang']['total']) + 1;
				$status['pulang']['karyawan'][$value['karyawan_id']] = ['nama' => $value['nama'], 'jam' => $value['waktu'], 'selisih' => $value['selisih_waktu']];
			}
		}
		if (!empty($karyawan_ids)) {
			$this->db->select('id');
			$this->db->where_not_in('id', $karyawan_ids);
			$status['absen']['total'] = $this->db->get('karyawan')->num_rows();
			$this->db->select('nama');
			$this->db->where_not_in('id', $karyawan_ids);
			$karyawan_absen = $this->db->get('karyawan')->result_array();
			if (!empty($karyawan_absen)) {
				foreach ($karyawan_absen as $key => $value) {
					$status['absen']['karyawan'][] = $value['nama'];
				}
			}
		}
		return $status;
	}

	public function save()
	{
		if (!empty($_FILES['foto']['tmp_name']) || !empty($_POST['button'])) {
			$data = $_POST;
			if (!empty($_POST['button'])) {
				$foto = ['error' => 0];
				unset($data['button']);
				$output = ['status' => true, 'msg' => 'Anda berhasil absen tanpa foto', 'alert' => 'success'];
			} else {
				$foto = $_FILES['foto'];
				$output = ['status' => false, 'msg' => 'gagal upload foto', 'alert' => 'danger'];
			}
			if (!empty($data['karyawan_id']) && !empty($data['instansi_id']) && $foto['error'] == 0) {
				$exist = $this->db->get_where('absensi', ['instansi_id' => $data['instansi_id'], 'karyawan_id' => $data['karyawan_id'], 'CAST(waktu AS date)=' => date('Y-m-d'), 'status' => $data['status']])->row_array();
				$id    = 0;

				$waktu      = strtotime(date('H:i'));
				$jam_jadwal = strtotime($data['jam_jadwal']);

				$selisih = $waktu - $jam_jadwal;
				$selisih = $selisih / 60;
				$data['selisih_waktu'] = $selisih;

				if (empty($exist)) {
					$this->db->insert('absensi', $data);
					$id = $this->db->insert_id();
				} else {
					$output = ['status' => false, 'msg' => 'Sudah Melakukan absensi', 'alert' => 'danger'];
				}
				if (!empty($id) && empty($_POST['button'])) {
					$dir = FCPATH . 'images/modules/absensi/' . $id . '/';
					if (!is_dir($dir)) {
						mkdir($dir, 0777, 1);
					}
					$config['upload_path']   = $dir;
					$config['allowed_types'] = 'gif|jpg|png|jpeg';
					$config['encrypt_name']  = true;

					$this->load->library('upload');
					$this->upload->initialize($config);

					if (!$this->upload->do_upload('foto')) {
						$output = array('msg' => $this->upload->display_errors(), 'status' => false, 'alert' => 'danger');
					} else {
						$output = array('data' => $this->upload->data(), 'status' => true, 'msg' => 'Data Berhasil disimpan', 'alert' => 'success');
						$file_name = $output['data']['file_name'];
						$this->db->update('absensi', ['foto' => $file_name], ['id' => $id]);
					}
					if ($output['status']) {
						$config_image_lib['image_library']   = 'gd2';
						$config_image_lib['source_image']    = $dir . '/' . $file_name;
						// $config_image_lib['create_thumb'] = TRUE;
						$config_image_lib['maintain_ratio']  = TRUE;
						$config_image_lib['width']           = 500;
						$config_image_lib['height']          = 300;
						$this->load->library('image_lib');
						$this->image_lib->initialize($config_image_lib);
						$this->image_lib->resize();
					}
				}
			}
			return $output;
		}
	}

	public function get_jam_today($karyawan_id = 0)
	{
		$output = [];
		$hari_now = date('N');
		if (!empty($karyawan_id)) {
			$karyawan_id = intval($karyawan_id);
			$instansi_id = $this->db->get_where('karyawan', ['id' => $karyawan_id])->row_array();
			if (!empty($instansi_id)) {
				$instansi_id = $instansi_id['instansi_id'];
			}
			$data_jam    = $this->db->get_where('jam_absen', ['name' => 'config_jam_instansi_' . $instansi_id])->row_array();
			if (empty($data_jam)) {
				$data_jam    = $this->db->get_where('jam_absen', ['name' => 'config_jam'])->row_array();
			}
		}
		if (!empty($data_jam)) {
			$data_jam = json_decode($data_jam['value'], 1);
			$output['berangkat'] = $data_jam['akhir_berangkat_' . $hari_now];
			$output['pulang'] = $data_jam['mulai_pulang_' . $hari_now];
		}
		return $output;
	}

	public function get_status($karyawan_id = 0)
	{
		$jam      = [];
		$jam_today = [];
		$jam_now = date('H:i', time());
		$hari_now = date('N');
		$hari = $this->hari();
		$output = [];
		$output['status'] = 'Off';
		$output['status_key'] = 5;
		$output['class'] = 'danger';
		$output['exist'] = false;
		if (!empty($karyawan_id)) {
			$karyawan_id = intval($karyawan_id);
			$instansi_id = $this->db->get_where('karyawan', ['id' => $karyawan_id])->row_array();
			if (!empty($instansi_id)) {
				$instansi_id = $instansi_id['instansi_id'];
			}
			$data_jam    = $this->db->get_where('jam_absen', ['name' => 'config_jam_instansi_' . $instansi_id])->row_array();
			if (empty($data_jam)) {
				$data_jam    = $this->db->get_where('jam_absen', ['name' => 'config_jam'])->row_array();
			}

			if (!empty($data_jam['value'])) {
				$jam = json_decode($data_jam['value'], 1);
				$b1 = $jam['mulai_berangkat_' . $hari_now];
				$b2 = $jam['akhir_berangkat_' . $hari_now];
				$p1 = $jam['mulai_pulang_' . $hari_now];
				$p2 = $jam['akhir_pulang_' . $hari_now];

				$output['jam'] = [$jam_now, $p1, $p2, $b1, $b2];
				if (($jam_now >= $b1) && ($jam_now <= $b2)) {
					$output['status'] = 'Berangkat';
					$output['status_key'] = 1;
					$output['class'] = 'success';
					$output['exist'] = $this->db->get_where('absensi', ['instansi_id' => $instansi_id, 'karyawan_id' => $karyawan_id, 'CAST(waktu AS date)=' => date('Y-m-d')])->row_array();
				}
				if (($jam_now >= $b2) && ($jam_now <= $p1)) {
					$output['status'] = 'Terlambat';
					$output['status_key'] = 3;
					$output['class'] = 'danger';
					$output['exist'] = $this->db->get_where('absensi', ['instansi_id' => $instansi_id, 'karyawan_id' => $karyawan_id, 'CAST(waktu AS date)=' => date('Y-m-d')])->row_array();
				}
				if (($jam_now >= $p1) && ($jam_now <= $p2)) {
					$output['status'] = 'Pulang';
					$output['status_key'] = 4;
					$output['class'] = 'success';
					$output['exist'] = $this->db->get_where('absensi', ['instansi_id' => $instansi_id, 'karyawan_id' => $karyawan_id, 'CAST(waktu AS date)=' => date('Y-m-d'), 'status' => 4])->row_array();
					if (empty($output['exist'])) {
						$query = $this->db->query('SELECT * FROM absensi WHERE instansi_id = ? AND karyawan_id = ? AND CAST(waktu AS date) = ? AND (status = 1 OR status = 3)', [$instansi_id, $karyawan_id, date('Y-m-d')]);
						$pagi = $query->row_array();
						$output['query'] = $this->db->last_query();
						if (empty($pagi)) {
							$output['bolos'] = true;
							$output['exist'] = true;
						} else {
							$output['bolos'] = false;
						}
					}
				}
			}
		}
		return $output;
	}
	public function get_total_absensi($karyawan_id = 0, $status = 0)
	{
		$karyawan_id = intval($karyawan_id);
		$status      = intval($status);
		$instansi_id = $this->db->get_where('karyawan', ['id' => $karyawan_id])->row_array();
		if (!empty($instansi_id)) {
			$instansi_id = $instansi_id['instansi_id'];
		}
		if (!empty($karyawan_id)) {
			$this->db->select('id');
			if ($status == 1) {
				$this->db->where(['karyawan_id' => $karyawan_id, 'instansi_id' => $instansi_id, 'status' => 1]);
				$this->db->or_where(['status' => 2]);
				$total = $this->db->get('absensi');
				$total = $total->num_rows();
				if ($total > 1) {
					$total = $total / 2;
				}
			} else {
				$this->db->where(['karyawan_id' => $karyawan_id, 'instansi_id' => $instansi_id, 'status' => $status]);
				$total = $this->db->get('absensi');
				$total = $total->num_rows();
			}
			if (empty($total)) {
				$total = 0;
			}
			output_json(['total' => $total]);
		}
	}

	public function del_image($table = '', $ids = array())
	{
		if (!empty($table) && is_array($ids)) {
			foreach ($ids as $key => $value) {
				recursive_rmdir(FCPATH . 'images/modules/' . $table . '/' . $value . '/');
			}
		}
	}
	public function routine()
	{
		$libur = $this->db->query('SELECT * FROM absensi_libur WHERE CAST(date AS date) = ?', date('Y-m-d'))->row_array();
		if (empty($libur)) {
			$karyawan = $this->db->query('SELECT k.id FROM karyawan AS k LEFT JOIN absensi AS a ON(k.id=a.karyawan_id) WHERE CAST(waktu AS date) = ?', date('Y-m-d'))->result_array();
			$karyawan_ids = [];
			foreach ($karyawan as $key => $value) {
				$karyawan_ids[] = $value['id'];
			}
			$this->db->select('id');
			$this->db->select('instansi_id');
			$this->db->where_not_in('id', $karyawan_ids);
			$karyawan = $this->db->get('karyawan')->result_array();
			if (!empty($karyawan)) {
				$output = [];
				$i = 0;
				foreach ($karyawan as $key => $value) {
					$output[$i] = [
						'karyawan_id' => $value['id'],
						'instansi_id' => $value['instansi_id'],
						'longitude' => 0,
						'latitude' => 0,
						'valid' => 1,
						'status' => 5
					];
					$i++;
				}
				if (!empty($output)) {
					if ($this->db->insert_batch('absensi', $output)) {
						return ['status' => 1, 'msg' => 'success insert data', 'alert' => 'success'];
					} else {
						return ['status' => 0, 'msg' => 'failed insert data', 'alert' => 'danger'];
					}
				}
			}
		} else {
			return ['status' => 0, 'msg' => 'libur', 'alert' => 'danger'];
		}
	}
	public function rekap($k_id = 0, $year = '', $month = '',$instansi_id = 0)
	{
		if (empty($year)) {
			$year = date('Y');
		}
		if (empty($month)) {
			$month = date('m');
		}
		if (empty($k_id)) {
			$data = $this->db->get_where('absensi', ['YEAR(waktu)' => $year, 'MONTH(waktu)' => $month])->result_array();
		} else {
			$data = $this->db->get_where('absensi', ['karyawan_id' => $k_id])->result_array();
		}
		$tgl = $this->tgl($year . '-' . $month . '-01');
		// pr($tgl);
		// pr($data);
		$merge_data = [];
		if(!empty($data))
		{
			$merge_data = $this->merge_data_tgl($k_id,$data,$tgl);
		}else{
			$data = $this->get_karyawan(0,$instansi_id);
			$merge_data = $this->merge_data_tgl(0,$data,$tgl);
		}
		return $merge_data;
	}
	private function merge_data_tgl($k_id = 0 ,$data = array(), $tgl = array())
	{
		$merge_data = [];
		if (!empty($data)) {
			foreach ($data as $dkey => $dvalue) {
				foreach ($tgl as $key => $value) {
					$merge_data[$value['date']]['hari'] = $value['name'];
					if (!empty($dvalue['waktu'])) {
						if (substr($dvalue['waktu'], 0, 10) == $value['date']) {
							if (empty($k_id)) {
								$merge_data[$value['date']][$dvalue['status']][$dvalue['karyawan_id']] = $dvalue;
							} else {
								$merge_data[$value['date']][$dvalue['status']] = $dvalue;
							}
							$merge_data[$value['date']]['status'] = 'on';
						}else{
							if (empty($merge_data[$value['date']]['status'])) {
								$merge_data[$value['date']]['status'] = 'off';
							}
						}
					}else {
						$merge_data[$value['date']][0][$dvalue['id']] = 'off';
					}
				}
			}
		}
		return $merge_data;
	}
	public function tgl($date)
	{
		if (!empty($date)) {
			$date_set = substr($date, 0, 8);
			$end = $date_set . date('t', strtotime($date)); //get end date of month
			$tgl = [];
			$hari = ['Saturday' => 'Sabtu', 'Sunday' => 'Ahad', 'Monday' => 'Senin', 'Tuesday' => 'Selasa', 'Wednesday' => 'Rabu', 'Thursday' => 'Kamis', 'Friday' => 'Jumat'];
			while (strtotime($date) <= strtotime($end)) {
				$current_date = $date;
				$day_num = date('d', strtotime($date));
				$day_name = date('l', strtotime($date));
				$day_name = $hari[$day_name];
				$date = date("Y-m-d", strtotime("+1 day", strtotime($date)));
				$tgl[] = ['num' => $day_num, 'name' => $day_name, 'date' => $current_date];
			}
			return $tgl;
		}
	}
	public function get_karyawan($k_id = 0, $instansi_id = 0)
	{
		if (!empty($instansi_id)) {
			$this->db->where(['instansi_id' => $instansi_id]);
			if (!empty($k_id)) {
				$this->db->where(['id' => $k_id]);
				$data = $this->db->get('karyawan')->row_array();
			} else {
				$data = $this->db->get('karyawan')->result_array();
			}
			return $data;
		}
	}

	public function get_instansi($instansi_id = 0)
	{
		if (!empty($instansi_id)) {
			return $this->db->get_where('instansi', ['id' => $instansi_id])->row_array();
		}else{
			$user = $this->session->userdata(base_url('_logged_in'));
			if(!empty($user))
			{
				$user_instansi = $this->db->get_where('user_instansi',['user_id'=>$user['id']])->row_array();
				if(!empty($user_instansi['instansi_id']))
				{
					return $this->db->get_where('instansi', ['id' => $user_instansi['instansi_id']])->row_array();
				}
			}
		}
	}
}
