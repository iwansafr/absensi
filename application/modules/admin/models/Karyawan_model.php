<?php defined('BASEPATH') or exit('No direct script access allowed');

class Karyawan_model extends CI_Model{
	public function update_user($karyawan_id = 0, $data = [])
	{
		pr($karyawan_id);
		$kary_role_exist = $this->get_kary_role_id();
		$kary_role_id = 0;
		if(empty($kary_role_exist)){
			if($this->db->insert('user_role',['title'=>'karyawan','description'=>'akun karyawan','level'=>6])){
				$kary_role_id = $this->db->insert_id();
			}
		}else{
			$kary_role_id = $kary_role_exist;
		}
		if(!empty($data['user_id'])){
			if($this->db->update('user',['username'=>$data['nip'],'email'=>$data['email'],'password'=>encrypt($password)],['id'=>$data['user_id']])){
				return true;
			}else{
				echo '<script>alert("pembuatan akun karyawan gagal")</script>';
			}
		}else{
			$strtime = strtotime($data['tgl_lahir']);
			$password = date('dmY', $strtime);
			if($this->db->insert('user',['username'=>$data['nip'],'email'=>$data['email'],'password'=>encrypt($password),'user_role_id'=>$kary_role_id,'active'=>1])){
				if($this->db->update('karyawan',['user_id'=>$this->db->insert_id()],['id'=>$karyawan_id])){
					return true;
				}
			}else{
				echo '<script>alert("pembuatan akun karyawan gagal")</script>';
			}	
		}
	}

	public function get_kary_role_id()
	{
		$get_kary_role = $this->db->query('SELECT id FROM user_role WHERE title = "karyawan"')->row();
		if(!empty($get_kary_role))
		{
			return $get_kary_role->id;
		}else{
			return false;
		}
	}

	public function delete_user($data = [])
	{
		if(!empty($data))
		{
			if(!empty($data['del_row']))
			{
				$this->db->select('user_id');
				$this->db->where_in(['id'=>$data['del_row']]);
				$user_ids_tmp = $this->db->get('karyawan')->result_array();
				$user_ids = [];
				if(!empty($user_ids_tmp))
				{
					foreach ($user_ids_tmp as $key => $value) 
					{
						$user_ids[] = $value['user_id']	;
					}
					$tmp_zea = new Zea();
					$tmp_zea->del_to_trash('user', $user_ids);
				}
			}
		}
	}
}