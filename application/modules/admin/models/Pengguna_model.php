<?php

class Pengguna_model extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	public function save()
	{
		$last_id = $this->zea->get_insert_id();
		$id = $this->input->get('id');
		if(!empty($last_id) || !empty($id))
		{
		  $last_id = !empty($id) ? $id : $last_id;
		  if(!empty($_POST))
		  {
	    	if((!empty($last_id)))
	    	{
	    		$pengguna_user = array(
	    			'username'     => @$_POST['username'],
	    			'password'     => encrypt(@$_POST['sandi']),
	    			'email'        => @$_POST['email'],
	    			'user_role_id' => $_POST['user_role_id'],
	    			'active'       => @intval($_POST['active']),
	    		);
	    		$this->zea->set_data('user', @intval($_POST['user_id']), $pengguna_user);
	    		if(empty($id))
	    		{
	    			$user_last_id = $this->zea->get_insert_id();
	    			$this->zea->set_data('user_instansi', $last_id, ['user_id'=>$user_last_id]);
	    		}
		    }
		  }
		}
	}
	public function delete()
	{
		if(!empty($_POST['del_row']))
		{
			$q = 'SELECT user_id FROM user_instansi WHERE ';
			$i = 0;
			foreach ($_POST['del_row'] as $key => $value) 
			{
				if($i>0)
				{
					$q .= ' OR id = ? ';
				}else{
					$q .= ' id = ? ';
				}
				$i++;
			}
			$user_ids_tmp = $this->db->query($q, $_POST['del_row'])->result_array();
			$user_ids = array();
			foreach ($user_ids_tmp as $key => $value) 
			{
				$user_ids[] = $value['user_id'];
			}
			$this->zea->del_data('user', $user_ids);
		}
	}
	public function get_instansi_id($user_id = 0)
	{
		if(empty($user_id))
		{
			$user_id = $_SESSION[base_url('_logged_in')]['id'];
		}
		$instansi = $this->db->query('SELECT instansi_id FROM user_instansi WHERE user_id = ?',$user_id)->row_array();
		if(!empty($instansi))
		{
			return $instansi['instansi_id'];
		}
	}
	public function get_pengguna_id($user_id = 0)
	{
		$user = $this->db->query('SELECT id FROM user_instansi WHERE user_id = ?',$user_id)->row_array();
		if(!empty($user))
		{
			return $user['id'];
		}
	}
}