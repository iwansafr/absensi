<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Absensi_model extends CI_Model
{
	public function status()
	{
		return ['1'=>'Berangkat','2'=>'Izin','3'=>'Terlambat','4'=>'Pulang','5'=>'Absen'];
	}
	public function hari()
	{
		return ['1'=>'Senin','2'=>'Selasa','3'=>'Rabu','4'=>'Kamis','5'=>'Jumat','6'=>'Sabtu','7'=>'Ahad'];
	}

	public function save()
	{
		if(!empty($_FILES['foto']['tmp_name']))
		{
			$foto = $_FILES['foto'];
			$data = $_POST;
			$output = ['status'=>false,'msg'=>'gagal upload foto','alert'=>'danger'];
			if(!empty($data['karyawan_id']) && !empty($data['instansi_id']) && $foto['error'] == 0)
			{
				$exist = $this->db->get_where('absensi',['instansi_id'=>$data['instansi_id'],'karyawan_id'=>$data['karyawan_id'],'CAST(waktu AS date)='=>date('Y-m-d')])->row_array();
				$id    = 0;

				if(empty($exist)){
					$this->db->insert('absensi',$data);
					$id = $this->db->insert_id();
				}else{
					$output = ['status'=>false,'msg'=>'Sudah Melakukan absensi','alert'=>'danger'];
				}
				if(!empty($id))
				{
					$dir = FCPATH.'images/modules/absensi/'.$id.'/';
					if(!is_dir($dir))
					{
						mkdir($dir,0777,1);
					}
					$config['upload_path']   = $dir;
					$config['allowed_types'] = 'gif|jpg|png';
					$config['encrypt_name']  = true;

					$this->load->library('upload');
					$this->upload->initialize($config);

					if(!$this->upload->do_upload('foto'))
	        {
	          $output = array('msg' => $this->upload->display_errors(),'status'=>false,'alert'=>'danger');
	        }else{
	          $output = array('data' => $this->upload->data(),'status'=>true,'msg'=>'Data Berhasil disimpan','alert'=>'success');
	          $file_name = $output['data']['file_name'];
	          $this->db->update('absensi',['foto'=>$file_name],['id'=>$id]);
	        }
	        if($output['status'])
	        {
						$image_lib['image_library']   = 'gd2';
						$image_lib['source_image']    = $dir.$id.'/'.$file_name;
						// $image_lib['create_thumb'] = TRUE;
						$image_lib['maintain_ratio']  = TRUE;
						$image_lib['width']           = 750;
						$image_lib['height']          = 500;
						$this->load->library('image_lib');
						$this->image_lib->initialize($image_lib);
	        }
				}
			}
			return $output;
		}
	}

	public function get_status($karyawan_id = 0)
	{
		$jam      = [];
		$jam_today = [];
		$jam_now = date('H:i',time());
		$hari_now = date('N');
		$hari = $this->hari();
		$output = [];
		$output['status'] = 'Off';
		$output['status_key'] = 5;
		$output['class'] = 'danger';
		$output['exist'] = false;
		if(!empty($karyawan_id))
		{
			$data_jam    = $this->db->get_where('jam_absen',['name'=>'config_jam'])->row_array();
			$karyawan_id = intval($karyawan_id);
			$instansi_id = $this->db->get_where('karyawan',['id'=>$karyawan_id])->row_array();
			if(!empty($instansi_id))
			{
				$instansi_id = $instansi_id['instansi_id'];
			}

			if(!empty($data_jam['value']))
			{
				$jam = json_decode($data_jam['value'],1);
				$b1 = $jam['mulai_berangkat_'.$hari_now];
				$b2 = $jam['akhir_berangkat_'.$hari_now];
				$p1 = $jam['mulai_pulang_'.$hari_now];
				$p2 = $jam['akhir_pulang_'.$hari_now];

				$output['jam'] =[$jam_now,$p1,$p2,$b1,$b2];
				if(($jam_now >= $b1) && ($jam_now <= $b2)){
					$output['status'] = 'Berangkat';
					$output['status_key'] = 1;
					$output['class'] = 'success';
					$output['exist'] = $this->db->get_where('absensi',['instansi_id'=>$instansi_id,'karyawan_id'=>$karyawan_id,'CAST(waktu AS date)='=>date('Y-m-d')])->row_array();
				}
				if(($jam_now >= $b2) && ($jam_now <= $p1)){
					$output['status'] = 'Terlambat';
					$output['status_key'] = 3;
					$output['class'] = 'danger';
					$output['exist'] = $this->db->get_where('absensi',['instansi_id'=>$instansi_id,'karyawan_id'=>$karyawan_id,'CAST(waktu AS date)='=>date('Y-m-d')])->row_array();
				}
				if(($jam_now >= $p1) && ($jam_now <= $p2)){
					$output['status'] = 'Pulang';
					$output['status_key'] = 4;
					$output['class'] = 'success';
					$output['exist'] = $this->db->get_where('absensi',['instansi_id'=>$instansi_id,'karyawan_id'=>$karyawan_id,'CAST(waktu AS date)='=>date('Y-m-d')])->row_array();
				}
			}
		}
		return $output;
	}
	public function get_total_absensi($karyawan_id = 0,$status = 0)
	{
		$karyawan_id = intval($karyawan_id);
		$status      = intval($status);
		$instansi_id = $this->db->get_where('karyawan',['id'=>$karyawan_id])->row_array();
		if(!empty($instansi_id))
		{
			$instansi_id = $instansi_id['instansi_id'];
		}
		if(!empty($karyawan_id))
		{
			$this->db->select('id');
			if($status == 1)
			{
				$this->db->where(['karyawan_id'=>$karyawan_id,'instansi_id'=>$instansi_id,'status'=>1]);
				$this->db->or_where(['status'=>2]);
				$total = $this->db->get('absensi');
				$total = $total->num_rows();
				if ($total>1) {
					$total = $total/2;
				}
			}else{
				$this->db->where(['karyawan_id'=>$karyawan_id,'instansi_id'=>$instansi_id,'status'=>$status]);
				$total = $this->db->get('absensi');
				$total = $total->num_rows();
			}
			if(empty($total)){
				$total = 0;
			}
			output_json(['total'=>$total]);
		}
	}
}