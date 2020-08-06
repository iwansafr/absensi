<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Absensi_model extends CI_Model
{
	public function status()
	{
		return ['1'=>'Berangkat','2'=>'Izin','3'=>'Terlambat','4'=>'Pulang','5'=>'Absen'];
	}
	public function hari()
	{
		return ['1'=>'Ahad','2'=>'Senin','3'=>'Selasa','4'=>'Rabu','5'=>'Kamis','6'=>'Jumat','7'=>'Sabtu'];
	}
}