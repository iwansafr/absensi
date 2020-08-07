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
			if(!empty($data['karyawan_id']) && !empty($data['instansi_id']))
			{

			}
		}
	}

	public function get_status()
	{
		$data_jam = $this->db->get_where('jam_absen',['name'=>'config_jam'])->row_array();
		$jam      = [];
		$jam_today = [];
		$jam_now = date('H:i',time());
		$hari_now = date('N');
		$hari = $this->hari();
		$output = [];
		if(!empty($data_jam['value']))
		{
			$jam = json_decode($data_jam['value'],1);
			$b1 = $jam['mulai_berangkat_'.$hari_now];
			$b2 = $jam['akhir_berangkat_'.$hari_now];
			$p1 = $jam['mulai_pulang_'.$hari_now];
			$p2 = $jam['akhir_pulang_'.$hari_now];

			$output['status'] = 'Off';
			$output['status_key'] = 5;
			$output['class'] = 'danger';

			if(($jam_now >= $b1) && ($jam_now <= $b2)){
				$output['status'] = 'Berangkat';
				$output['status_key'] = 1;
				$output['class'] = 'success';
			}
			if(($jam_now >= $b2) && ($jam_now <= $p1)){
				$output['status'] = 'Terlambat';
				$output['status_key'] = 3;
				$output['class'] = 'danger';
			}
			if(($jam_now >= $p1) && ($jam_now <= $p2)){
				$output['status'] = 'Pulang';
				$output['status_key'] = 4;
				$output['class'] = 'success';
			}
		}
		return $output;
	}
}