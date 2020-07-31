<?php


class Karyawan_model extends CI_Model
{
	public function get_profile($id = 0)
	{
		return $this->db->get_where('karyawan',['id'=>$id])->row_array();
	}
}