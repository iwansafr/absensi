<?php


class Guru_model extends CI_Model
{
	public function get_profile($id = 0)
	{
		return $this->db->get_where('guru',['id'=>$id])->row_array();
	}
}